import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/screens/welcome/welcome_screen.dart';
import '../home_screen/HomeScreen.dart';

class AuthEntre extends StatelessWidget {
  const AuthEntre({super.key});
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {


        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }


        if (snapshot.hasData) {
          return HomeScreen();
        }


        return const WelcomeScreen();
      },
    );
  }
}
