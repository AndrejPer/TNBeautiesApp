import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/home_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final fnameCntroller = TextEditingController();
  final lnameCntroller = TextEditingController();
  final emailCntroller = TextEditingController();
  final dateController = TextEditingController();
  final passwordCntroller = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: fnameCntroller,
                decoration: const InputDecoration(
                  hintText: 'First name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lnameCntroller,
                decoration: const InputDecoration(
                  hintText: 'Last name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailCntroller,
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
              ),
              TextField(
                readOnly: true,
                controller: dateController,
                decoration: const InputDecoration(
                  hintText: 'Date of birth',
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  dateController.text = date.toString().substring(0, 10);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Choose a password',
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
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing')));
                    registerUser();
                  }
                },
                child: const Text('Confirm'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future registerUser() async {
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/signup.php',
    );

    var data = {
      'first_name': fnameCntroller.text,
      'last_name': lnameCntroller.text,
      'email': emailCntroller.text,
      'birthday': dateController.text,
      'password': passwordCntroller.text,
    };

    http.Response response = await http.post(url, body: data);

    if (jsonDecode(response.body) == "Error - already registered") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Already registered'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sucessfully registered'),
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    }
  }
}
