import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../screens/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _logged = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  // this button is used to toggle the password visibility
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else
                    return '';
                },
              ),
              ElevatedButton(onPressed: userLogin, child: const Text('Log in'))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> userLogin() async {
    var data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/login.php',
    );

    var response = await http.post(url, body: data);
    var result = jsonDecode(response.body);

    if (result != "Error") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString("userJson", response.body);
      //print('stored: ${preferences.get('userJson')}');

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));

      return true;
    } else {
      //print('wrong');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrest credentials!')));
      return false;
    }
  }
}
