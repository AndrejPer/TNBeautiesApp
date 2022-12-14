import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/widgets/sign_up_form.dart';

import '../widgets/login_form.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: const TabBarView(children: [
          LoginForm(),
          SignUpForm(),
        ]),
      ),
    );
  }
}
