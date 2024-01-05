import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text(
          'This is the About Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
