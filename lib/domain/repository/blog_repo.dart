import 'package:flutter_blog_app/data/blog_remote_data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/user.dart';
// final blogRepo =
class BlogRepo{
  RemoteDataSource dataSource = RemoteDataSourceImpl();


  Future<List<User>>getUser()async{
    return await dataSource.getUsers();
  }
}