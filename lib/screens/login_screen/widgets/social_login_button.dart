import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class SocialLoginButton extends StatelessWidget {
  final String chemin;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.chemin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: socialButtonPadding,
        backgroundColor: socialButtonBackgroundColor,
        elevation: socialButtonElevation,
      ),
      child: Image.asset(
        chemin,
        fit: BoxFit.contain,
      ),
    );
  }
}
