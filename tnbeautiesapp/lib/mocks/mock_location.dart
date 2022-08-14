import 'package:tnbeautiesapp/models/location.dart';

abstract class MockLocation implements Location {
  static Location FetchAny() {
    return Location(0, 'Ljubljana', 46.061375, 14.506621, 'Capital of Slovenia',
        LocationType.city);
  }
}
