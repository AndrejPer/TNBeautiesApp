import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/widgets/sign_up_form.dart';

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
          const SignUpForm(),
        ]),
      ),
    );
  }
}
