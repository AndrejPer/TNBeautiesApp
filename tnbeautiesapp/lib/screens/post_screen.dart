import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Flexible(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(),
              maxLength: 500,
              decoration: const InputDecoration.collapsed(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0)),
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ElevatedButton(
                    onPressed: null, child: Text('Add Photos')),
                ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                Text('Are you sure you want to post this?'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => publishPost(),
                                  child: Text('Yes')),
                            ],
                          );
                        }),
                    child: Text('Publish'))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future publishPost() async {
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/publishPost.php',
      port: 22,
    );

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? user = preferences.getString('userJson');

    String authorId = user == null ? '0' : jsonDecode(user)['id'];

    var data = {
      'publish_time': DateTime.now().toString(),
      'content': _controller.text,
      'author_id': authorId
    };

    http.Response response = await http.post(url, body: data);

    if (response.body == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Post published successfully!'),
      ));
    }
  }
}
