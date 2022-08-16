import 'package:flutter/foundation.dart';

class User {
  final int id;
  String firstName;
  String lastName;
  String email;
  DateTime birthday;
  RoleType role;
  int? locationID;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.birthday,
      required this.role,
      required this.locationID});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: int.parse(json['id']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      birthday: DateTime.parse(json['birthday']),
      role: RoleType.values.firstWhere((e) => describeEnum(e) == json['role']),
      locationID:
          json['location_id'] == null ? null : int.parse(json['location_id']));
}

enum RoleType { registeredUser, administrator }
