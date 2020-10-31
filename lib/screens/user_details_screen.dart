import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {

  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context).settings.arguments as String;

    //get user information

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Details'),
      ),
    );
  }
}
