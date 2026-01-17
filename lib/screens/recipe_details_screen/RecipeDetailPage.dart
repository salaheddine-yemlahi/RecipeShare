import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/repositories/CommentRepository.dart';
import 'package:recipeshare/screens/home_screen/widgets/RecipeCardImage.dart';
import 'package:recipeshare/screens/recipe_details_screen/widgets/AddCommentWidget.dart';
import 'package:recipeshare/screens/recipe_details_screen/widgets/CommentsListWidget.dart';
import 'package:recipeshare/screens/recipe_details_screen/widgets/RecipeDetailIngredient.dart';
import 'package:recipeshare/screens/recipe_details_screen/widgets/RecipeNameText.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';

class RecipeDetailPage extends StatelessWidget {
  static const String routeName = "/RecipeDetailPage";

  RecipeDetailPage({super.key});

  final commentRepository = CommentRepository(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final List<String> ingredientsList =
    List<String>.from(args["listIngredient"]);
    final List<String> preparationSteps =
    args["preparation"].split('\n');
    final String recipeId = args["recipeId"] as String? ?? '';

    return Scaffold(
      backgroundColor: applicationBackGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: recipeDetailHorizontalPadding,
            vertical: recipeDetailVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RecipeCardImage(imageUrl: args["imageUrl"]),
              const SizedBox(height: recipeDetailSpacingMedium),

              RecipeNameText(recipeName: args["recipeName"]),
              const SizedBox(height: recipeDetailSpacingLarge),

              const Text("Description", style: recipeSectionTitleStyle),
              Text(args["description"]),
              const SizedBox(height: recipeDetailSpacingLarge),

              RecipeDetailIngredient(listIngredients: ingredientsList),
              const SizedBox(height: recipeDetailSpacingLarge),

              const Text("Préparation", style: recipeSectionTitleStyle),
              const SizedBox(height: recipeDetailSpacingSmall),

              Wrap(
                spacing: recipeDetailSpacingSmall,
                runSpacing: recipeDetailSpacingSmall,
                children: preparationSteps.map((step) {
                  if (step.trim().isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: recipeChipBackgroundColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      step,
                      style: recipeStepTextStyle,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: recipeDetailSpacingLarge),

              const Text("Commentaires", style: recipeSectionTitleStyle),
              const SizedBox(height: recipeDetailSpacingSmall),

              AddCommentWidget(
                recetteId: recipeId,
                userId: FirebaseAuth.instance.currentUser!.uid,
                onSubmit: commentRepository.addComment,
              ),

              CommentsListWidget(recipeId: recipeId),
            ],
          ),
        ),
      ),
    );
  }
}
