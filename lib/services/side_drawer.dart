// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_project/services/utils.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final int _selectedTabIndex = 0;

  final user = FirebaseAuth.instance.currentUser;

  Uint8List? profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            shrinkWrap: true,
            children: [
              // UserAccountsDrawerHeader(
              //   accountName: Text(user!.displayName!),
              //   accountEmail: Text(user!.email!),
              //   currentAccountPicture: Image.network(user!.photoURL!),
              // ),
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple[700], // Blend with previous colors
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mon-Quiz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          profilePic != null
                              ? CircleAvatar(
                                  radius: 40,
                                  child: IconButton(
                                    onPressed: _selectImage,
                                    icon: Icon(Icons.camera_alt),
                                    padding: EdgeInsets.fromLTRB(60, 50, 0, 0),
                                    tooltip: 'Change Profile Picture',
                                  ),
                                  backgroundImage: MemoryImage(
                                      profilePic!), // Add the user's profile picture here
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  child: IconButton(
                                    onPressed: _selectImage,
                                    icon: Icon(Icons.camera_alt),
                                    padding: EdgeInsets.fromLTRB(60, 50, 0, 0),
                                    tooltip: 'Change Profile Picture',
                                  ),
                                  backgroundImage: NetworkImage(user!
                                      .photoURL!) // Add the user's profile picture here
                                  ),
                          Column(
                            children: [
                              Text(
                                user!.displayName!,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                user!.email!,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                selected: _selectedTabIndex == 0,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homePage');
                  //_navigateToTab(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                selected: _selectedTabIndex == 1,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/aboutPage');
                  //_navigateToTab(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Calculator'),
                selected: _selectedTabIndex == 2,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/calcPage');
                  //_navigateToTab(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contacts'),
                selected: _selectedTabIndex == 3,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/contactsPage');
                  //_navigateToTab(3);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: signUserOut,
              ),
              // Add additional items for drawer navigation as needed
            ],
          ),
        ),
      ),
    );
  }

  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      profilePic = img;
    });
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
