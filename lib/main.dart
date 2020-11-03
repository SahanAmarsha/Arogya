import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/dashboard_screen.dart';
import './screens/user_details_screen.dart';
import './providers/user_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UserProvider(),
      child: MaterialApp(
          title: 'Arogya',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightGreenAccent,
            fontFamily: 'Lato',
          ),
          home: DashboardScreen(),
          routes: {
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
          }),
    );
  }
}
