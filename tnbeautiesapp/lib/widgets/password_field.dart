import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Choose a password',
        // this button is used to toggle the password visibility
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
      ),
      obscureText: _isObscure,
      validator: (value) {
        RegExp regExp = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$');
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid password (Capital letter, number, symbole)';
        }
        return null;
      },
    );
  }
}
