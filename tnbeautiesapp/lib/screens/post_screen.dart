import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              style: TextStyle(),
              maxLength: 500,
              decoration: InputDecoration.collapsed(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0)),
              ),
            ),
          ),
          Container(
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: null, child: Text('Add Photos')),
                ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                Text('Are you sure you want to post this?'),
                            actions: [
                              ElevatedButton(
                                  onPressed: null, child: Text('Yes'))
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
}
