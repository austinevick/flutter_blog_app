import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/blog_remote_data_source/remote_data_source.dart';

import 'screens/home_screen.dart';

void main() {
  // RemoteDataSourceImpl().getUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
