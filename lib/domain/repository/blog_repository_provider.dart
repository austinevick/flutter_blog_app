import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/user.dart';

//final blogRepositoryProvider=

class BlogRepositoryProvider {
  final RemoteDataSource dataSource = RemoteDataSourceImpl();

  Future<List<User>> getUsers() async {
    return await dataSource.getUsers();
  }
}
