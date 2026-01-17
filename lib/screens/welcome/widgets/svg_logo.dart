import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/sizes.dart';


class SvgLogo extends StatelessWidget {
  const SvgLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/logo.svg",
      width: widthLogoWelcomeScreen,
      height: heightLogoWelcomeScreen,
    );
  }
}
