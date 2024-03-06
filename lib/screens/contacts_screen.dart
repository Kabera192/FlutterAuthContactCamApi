// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, deprecated_member_use

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? contacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContacts();
  }

  void getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple[700], // Blend with previous colors
        ),
        body: (contacts == null)
            ? Center(
                child: Icon(
                  Icons.contacts,
                  size: 50,
                  semanticLabel: 'No Contactas Found',
                ),
              )
            : ListView.builder(
                itemCount: contacts?.length,
                itemBuilder: (BuildContext context, index) {
                  Uint8List? image = contacts![index].photo;
                  String number = (contacts![index].phones.isEmpty)
                      ? "---"
                      : contacts![index].phones.first.number;
                  return ListTile(
                    leading: (image == null)
                        ? CircleAvatar(
                            child: Icon(Icons.person),
                          )
                        : CircleAvatar(
                            backgroundImage: MemoryImage(image),
                          ),
                    title: Text(contacts![index].displayName),
                    subtitle: Text(number),
                    onTap: () async {
                      final launchUri = Uri(scheme: 'tel', path: number);
                      await launchUrl(launchUri);
                    },
                  );
                }));
  }
}
