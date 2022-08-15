import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tnbeautiesapp/mocks/mock_location.dart';

import '../models/location.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  late GoogleMapController _controller;
  static const CameraPosition _ljubljanaPosition =
      CameraPosition(target: LatLng(46.061375, 14.506621), zoom: 10);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
          initialCameraPosition: _ljubljanaPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) => _controller = controller,
          tiltGesturesEnabled: false,
          markers: _buildMarkers(allLocations))
    ]);
  }

  Set<Marker> _buildMarkers(List<Location> location) {
    print('building marker on ${location[0].name}');
    Set<Marker> markersToReturn = location
        .map((element) => Marker(
            markerId: MarkerId(element.id.toString()),
            position: LatLng(element.latitude, element.longitude),
            icon: BitmapDescriptor.defaultMarker))
        .toSet();
    print(markersToReturn);
    return markersToReturn;
  }
}
