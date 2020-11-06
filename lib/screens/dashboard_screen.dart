
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserCard(),
          SizedBox(
         height: 20,
          ),
          ButtonTheme(
            minWidth: 300,
            height: 60,
            child: RaisedButton(
              child:
              Text('Start Tracking', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                fontSize: 20
              ),),
              onPressed: () {

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding:
              EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              color: Theme.of(context).accentColor,
              textColor: Color.fromRGBO(31, 58, 147, 1.0),
            ),
          ),
        ],

      ),
    );
  }
}
