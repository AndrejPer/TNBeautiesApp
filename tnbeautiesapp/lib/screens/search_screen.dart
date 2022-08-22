import 'package:flutter/material.dart';
import '../models/location.dart';
import '../widgets/search_widget.dart';
import 'location_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Location> locations = [];
  String query = '';

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
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationScreen(location: location),
            )),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search location',
        onChanged: searchLocation,
      );

  void searchLocation(String query) async {
    List<Location> list = [];
    var url = Uri(
      scheme: 'https',
      host: 'student.famnit.upr.si',
      path: '/~89201045/getLocationsByName.php',
    );

    var data = {'name': query};

    http.Response response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      final List<dynamic> resultArray = jsonDecode(response.body);
      for (var i in resultArray) {
        list.add(Location.fromJson(i));
      }
    }

    setState(() {
      locations = list;
      //_loaded = true;
    });
  }
}
