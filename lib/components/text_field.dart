// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final controller;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
      ),
      obscureText: obscureText,
    );
  }
}
