class Location {
  int _id;
  String _name;
  double _longitude;
  double _latitude;
  String _description;
  LocationType _type;

  Location(this._id, this._name, this._longitude, this._latitude,
      this._description, this._type);

  double getLong() => _longitude;
}

enum LocationType {
  city,
  neighborhood,
  barOrRestaurant,
  bedAndBreakfast,
  hotel
}
