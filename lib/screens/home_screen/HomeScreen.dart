import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/dao/repositories/LikeRepository.dart';
import 'package:recipeshare/dao/repositories/UtilisateurRepository.dart';
import 'package:recipeshare/screens/home_screen/widgets/LineDivider.dart';
import 'package:recipeshare/screens/home_screen/widgets/MenuDown.dart';
import 'package:recipeshare/screens/home_screen/widgets/RecipeCard.dart';
import 'package:recipeshare/screens/home_screen/widgets/header.dart';
import '../../dao/models/recette.dart';
import '../../dao/repositories/CommentRepository.dart';
import '../../dao/repositories/RecetteRepository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = RecetteRepository(FirebaseFirestore.instance);
  final repoLikes = LikeRepository(FirebaseFirestore.instance);
  final repoComments = CommentRepository(FirebaseFirestore.instance);
  final utiliRepo = UtilisateurRepository(FirebaseFirestore.instance);

  late final Future<List<Recette>> _recettesFuture;

  @override
  void initState() {
    super.initState();
    _recettesFuture = repo.getAll();
    utiliRepo.updateApareilToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: applicationBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: homeHorizontalPadding,
          ),
          child: Column(
            children: [
              const Center(child: Header()),
              const SizedBox(height: homeSectionSpacing),
              const Linedivider(),
              const SizedBox(height: homeSectionSpacing),

              FutureBuilder<List<Recette>>(
                future: _recettesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text("Aucune recette disponible");
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
