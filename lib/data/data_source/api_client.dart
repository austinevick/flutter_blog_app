import 'dart:convert';
import 'dart:io';

import 'package:flutter_blog_app/common/constant.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client client = Client();

  Future get(String path) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/$path'),
          headers: {'app-id': '61ca56b5d08ac8d55dc774a8'});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } on SocketException {
      print('No network connection');
      throw Exception('No network connection');
    }
  }
}
