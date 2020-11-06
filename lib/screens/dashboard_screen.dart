
import 'package:flutter/material.dart';

import './prevention_screen.dart';

import '../widgets/user_card.dart';

class DashboardScreen extends StatelessWidget {

  static const routeName='dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Arogya Dashboard Screen'),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert,),
              itemBuilder: (_) => [
              PopupMenuItem(
                  child: FlatButton(
                    child: Text('Covid Prevention Guide'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          PreventionGuideScreen.routeName,
                      );
                    },
                  ),
              ),
              PopupMenuItem(
                child: FlatButton(
                  child: Text('Edit My Info'),
                  onPressed: () {},
                ),
              )
            ],)
          ],
        ),
      body: GridView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 6/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (ctx, i) => UserCard(),
      ),
    );
  }
}
