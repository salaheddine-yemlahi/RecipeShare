import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class IngredientsSectionWidget extends StatefulWidget {
  final List<String> ingredients;
  final ValueChanged<String> onAddIngredient;
  final ValueChanged<int> onRemoveIngredient; // une fonction qui reçoit un int et ne retourne rien.

  const IngredientsSectionWidget({
    super.key,
    required this.ingredients,
    required this.onAddIngredient,
    required this.onRemoveIngredient,
  });

  @override
  State<IngredientsSectionWidget> createState() =>
      _IngredientsSectionWidgetState();
}

class _IngredientsSectionWidgetState extends State<IngredientsSectionWidget> {
  final _ingredientController = TextEditingController();

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _submitIngredient() {
    final value = _ingredientController.text.trim();
    if (value.isNotEmpty) {
      widget.onAddIngredient(value);
      _ingredientController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingrédients',
          style: ingredientTitleStyle,
        ),
        const SizedBox(height: ingredientSpacingSmall),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _ingredientController,
                decoration: const InputDecoration(
                  hintText: 'Ajouter un ingrédient',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _submitIngredient(),
              ),
            ),
            const SizedBox(width: ingredientSpacingSmall),
            IconButton(
              icon: const Icon(Icons.add_circle),
              color: ingredientAddIconColor,
              onPressed: _submitIngredient,
            ),
          ],
        ),

        const SizedBox(height: ingredientSpacingMedium),

        if (widget.ingredients.isEmpty)
          Text(
            'Aucun ingrédient ajouté',
            style: ingredientEmptyTextStyle,
          )
        else
          Wrap( // quand il y a plus de place il passe a la ligne.
            spacing: ingredientSpacingSmall, // space horizontal
            runSpacing: ingredientSpacingSmall, // space vertucal
            children: widget.ingredients.asMap().entries.map((entry) {
              return Chip(
                label: Text(
                  entry.value,
                  style: ingredientChipTextStyle,
                ),
                deleteIcon: const Icon(Icons.close),
                onDeleted: () => widget.onRemoveIngredient(entry.key),
              );
            }).toList(),
          ),
      ],
    );
  }
}
