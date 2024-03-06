// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_project/screens/about_screen.dart';
import 'package:mobile_project/screens/calculator_screen.dart';
import 'package:mobile_project/screens/contacts_screen.dart';
import 'package:mobile_project/screens/quiz_screen.dart';
import 'package:mobile_project/services/app_theme.dart';
import 'package:mobile_project/services/side_drawer.dart';
import 'package:provider/provider.dart';
// import 'package:mobile_project/screens/about_screen.dart';
// import 'package:mobile_project/screens/calculator_screen.dart';
// import 'package:mobile_project/screens/contacts_screen.dart';

class HomeScreenLoggedIn extends StatefulWidget {
  const HomeScreenLoggedIn({super.key});

  @override
  _HomeScreenLoggedInState createState() => _HomeScreenLoggedInState();
}

class _HomeScreenLoggedInState extends State<HomeScreenLoggedIn> {
  final user = FirebaseAuth.instance.currentUser;
  int _index = 0;

  final List<Widget> _tabs = [
    HomeScreenLoggedIn(),
    AboutScreen(),
    CalculatorView(),
    ContactsScreen(),
    QuizScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[700], // Blend with previous colors
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              ThemeProvider themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.swapTheme();
            },
          ),
        ],
      ),
      drawer: SideDrawer(),
      //body: _tabs.elementAt(_index),
      bottomNavigationBar: GNav(
        activeColor: Colors.purple[700],
        selectedIndex: _index,
        onTabChange: (index) => setState(() {
          _index = index;
        }),
        tabs: [
          GButton(
            icon: Icons.home,
            //text: 'Home',
          ),
          GButton(
            icon: Icons.info,
            //text: 'About',
          ),
          GButton(
            icon: Icons.calculate,
            //text: 'Calc',
          ),
          GButton(
            icon: Icons.contacts,
            //text: 'Contacts',
          ),
          GButton(
            icon: Icons.quiz,
            //text: 'Quiz',
          ),
        ],
      ),
    );
  }
}
