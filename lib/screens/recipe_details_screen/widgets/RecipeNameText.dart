import 'package:flutter/widgets.dart';
import '../../../constants/styles.dart';

class RecipeNameText extends StatelessWidget {
  final String recipeName;

  const RecipeNameText({
    super.key,
    required this.recipeName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      recipeName,
      style: recipeNameTextStyle,
    );
  }
}
