// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mobile_project/screens/about_screen.dart';
import 'package:mobile_project/screens/calculator_screen.dart';
import 'package:mobile_project/screens/contacts_screen.dart';
import 'package:mobile_project/screens/home_logged_in.dart';
import 'package:mobile_project/screens/welcome_screen.dart';
import 'package:mobile_project/services/app_theme.dart';
import 'package:mobile_project/services/auth_page.dart';
import 'package:mobile_project/services/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) => ThemeProvider(
            isDarkMode: prefs.getBool("isDarkTheme") ?? false,
          )));
  DependencyInjection.init();

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        home: AuthPage(),
        routes: {
          '/homePage': (context) => HomeScreenLoggedIn(),
          '/calcPage': (context) => CalculatorView(),
          '/aboutPage': (context) => AboutScreen(),
          '/welcomePage': (context) => HomeScreen(),
          '/contactsPage': (context) => ContactsScreen(),
        },
      );
    }
    );
  }
}
