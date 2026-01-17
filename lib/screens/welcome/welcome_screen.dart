import 'package:flutter/material.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/screens/welcome/widgets/svg_logo.dart';
import 'package:recipeshare/screens/welcome/widgets/guide_View.dart';
import 'package:recipeshare/screens/welcome/widgets/welcome_screen_buttons.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static final String routeName = "/welcome_screen"; // l’identifiant unique de la page dans la navigation.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: applicationBackGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: sizedBoxBeforeLogoWelcomeScreen),
            SvgLogo(),
            Expanded( // Expanded permet à un widget de prendre tout l’espace restant disponible.
              child: GuideView(),
            ),
            WelcomeScreenButtons(),
          ],
        ),
      ),
    );
  }
}