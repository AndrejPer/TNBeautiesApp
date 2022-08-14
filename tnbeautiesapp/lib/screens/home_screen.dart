import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:latlong2/latlong.dart';
import 'package:tnbeautiesapp/screens/mocks/mock_location.dart';

import '../models/location.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Location ljubljana = MockLocation.FetchAny();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(46.061375, 14.506621),
              zoom: 10.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: [
                Marker(
                    point: LatLng(46.061375, 14.506621),
                    builder: (context) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        )),
              ])
            ],
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
