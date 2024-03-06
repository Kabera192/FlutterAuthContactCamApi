// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'About Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[700],
      ),
      body: Center(
        child: Text('Welcome to the About Page'),
      ),
    );
  }
}
