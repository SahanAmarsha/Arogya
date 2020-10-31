import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier{

  final User loadedUser = User(
      id: 'u1',
      name: 'Sahan Amarsha',
      address: 'Rendagedara Watta, Galle Road, Baddegama',
      age: 21,
      occupation: 'Student',
      status: 'Safe',
      nicNumber: '981231465V'
  );


  User get user {
    return loadedUser;
  }

  void addUser() {
    notifyListeners();
  }
}

