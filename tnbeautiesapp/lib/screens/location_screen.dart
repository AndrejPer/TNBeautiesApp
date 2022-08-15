import 'package:flutter/material.dart';
import 'package:tnbeautiesapp/widgets/google_maps_display_location.dart';

import '../models/location.dart';

class LocationScreen extends StatelessWidget {
  final Location location;
  const LocationScreen({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          DecsriptionText(location: location),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Scaffold(
                          appBar: AppBar(title: Text(location.name)),
                          body: GoogleMapsDisplayLocation(
                            displayLocation: location,
                          ),
                        )),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              child: const Icon(Icons.map),
            ),
          ),
        ]),
      ),
    );
  }
}

class DecsriptionText extends StatelessWidget {
  const DecsriptionText({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        location.description,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
