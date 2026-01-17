import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/screens/register_screen/widgets/register_drop_down_button.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../dao/models/utilisateur.dart';
import '../../dao/repositories/UtilisateurRepository.dart';
import '../home_screen/HomeScreen.dart';
import '../login_screen/login_screen.dart';
import '../login_screen/widgets/login_registre_button.dart';
import '../login_screen/widgets/login_text_field.dart';
import '../login_screen/widgets/social_login_button.dart';
import '../profil_creation/profile_creation.dart';
import '../welcome/widgets/svg_logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nomUser = TextEditingController();
  final TextEditingController prenomUser = TextEditingController();
  final TextEditingController dateNaiss = TextEditingController();

  String? sexeSelectionne;

  final utiliRepo = UtilisateurRepository(FirebaseFirestore.instance);

  Future<void> register() async {
    await Firebase.initializeApp();
    final firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final utilisateur = Utilisateur(
        id: userCredential.user!.uid,
        nom: nomUser.text,
        prenom: prenomUser.text,
        email: emailController.text,
        dateNaissance: dateNaiss.text,
        createdAt: DateTime.now(),
      );

      await UtilisateurRepository(firestore).add(utilisateur);

      Navigator.pushNamed(context, RegisterScreen.routeName);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final isNewUser = utiliRepo.signInWithGoogle();

      if (await isNewUser) {
        Navigator.pushNamed(context, ProfileCreation.routeName);
      } else {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } catch (e) {
      debugPrint("Erreur Google Sign-In : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: registerBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: registerHorizontalPadding,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight -
                  MediaQuery.of(context).padding.vertical,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),
                  const SvgLogo(),
                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),

                  LoginTextField(controller: prenomUser, label: "Prénom"),
                  LoginTextField(controller: nomUser, label: "Nom"),
                  LoginTextField(
                    controller: dateNaiss,
                    label: "Date de naissance",
                  ),

                  const SizedBox(height: registerSectionSpacing),

                  RegisterDropDownButton(
                    label: 'Sexe',
                    items: const ['Homme', 'Femme', 'Autre'],
                    value: sexeSelectionne,
                    onChanged: (value) {
                      setState(() => sexeSelectionne = value);
                    },
                  ),

                  const SizedBox(height: registerSectionSpacing),

                  LoginTextField(controller: emailController, label: "Email"),
                  LoginTextField(
                    controller: passwordController,
                    label: "Mot de passe",
                  ),

                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginRegistreButton(
                        text: "Se connecter",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, LoginScreen.routeName);
                        },
                      ),
                      const SizedBox(width: registerButtonsSpacing),
                      LoginRegistreButton(
                        text: "S'inscrire",
                        onPressed: register,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text("OU"),
                  const SizedBox(height: 20),

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
