import 'package:flutter/material.dart';

import '../widgets/user_card.dart';

class DashboardScreen extends StatelessWidget {

  static const routeName='dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Arogya Dashboard Screen'),
        ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (ctx, i) => UserCard(),
      ),
    );
  }
}
