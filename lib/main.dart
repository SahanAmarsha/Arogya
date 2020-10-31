import 'package:arogya/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

import 'screens/auth_screen.dart';

import 'screens/splash_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/user_details_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth,UserProvider>(
            //create: (ctx)=> ProductProvider(),
            update: (ctx, auth, previousUserProvider) => UserProvider(
              auth.token,
              previousUserProvider == null? [] : previousUserProvider.user,
              auth.userId,
            ),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            //create: (ctx)=> ProductProvider(),
            update: (ctx, auth, previousOrders) => Orders(
                auth.token, auth.userId, previousOrders == null? [] : previousOrders.orders
            ),
          ),
        ],
        child: Consumer<Auth>(builder: (ctx, auth, _) =>MaterialApp(
          title: 'Arogya App',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'
          ),
          home: auth.isAuth
              ? DashboardScreen()
              : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (ctx, authResultSnapshot) =>
            authResultSnapshot.connectionState ==
                ConnectionState.waiting
                ? SplashScreen()
                : AuthScreen(),
//
//          auth.isAuth
//              ? ProductsOverviewScreen()
//              : FutureBuilder(
//                  future: auth.tryAutoLogin(),
//                  builder: (ctx, authResultSnapShot) =>
//                  authResultSnapShot.connectionState == ConnectionState.waiting
//                      ? SplashScreen()
//                      : AuthScreen(),
          ),
          routes: {
            UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
          },
        ),
        )
    );
  }
}
