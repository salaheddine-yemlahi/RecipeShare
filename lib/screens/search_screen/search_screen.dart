import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/dao/repositories/LikeRepository.dart';
import 'package:recipeshare/screens/home_screen/widgets/MenuDown.dart';
import 'package:recipeshare/screens/home_screen/widgets/RecipeCard.dart';
import 'package:recipeshare/screens/search_screen/widgets/search_bar.dart' hide SearchBar;

import '../../dao/models/recette.dart';
import '../../dao/repositories/CommentRepository.dart';
import '../../dao/repositories/RecetteRepository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = "/search_screen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final repo = RecetteRepository(FirebaseFirestore.instance);
  final repoLikes = LikeRepository(FirebaseFirestore.instance);
  final repoComments = CommentRepository(FirebaseFirestore.instance);

  String searchText = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: applicationBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: searchScreenHorizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: searchScreenTopSpacing),
              Center(
                child: SearchBar(
                  onChanged: (value) {
                    setState(() {
                      searchText = value.isEmpty ? "-" : value;
                    });
                  },
                ),
              ),
              const SizedBox(height: searchScreenBetweenSpacing),
              const SizedBox(height: searchScreenBetweenSpacing),
              FutureBuilder<List<Recette>>(
                future: repo.getByNomPrefix(searchText),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final recettes = snapshot.data!;

                  return Column(
                    children: recettes.map((r) {
                      final likesCount =
                      repoLikes.countLikesByRecette(r.id_recette ?? "");
                      final commentsCount =
                      repoComments.countCommentsByRecette(r.id_recette ?? "");

                      return RecipeCard(
                        recipeId: r.id_recette ?? "",
                        imageUrl: r.imageUrl,
                        recipeName: r.nom,
                        id_utilisateur: r.id_utilisateur ?? "Unknown",
                        prepTime: r.temps,
                        ingredientsCount: r.ingredients.length,
                        likesCount: likesCount,
                        commentsCount: commentsCount,
                        description: r.description,
                        listIngredient: r.ingredients,
                        preparation: r.preparation,
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MenuDown(),
    );
  }
}
