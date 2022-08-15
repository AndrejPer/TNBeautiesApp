import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../mocks/mock_location.dart';
import '../models/location.dart';
import '../widgets/searc_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Location> locations;
  String query = '';

  @override
  void initState() {
    super.initState();
    locations = allLocations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        buildSearch(),
        Expanded(
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: ((context, index) {
                final location = locations[index];
                return buildLocation(location);
              })),
        ),
      ],
    ));
  }

  Widget buildLocation(Location location) => ListTile(
        leading: const Icon(Icons.location_city),
        title: Text(location.name),
        subtitle: Text(location.description),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Center(
                    child: Text(location.name),
                  )),
        ),
      );

  buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search location',
        onChanged: searchLocation,
      );

  void searchLocation(String query) {
    final suggestions = allLocations.where((location) {
      final locationName = location.name.toLowerCase();
      final input = query.toLowerCase();

      return locationName.contains(input);
    }).toList();

    setState(() {
      locations = suggestions;
    });
  }
}
