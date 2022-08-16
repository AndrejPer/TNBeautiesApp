import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentWidget extends StatelessWidget {
  final Comment comment;
  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getUser();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FutureBuilder(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  String? userName = snapshot.data;
                  return Text(userName!);
                } else {
                  return Text("Unknown");
                }
              }),
          Text(comment.content),
        ],
      ),
    );
  }

  Future<String> getUser() async {
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/getUser.php',
      port: 22,
    );

    http.Response response =
        await http.get(url, headers: {'id': comment.userID.toString()});

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return "${result['first_name']} ${result['last_name']}";
    } else {
      return "Andrej";
    }
  }
}
