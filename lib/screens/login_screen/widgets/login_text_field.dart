import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: loginTextFieldWidth,
      height: loginTextFieldHeight,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
