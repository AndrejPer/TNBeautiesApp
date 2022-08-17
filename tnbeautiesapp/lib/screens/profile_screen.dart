import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

import '../models/user.dart';
import '../screens/home_page.dart';

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
          ? 'Andrej Perkovic'
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
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(10.0),
        child:
            FloatingActionButton(onPressed: () => , child: Icon(Icons.settings)),
      ),
    );
  }

  Widget buildPost(Post post) => ListTile(
        title: Text(userName),
        subtitle: Text(post.content),
        trailing: ElevatedButton(
          onPressed: null,
          child: Text('Comment'),
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
    //var id = jsonDecode(preferences.getString('userJson')!)['id'];

    //TODO: correct id to actual
    var data = {'author_id': '1'};

    http.Response response = await http.post(url, body: data);
    print(response.body);

    if (response.statusCode == 200) {
      //since we will just get a collection of jsons
      final List<dynamic> resultArray = jsonDecode(response.body);
      //print('${resultArray[0]} and ${resultArray[1]}');
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
