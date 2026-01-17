import 'package:flutter/material.dart';
import 'package:recipeshare/constants/styles.dart';

class LoginRegistreButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LoginRegistreButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: welcomeScreanStyle,
      child: Text(text),
    );
  }
}
