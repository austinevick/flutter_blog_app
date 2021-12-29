import 'dart:convert';

import 'package:flutter_blog_app/common/constant.dart';
import 'package:flutter_blog_app/data/data_source/api_client.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<List<User>> getUsers();
  Future<List<Post>> getPost();
  Future<User> createUser(User user);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient client = ApiClient();

  @override
  Future<List<User>> getUsers() async {
    final response = await client.get('user');
    List<dynamic> user = response['data'];
    print(user);
    return user.map((map) => User.fromMap(map)).toList();
  }

  @override
  Future<List<Post>> getPost() async {
    final response = await client.get('post');
    List<dynamic> post = response['data'];
    print(response);
    return post.map((map) => Post.fromMap(map)).toList();
  }

  @override
  Future<User> createUser(User user) async {
    final response = await post(Uri.parse('$baseUrl/user/create'),
        body: user.toMap(), headers: {'app-id': '61ca56b5d08ac8d55dc774a8'});
    if (response.statusCode == 201) {
      User user = jsonDecode(response.body);
      print(response);
      return user;
    } else {
      print(response.reasonPhrase);
    }
    return user;
  }
}
