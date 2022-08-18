import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tnbeautiesapp/mocks/mock_location.dart';
import '../models/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  late GoogleMapController _controller;
  static const CameraPosition _ljubljanaPosition =
      CameraPosition(target: LatLng(46.061375, 14.506621), zoom: 8);
  bool _loaded = false;
  List<Location> locations = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getLocations();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _loaded
          ? GoogleMap(
              initialCameraPosition: _ljubljanaPosition,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (controller) => _controller = controller,
              tiltGesturesEnabled: false,
              markers: _buildMarkers(locations))
          : const Center(
              child: CircularProgressIndicator(),
            )
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

  Future<void> getLocations() async {
    List<Location> list = [];
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/getAllLocations.php',
    );

    http.Response response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> resultArray = jsonDecode(response.body);
      for (var i in resultArray) {
        list.add(Location.fromJson(i));
      }
    }

    setState(() {
      locations = list;
      _loaded = true;
    });
  }
}
