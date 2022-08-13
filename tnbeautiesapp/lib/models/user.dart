class User {
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  DateTime _birthday;
  RoleType _role;
  int _locationID;

  User(this._id, this._firstName, this._lastName, this._email, this._birthday,
      this._role, this._locationID);
}

enum RoleType { registeredUser, administrator }
