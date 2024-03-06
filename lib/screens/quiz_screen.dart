// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Screen for the quizes',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}
