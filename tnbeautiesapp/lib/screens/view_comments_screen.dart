import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../models/comment.dart';
import '../models/post.dart';
import '../widgets/comment_widget.dart';

class ViewCommentsScreen extends StatefulWidget {
  final Post post;
  final String name;
  const ViewCommentsScreen({Key? key, required this.post, required this.name})
      : super(key: key);

  @override
  State<ViewCommentsScreen> createState() => _ViewCommentsScreenState();
}

class _ViewCommentsScreenState extends State<ViewCommentsScreen> {
  late List<Comment> comments;
  bool _loaded = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getComments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          buildPost(widget.post),
          _loaded
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) =>
                            CommentWidget(comment: comments[index])),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayCommentInputDialog,
        child: const Icon(Icons.fax),
      ),
    );
  }

  Widget buildPost(Post post) =>
      ListTile(title: Text(post.content), subtitle: Text(widget.name));

  Future getComments() async {
    List<Comment> list = [];
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/getCommentOnPost.php',
    );

    var data = {'post_id': widget.post.id.toString()};

    http.Response response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      //since we will just get a collection of jsons
      final resultArray = jsonDecode(response.body);

      //print('${resultArray[0]} and ${resultArray[1]}');
      for (var i in resultArray) {
        list.add(Comment.fromJson(i));
      }
    }

    setState(() {
      comments = list;
      _loaded = true;
    });
  }

  Future<void> displayCommentInputDialog() {
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Add comment'),
              content: TextField(
                controller: controller,
              ),
              actions: [
                ElevatedButton(onPressed: postComment, child: const Text('Add'))
              ],
            )));
  }

  Future<void> postComment() async {
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/postCommentOnPost.php',
    );

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? user = preferences.getString('userJson');

    String authorId = user == null ? '0' : jsonDecode(user)['id'];
    //print('autor is $authorId');

    var data = {
      'publish_time': DateTime.now().toString(),
      'content': controller.text,
      'author_id': authorId,
      'post_id': widget.post.id.toString()
    };

    http.Response response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      //print('success');
    }

    setState(() {
      Navigator.pop(context);
    });
  }
}
