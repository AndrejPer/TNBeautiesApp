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

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: int.parse(json['id']),
        name: json['name'],
        longitude: double.parse(json['longitude']),
        latitude: double.parse(json['latitude']),
        description: json['description'],
        type: LocationType.values
            .firstWhere((e) => describeEnum(e) == json['type']),
      );
}

enum LocationType {
  city,
  neighborhood,
  barOrRestaurant,
  bedAndBreakfast,
  hotel
}
