import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/screens/profile_screen.dart';
import './post_screen.dart';
import './search_screen.dart';
import '../widgets/google_maps_widget.dart';
import '../mocks/mock_location.dart';

import '../models/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = const [
    GoogleMapsWidget(),
    SearchScreen(),
    PostScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 1, milliseconds: 500),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.map_outlined),
                selectedIcon: Icon(Icons.map),
                label: 'Map'),
            NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.content_paste_search_outlined),
                label: 'Search'),
            NavigationDestination(
                icon: Icon(Icons.feed_outlined),
                selectedIcon: Icon(Icons.feed),
                label: 'Post'),
            NavigationDestination(
                icon: Icon(Icons.account_box_outlined),
                selectedIcon: Icon(Icons.account_box),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
