import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  Color buttonColor;
  VoidCallback onPressed;
  MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(text, style: TextStyle(fontSize: 22, color: Colors.white)),
    );
  }
}
