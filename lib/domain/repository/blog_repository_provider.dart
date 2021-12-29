import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';

//final blogRepositoryProvider=

class BlogRepositoryProvider {
  static final RemoteDataSource _dataSource = RemoteDataSourceImpl();

  static Future<List<User>> getUsers() async {
    return await _dataSource.getUsers();
  }

  static Future<List<Post>> getPost() async {
    return await _dataSource.getPost();
  }

  static Future<User> createUser(User user) async {
    return await _dataSource.createUser(user);
  }
}
