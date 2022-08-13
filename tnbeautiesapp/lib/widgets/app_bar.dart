import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const <Widget>[Icon(Icons.account_circle)],
    );
  }
}

class UserProfilePicture {}
