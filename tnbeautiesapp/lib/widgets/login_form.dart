import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter email',
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
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future userLogin() async {
    //String email = _emailController.text;
    //String password = _passwordController.text;

    String email = 'andrej.email.com';
    String password = 'P4ssword?';

    var data = {'email': email, 'password': password};
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/login.php',
    );

    return http.post(url, body: data).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      print('code good');
      print(response.body);
      return User.fromJson(json.decode(response.body));
    });
  }

  Future getData() async {
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/login.php',
    );
    // 'https://student.famnit.upr.si/~89201045/get.php';

    http.Response response = await http.get(url);
    print(response.statusCode);

    var user = User.fromJson(jsonDecode(response.body));
    print(user);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    Future user = userLogin();
  }
}
