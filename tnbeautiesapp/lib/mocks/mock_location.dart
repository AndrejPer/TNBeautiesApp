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
      description:
          'Ljubljana (also known by other historical names) is the capital and largest city of Slovenia. It is the country\'s cultural, educational, economic, political and administrative center. During antiquity, a Roman city called Emona stood in the area. Ljubljana itself was first mentioned in the first half of the 12th century. Situated at the middle of a trade route between the northern Adriatic Sea and the Danube region, it was the historical capital of Carniola, one of the Slovene-inhabited parts of the Habsburg monarchy. It was under Habsburg rule from the Middle Ages until the dissolution of the Austro-Hungarian Empire in 1918. After World War II, Ljubljana became the capital of the Socialist Republic of Slovenia, part of the Socialist Federal Republic of Yugoslavia. The city retained this status until Slovenia became independent in 1991 and Ljubljana became the capital of the newly formed state.',
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
