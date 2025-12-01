import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String nameButton;
  final VoidCallback onPressed;
  final Color backgroundcolor;
  final Color textcolor;

  const Buttons({
    super.key, 
    required this.nameButton, 
    required this.onPressed, 
    required this.backgroundcolor,
    required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: textcolor,
        ),
        onPressed: onPressed,
        child: Text(nameButton, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
