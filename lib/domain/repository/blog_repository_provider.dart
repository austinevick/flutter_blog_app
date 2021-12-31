import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRepositoryProvider = Provider((ref) => BlogRepositoryProvider());

class BlogRepositoryProvider {
  static final RemoteDataSource _dataSource = RemoteDataSourceImpl();

  Future<List<User>> getUsers() async {
    return await _dataSource.getUsers();
  }

  Future<List<Post>> getPost() async {
    return await _dataSource.getPost();
  }

  Future<User> createUser(User user) async {
    return await _dataSource.createUser(user);
  }
}
