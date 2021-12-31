import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:flutter_blog_app/domain/repository/blog_repository_provider.dart';
import 'package:flutter_blog_app/screens/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

<<<<<<< HEAD
final blogFutureProvider = FutureProvider((ref) async {
  return ref.read(blogRepositoryProvider).getPost();
});
=======
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final baseUrl = 'https://dummyapi.io/data/v1';
  final appId = '61ca56b3d08ac849fac774a5';

  // List<Post> posts = [];
  // Future<List<Post>> getPost() async {
  //   final Future<List<Post>> post = _dataSource.getPost();
  //   await post.then((value) {
  //     setState(() => posts = value);
  //   });
  //   return posts;
  // }
>>>>>>> 7086db79807a707a4c714a203f69c18215ae8699

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
