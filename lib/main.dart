import 'package:arogya/screens/add_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/prevention_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/user_details_screen.dart';
import './providers/user_provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserProvider(),
      child: MaterialApp(
          title: 'Arogya',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightGreenAccent,
            fontFamily: 'Lato',
          ),
          home: AddUserScreen(),
          routes: {
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
            PreventionGuideScreen.routeName: (ctx) => PreventionGuideScreen(),
            AddUserScreen.routeName: (ctx) => AddUserScreen()
          }),
    );
  }
}
