import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class GuidePage extends StatelessWidget {
  final String text;

  const GuidePage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(guidePagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: guideTextFontSize,
                  fontWeight: guideTextFontWeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
