import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/repositories/UtilisateurRepository.dart';
import 'package:recipeshare/screens/register_screen/widgets/register_drop_down_button.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../dao/models/utilisateur.dart';
import '../login_screen/widgets/login_registre_button.dart';
import '../login_screen/widgets/login_text_field.dart';
import '../welcome/widgets/svg_logo.dart';

class ProfileCreation extends StatefulWidget {
  const ProfileCreation({super.key});
  static const String routeName = "/profil_creation";

  @override
  State<ProfileCreation> createState() => _ProfileCreation();
}

class _ProfileCreation extends State<ProfileCreation> {
  final TextEditingController nomUser = TextEditingController();
  final TextEditingController prenomUser = TextEditingController();
  final TextEditingController dateNaiss = TextEditingController();
  String? sexeSelectionne;

  Future<void> Continuer() async {
    await Firebase.initializeApp();
    final firestore = FirebaseFirestore.instance;
    try {
      final user = FirebaseAuth.instance.currentUser;
      final utilisateur = Utilisateur(
        id: user?.uid,
        nom: nomUser.text,
        prenom: prenomUser.text,
        email: user?.email ?? '',
        dateNaissance: dateNaiss.text,
        createdAt: DateTime.now(),
      );
      final utilisateurRepository = UtilisateurRepository(firestore);
      await utilisateurRepository.add(utilisateur);
    } catch (e) {
      debugPrint("Erreur : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: applicationBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: profileCreationHorizontalPadding,
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

                  LoginTextField(
                    controller: prenomUser,
                    label: "Prénom",
                  ),
                  LoginTextField(
                    controller: nomUser,
                    label: "Nom",
                  ),
                  LoginTextField(
                    controller: dateNaiss,
                    label: "Date de naissance",
                  ),

                  const SizedBox(height: profileCreationDropdownSpacing),

                  RegisterDropDownButton(
                    label: 'Sexe',
                    items: const ['Homme', 'Femme', 'Autre'],
                    value: sexeSelectionne,
                    onChanged: (value) {
                      setState(() {
                        sexeSelectionne = value;
                      });
                    },
                  ),

                  SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),

                  LoginRegistreButton(
                    text: "Continuer",
                    onPressed: Continuer,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
