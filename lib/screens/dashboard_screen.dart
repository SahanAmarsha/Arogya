import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

import '../widgets/user_card.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context)
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
          itemBuilder: (ctx, i) => UserCard(
            loadedUser.id,
            loadedUser.name,
            loadedUser.age,
          ),
      ),
    );
  }
}
