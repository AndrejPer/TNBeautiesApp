import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/signupform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void answerQuestion() {
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Log in',
                ),
                Tab(
                  text: 'Sign up',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Form(
              key: null,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter username',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter password',
                    ),
                  )
                ],
              ),
            ),
            SignUpForm(),
          ]),
        ),
      ),
    );
  }
}
