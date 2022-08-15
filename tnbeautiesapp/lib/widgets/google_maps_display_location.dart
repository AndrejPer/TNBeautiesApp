import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/location.dart';

class GoogleMapsDisplayLocation extends StatefulWidget {
  final Location displayLocation;
  const GoogleMapsDisplayLocation({Key? key, required this.displayLocation})
      : super(key: key);

  @override
  State<GoogleMapsDisplayLocation> createState() =>
      _GoogleMapsDisplayLocationState();
}

class _GoogleMapsDisplayLocationState extends State<GoogleMapsDisplayLocation> {
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.displayLocation.latitude,
                  widget.displayLocation.longitude),
              zoom: 10),
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) => _controller = controller,
          tiltGesturesEnabled: false,
          markers: {
            Marker(
                markerId: MarkerId(widget.displayLocation.id.toString()),
                position: LatLng(widget.displayLocation.latitude,
                    widget.displayLocation.longitude),
                icon: BitmapDescriptor.defaultMarker)
          },
        ),
      ],
    );
  }
}
