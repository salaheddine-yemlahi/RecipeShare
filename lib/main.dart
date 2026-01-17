import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/routes.dart';
import 'package:recipeshare/screens/auth_entre/auth_entre.dart';
import 'package:recipeshare/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeShare',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AuthEntre.routeName,
      routes: routes,
    );
  }
}
