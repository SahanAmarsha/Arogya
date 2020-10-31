import 'package:flutter/material.dart';

import '../screens/user_details_screen.dart';

class UserCard extends StatelessWidget {

  final String id;
  final String name;
  final int age;
  final String avatarImage =  '';

  UserCard(this.id, this.name, this.age);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
              UserDetailsScreen.routeName,
              arguments: id
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
          child: Text(
            'Your Info'
          ),
        ),
      ),
      footer: GridTileBar(
        leading: Icon(
          Icons.person,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Colors.black54,
        title: Text(
          name,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
