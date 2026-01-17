import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/styles.dart';
import 'package:recipeshare/dao/repositories/UtilisateurRepository.dart';
import 'package:recipeshare/screens/home_screen/HomeScreen.dart';
import 'package:recipeshare/screens/profil_creation/profile_creation.dart';
import 'package:recipeshare/screens/welcome/widgets/svg_logo.dart';
import 'package:recipeshare/screens/login_screen/widgets/login_text_field.dart';
import 'package:recipeshare/screens/login_screen/widgets/login_registre_button.dart';
import 'package:recipeshare/screens/login_screen/widgets/social_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final utilisateurRepo = UtilisateurRepository(FirebaseFirestore.instance);

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    try {
      final userCredential =
      await utilisateurRepo.checkConnexion(email, password);
      final user = userCredential.user;

      if (user != null) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      String message = "Erreur inconnue";

      if (e.code == 'user-not-found') {
        message = "Aucun compte trouvé pour cet email.";
      } else if (e.code == 'wrong-password') {
        message = "Mot de passe incorrect.";
      } else if (e.code == 'invalid-email') {
        message = "Email invalide.";
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erreur : $e")));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final isNewUser = utilisateurRepo.signInWithGoogle();
      if (await isNewUser) {
        Navigator.pushNamed(context, ProfileCreation.routeName);
      } else {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    FirebaseMessaging.instance.requestPermission();

    return Scaffold(
      backgroundColor: loginBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: loginHorizontalPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
              screenHeight - MediaQuery.of(context).padding.vertical,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),
                  SvgLogo(),
                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),
                  LoginTextField(
                      controller: emailController, label: "Email"),
                  LoginTextField(
                      controller: passwordController, label: "Mot de passe"),
                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginRegistreButton(
                        text: "Se connecter",
                        onPressed: login,
                      ),
                      const SizedBox(width: loginButtonsSpacing),
                      LoginRegistreButton(
                        text: "S'inscrire",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: loginSeparatorSpacing),
                  const Text("OU", style: loginSeparatorTextStyle),
                  const SizedBox(height: loginSeparatorSpacing),
                  SocialLoginButton(
                    chemin: "assets/images/google.png",
                    onPressed: signInWithGoogle,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
