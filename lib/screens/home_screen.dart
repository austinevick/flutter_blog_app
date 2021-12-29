import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data/data_source/remote_data_source.dart';
import 'package:flutter_blog_app/data/model/post.dart';
import 'package:flutter_blog_app/data/model/user.dart';
import 'package:flutter_blog_app/domain/repository/blog_repository_provider.dart';
import 'package:flutter_blog_app/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // static final RemoteDataSource _dataSource = RemoteDataSourceImpl();

  // List<Post> posts = [];
  // Future<List<Post>> getPost() async {
  //   final Future<List<Post>> post = _dataSource.getPost();
  //   await post.then((value) {
  //     setState(() => posts = value);
  //   });
  //   return posts;
  // }

  // @override
  // void initState() {
  //   getPost();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
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
          body: FutureBuilder<List<User>>(
              future: BlogRepositoryProvider.getUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return Column(
                      children: [
                        // Image.network(user.picture!,
                        //     fit: BoxFit.cover,
                        //     height: 300,
                        //     width: double.infinity),
                        Text('${user.firstName!} ${user.lastName}'),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: List.generate(
                        //         user.tags!.length,
                        //         (i) => Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Text(user.tags![i]),
                        //             ))),
                      ],
                    );
                  },
                );
              })),
    );
  }
}

/*


*/
