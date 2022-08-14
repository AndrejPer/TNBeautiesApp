import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/location.dart';

class MarkerFromLocation extends StatelessWidget {
  final Location location;
  const MarkerFromLocation({Key? key, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); //Marker(point: LatLng(location.));
  }
}
