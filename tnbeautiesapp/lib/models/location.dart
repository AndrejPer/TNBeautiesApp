import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final int id;
  String name;
  double latitude;
  double longitude;
  String description;
  LocationType type;

  Location(
      {required this.id,
      required this.name,
      required this.longitude,
      required this.latitude,
      required this.description,
      required this.type});

  double getLong() => longitude;
  LatLng get latlng => LatLng(latitude, longitude);
}

//Factory Location.fromJson(Map<String, dynamic> json) => null;

enum LocationType {
  city,
  neighborhood,
  barOrRestaurant,
  bedAndBreakfast,
  hotel
}
