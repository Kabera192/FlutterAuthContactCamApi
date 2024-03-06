// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_project/components/gradient_button.dart';
import 'package:mobile_project/components/text_field.dart';
import 'package:mobile_project/screens/home_logged_in.dart';
import 'package:mobile_project/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Placeholder for SVG
            // Add your SVG here
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SvgPicture.asset(
                'assets/images/login.svg',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),

            // Text fields
            TextFieldWidget(
              hintText: 'example@domain.com',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 10),
            // Forgot password link
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 12),
              ),
            ),

            SizedBox(height: 20),

            // Login button
            GradientButton(
                text: 'Login',
                onPressed: () {
                  // Handle login button press
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreenLoggedIn()));
                },
                backgColor: Colors.purple,
                txtColor: Colors.white),

            SizedBox(height: 20),

            GradientButton(
                text: 'Register',
                onPressed: () {
                  // Handle login button press
                },
                backgColor: Colors.white,
                txtColor: Colors.purple),

            SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                AuthService().signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.grey[200], // Blend with the gradient
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Placeholder for Google logo
                  // Add your Google logo here
                  Image.asset(
                    'assets/images/google_logo.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
