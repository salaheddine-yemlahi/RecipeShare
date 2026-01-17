import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/styles.dart';

import '../../../constants/sizes.dart';

class Linedivider extends StatelessWidget {
  const Linedivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: lineDividerHeight,
      width: lineDividerWidth,
      color: lineDividerColor,
    );
  }
}
