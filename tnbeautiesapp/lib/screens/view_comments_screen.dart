import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/comment.dart';
import '../widgets/comment_widget.dart';

class ViewCommentsScreen extends StatelessWidget {
  final List<Comment> comments;
  const ViewCommentsScreen({Key? key, required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ListView.builder(
          itemBuilder: (context, index) =>
              CommentWidget(comment: comments[index])),
    ));
  }
}
