import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:flutter_blog_app/domain/repository/blog_repository_provider.dart';
import 'package:flutter_blog_app/screens/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final blogFutureProvider = FutureProvider((ref) async {
  return ref.read(blogRepositoryProvider).getPost();
});

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final post = ref.watch(blogFutureProvider);
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Blog post'),
            ),
            drawer: Drawer(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => SignUpScreen())),
                      title: Text('Sign Up'),
                    )
                  ],
                ),
              ),
            ),
            body: post.when(
                data: (p) => GridView.builder(
                      itemCount: p.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, i) => Container(
                        child: CachedNetworkImage(
                          imageUrl: p[i].image!,
                          placeholder: (context, url) =>
                              const SpinKitRotatingCircle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                error: (error, stackTrace) => const Center(
                      child: Text('Error loading post'),
                    ),
                loading: () => const SpinKitCircle(
                      color: Colors.lightBlue,
                    ))),
      );
    });
  }
}
