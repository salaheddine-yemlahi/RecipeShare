import 'package:flutter/material.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/constants/styles.dart';
import 'package:recipeshare/routes.dart';
import 'package:recipeshare/screens/home_screen/HomeScreen.dart';
import 'package:recipeshare/screens/login_screen/login_screen.dart';
import 'package:recipeshare/constants/styles.dart';
import 'package:recipeshare/screens/register_screen/register_screen.dart';




class WelcomeScreenButtons extends StatelessWidget {
  const WelcomeScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,      
        children: [
          WelcomeScreenButton(text: "s'inscrire", fonc: () {Navigator.pushNamed(context, RegisterScreen.routeName);}),
          WelcomeScreenButton(text: "se connecter", fonc: () {Navigator.pushNamed(context, LoginScreen.routeName);}),
        ],
    );
  }
}

class WelcomeScreenButton extends StatelessWidget {
  const WelcomeScreenButton({super.key, required this.text, required this.fonc});

  final String text;
  final VoidCallback fonc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fonc,
      style: welcomeScreanStyle,
      child: Text(text),
    );
  }
}