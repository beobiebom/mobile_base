import 'package:test_sqlite/core/constants/sql_name.dart';

class User {
  String firstName;
  String lastName;
  String phone;
  String email;
  String avatar;

  User(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.avatar});

  factory User.fromMap(Map<String, dynamic> mapUser) => User(
      firstName: mapUser[SqlName.columnFirstName],
      lastName: mapUser[SqlName.columnLastName],
      phone: mapUser[SqlName.columnPhone],
      email: mapUser[SqlName.columnEmail],
      avatar: mapUser[SqlName.columnAvatar]);
}
