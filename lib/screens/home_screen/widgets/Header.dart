import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/sizes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        "RecipeShare",
        style: TextStyle(
          fontSize: homeLogoFontSize,
          fontWeight: homeLogoFontWeight,
          color: mainContentColor,
        ),
      ),
    );
  }
}
