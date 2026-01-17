import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class RecipeDetailIngredient extends StatefulWidget {
  final List<String> listIngredients;

  const RecipeDetailIngredient({
    super.key,
    required this.listIngredients,
  });

  @override
  State<RecipeDetailIngredient> createState() =>
      _RecipeDetailIngredientState();
}

class _RecipeDetailIngredientState extends State<RecipeDetailIngredient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Ingrédients",
          style: ingredientTitleTextStyle,
        ),
        const SizedBox(height: ingredientSpacing),
        Wrap(
          spacing: ingredientSpacing,
          runSpacing: ingredientSpacing,
          children: widget.listIngredients.map((ingredient) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ingredientChipHorizontalPadding,
                vertical: ingredientChipVerticalPadding,
              ),
              decoration: BoxDecoration(
                color: ingredientChipBackgroundColor,
                borderRadius:
                BorderRadius.circular(ingredientChipRadius),
              ),
              child: Text(
                ingredient,
                style: ingredientChipTextStyle2,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
