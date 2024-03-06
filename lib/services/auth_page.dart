// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/screens/home_logged_in.dart';
import 'package:mobile_project/screens/welcome_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // When USer is logged in!
          if (snapshot.hasData) {
            return HomeScreenLoggedIn();
          }
          // When User is not logged in
          else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
