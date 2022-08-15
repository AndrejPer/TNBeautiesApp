import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tnbeautiesapp/models/photo.dart';

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
      body: Column(children: [
        DecsriptionText(location: location),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Center(
                      child: Text('Map with pin'),
                    )),
          ),
          child: const Icon(Icons.map),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
        ),
      ]),
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
