import 'package:flutter/material.dart';

Widget calcButton(
    String buttonText, Color buttonColor, void Function()? buttonPressed) {
  return Container(
      width: 75,
      height: buttonText == '=' ? 150 : 70,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
          onPressed: buttonPressed,
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: buttonColor),
          child: Text(buttonText,
              style: const TextStyle(fontSize: 27, color: Colors.black))));
}