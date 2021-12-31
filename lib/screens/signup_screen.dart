import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:flutter_blog_app/domain/repository/blog_repository_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final email = TextEditingController();
  bool isLoading = false;
  void createUser() async {
    setState(() => isLoading = true);
    final user =
        User(firstName: fName.text, lastName: lName.text, email: email.text);
    try {
      setState(() => isLoading = false);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              TextField(
                controller: fName,
                decoration: const InputDecoration(hintText: 'First name'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: lName,
                decoration: const InputDecoration(hintText: 'Last name'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: email,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      createUser();
                    },
                    child: isLoading
                        ? Text('Loading...')
                        : Text('Create Account')),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
