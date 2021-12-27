import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final baseUrl = 'https://dummyapi.io/data/v1';
  final appId = '61c876be4b10eaabd3cc6e66';

  queryData() async {
    final response =
        await get(Uri.parse('$baseUrl/tag'), headers: {'app-id': appId});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    queryData();
    return Container();
  }
}