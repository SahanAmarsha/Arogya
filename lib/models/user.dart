import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String address;
  final int age;
  final String occupation;
  final String status;
  final String nicNumber;

  User({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.age,
    @required this.occupation,
    @required this.status,
    @required this.nicNumber
  });


}
