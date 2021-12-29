import 'dart:convert';
import 'dart:io';

import 'package:flutter_blog_app/common/constant.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource{
  Future<List<User>>getUsers();
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final Client client = Client();
  @override
  Future<List<User>> getUsers()async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/user'),
    headers: {'app-id': '61ca56b3d08ac849fac774a5'});
    if(response.statusCode==200){
     final data = jsonDecode(response.body);
     List<dynamic> list = data['data'];
     print(list);
     return list.map((map) =>User.fromMap(map)).toList();
         }else{
           throw Exception('unable to get data');
         }
    } on SocketException{
      print('no network connection');
      throw Exception('no network connection');
    }
  }
}