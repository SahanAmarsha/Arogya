import 'package:arogya/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {

  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context).settings.arguments as String;
    final loadedUser = Provider.of<UserProvider>(context, listen: false).user;

    //get user information

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Details'),
      ),
    );
  }
}
