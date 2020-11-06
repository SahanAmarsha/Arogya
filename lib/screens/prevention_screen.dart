import 'package:flutter/material.dart';

class PreventionGuideScreen extends StatelessWidget {
  static const routeName = '/prevention-guide';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Prevention Guideline'),
      ),
      body: Center(
        child: Text('Covid Prevention Details'),
      ),
    );
  }
}
