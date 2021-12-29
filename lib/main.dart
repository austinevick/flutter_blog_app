import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/blog_remote_data_source/remote_data_source.dart';
import 'package:http/http.dart';

import 'common/constant.dart';
import 'data/data_source/remote_data_source.dart';
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

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  getData() async {
    final response = await post(Uri.parse('$baseUrl/user/create'), body: {
      'firstName': 'John',
      'lastName': 'Chukwu',
      'email': 'john20254124@gmail.com'
    }, headers: {
      'app-id': '61ca56b5d08ac8d55dc774a8'
    });
    print(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container();
  }
}
