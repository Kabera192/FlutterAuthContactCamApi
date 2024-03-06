// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_project/components/gradient_button.dart';
import 'package:mobile_project/components/text_field.dart';
import 'package:mobile_project/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: usernameController,
              hintText: 'example@domain.com',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Confirm Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 10),

            SizedBox(height: 20),

            GradientButton(
                text: 'Register',
                onPressed: () async {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: usernameController.text,
                      password: passwordController.text);
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
