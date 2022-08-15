import 'package:tnbeautiesapp/models/location.dart';

abstract class MockLocation implements Location {
  static Location FetchAny() {
    return Location(
        id: 0,
        name: 'Ljubljana',
        longitude: 46.061375,
        latitude: 14.506621,
        description: 'Capital of Slovenia',
        type: LocationType.city);
  }
}

final allLocations = <Location>[
  Location(
      id: 0,
      name: 'Ljubljana',
      longitude: 46.061375,
      latitude: 14.506621,
      description: 'Capital of Slovenia',
      type: LocationType.city),
  Location(
      id: 1,
      name: 'Kranj',
      longitude: 46.233333,
      latitude: 14.366667,
      description: 'Cool city close to Ljubljana',
      type: LocationType.city),
  Location(
      id: 2,
      name: 'Koper',
      longitude: 45.55,
      latitude: 13.733333,
      description: 'Beautiful seaside city',
      type: LocationType.city),
];
