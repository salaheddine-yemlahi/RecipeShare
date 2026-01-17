import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class RegisterDropDownButton extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const RegisterDropDownButton({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: registerDropdownWidth,
      height: registerDropdownHeight,
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: registerDropdownInputDecoration.copyWith(
          labelText: label,
        ),
        items: [
          for (String item in items)
            DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
