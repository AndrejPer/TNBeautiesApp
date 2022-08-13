import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.account_circle))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.home)),
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          IconButton(onPressed: null, icon: Icon(Icons.dangerous_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}
