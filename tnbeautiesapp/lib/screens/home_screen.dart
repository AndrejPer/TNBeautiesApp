import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tnbeautiesapp/widgets/google_maps_widget.dart';
import '../mocks/mock_location.dart';

import '../models/location.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Location ljubljana = MockLocation.FetchAny();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Stack(
        children: const [
          GoogleMapsWidget(),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
