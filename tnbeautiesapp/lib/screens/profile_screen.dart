import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnbeautiesapp/screens/view_comments_screen.dart';
import 'package:tnbeautiesapp/screens/welcome_screen.dart';
import '../models/post.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<Post> posts;
  late String userName;
  bool _loaded = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getPosts();

      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? user = pref.getString('userJson');
      userName = user == null
          ? 'Unknown'
          : jsonDecode(user)['first_name'] +
              " " +
              jsonDecode(user)['last_name'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loaded
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return buildPost(post);
                    }),
              )
            : const Center(child: CircularProgressIndicator()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            child: const Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const WelcomeScreen()),
              );
            },
          ),
        ));
  }

  Widget buildPost(Post post) => ListTile(
        title: Text(post.content),
        subtitle: Text(userName),
        trailing: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewCommentsScreen(
                        post: post,
                        name: userName,
                      ))),
          child: const Text('Comments'),
        ),
      );

  Future getPosts() async {
    List<Post> list = [];
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/getPostsOfUser.php',
    );

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = jsonDecode(preferences.getString('userJson')!)['id'];

    var data = {'author_id': id.toString()};

    http.Response response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      //since we will just get a collection of jsons
      final List<dynamic> resultArray = jsonDecode(response.body);
      for (var i in resultArray) {
        list.add(Post.fromJson(i));
      }
    }

    setState(() {
      posts = list;
      _loaded = true;
    });
  }
}
