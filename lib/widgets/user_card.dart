import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../screens/user_details_screen.dart';

class UserCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context, listen: false,);
    final user = userData.user;
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
              UserDetailsScreen.routeName,
              arguments:user.id
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            children: [
              Text(
                'Your Info',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Theme.of(context).accentColor,
                    size: 50,
                  ),
                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                    ),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
