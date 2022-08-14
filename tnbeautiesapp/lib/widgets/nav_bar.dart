import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const <Widget>[
        IconButton(onPressed: null, icon: Icon(Icons.home)),
        IconButton(onPressed: null, icon: Icon(Icons.search)),
        IconButton(onPressed: null, icon: Icon(Icons.account_box)),
        IconButton(onPressed: null, icon: Icon(Icons.settings))
      ],
    );
  }
}
