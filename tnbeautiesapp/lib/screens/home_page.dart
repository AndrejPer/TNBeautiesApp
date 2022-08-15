import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/screens/search_screen.dart';
import 'package:tnbeautiesapp/widgets/google_maps_widget.dart';
import '../mocks/mock_location.dart';

import '../models/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Location ljubljana = MockLocation.FetchAny();

  int index = 0;

  final screens = const [
    GoogleMapsWidget(),
    SearchScreen(),
    Center(child: Text('Profile')),
    Center(child: Text('Settings'))
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
                icon: Icon(Icons.account_box_outlined),
                selectedIcon: Icon(Icons.account_box),
                label: 'Profile'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
