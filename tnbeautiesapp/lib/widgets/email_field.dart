import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Email address',
      ),
      validator: (value) {
        RegExp emailExp = RegExp(
            r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$');
        if (value == null || value.isEmpty) {
          return 'Please enter your email adress';
        } else if (!emailExp.hasMatch(value)) {
          return 'Please enter a valid adress';
        }
        return null;
      },
    );
  }
}
