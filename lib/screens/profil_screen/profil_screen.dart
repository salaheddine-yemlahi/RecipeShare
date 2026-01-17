import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:recipeshare/screens/profil_screen/widgets/profil_image.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../../dao/models/recette.dart';
import '../../dao/models/utilisateur.dart';
import '../../dao/repositories/CommentRepository.dart';
import '../../dao/repositories/LikeRepository.dart';
import '../../dao/repositories/RecetteRepository.dart';
import '../../dao/repositories/UtilisateurRepository.dart';
import '../home_screen/widgets/Badgets.dart';
import '../home_screen/widgets/MenuDown.dart';
import '../home_screen/widgets/RecipeCard.dart';
import '../my_profil_screen/widgets/profil_info_card.dart';
import '../my_profil_screen/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  static const String routeName = "/profile_screen";

  final daoUtilisateur = UtilisateurRepository(FirebaseFirestore.instance);
  final daoCommentaires = CommentRepository(FirebaseFirestore.instance);
  final daoLikes = LikeRepository(FirebaseFirestore.instance);
  final daoRecette = RecetteRepository(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String idUtilisateur = args["utilisateurId"] as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: FutureBuilder<Utilisateur?>(
        future: daoUtilisateur.getById(idUtilisateur),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!userSnapshot.hasData) {
            return const Center(child: Text("Utilisateur introuvable"));
          }

          final user = userSnapshot.data!;
          final image = user.imageUrl;
          final dateNaissance = _formatDate(user.dateNaissance);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: profilePaddingHorizontal,
              vertical: profilePaddingVertical,
            ),
            child: Column(
              children: [
                ProfileImage(imageUrl: image),

                const SizedBox(height: profileSectionSpacingMedium),

                Badget(idUtilisateur: idUtilisateur),

                const SizedBox(height: profileSectionSpacingMedium),

                Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<int>(
                        future:
                        daoLikes.countLikesByUtilisateurs(idUtilisateur),
                        builder: (context, snapshot) {
                          return ProfileInfoCard(
                            title: "Likes",
                            items: [
                              ProfileItem(
                                icon: Icons.favorite,
                                label: "Total",
                                value: snapshot.data?.toString() ?? "0",
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: profileSectionSpacingSmall),
                    Expanded(
                      child: FutureBuilder<int>(
                        future: daoCommentaires
                            .countCommentsByUtilisateur(idUtilisateur),
                        builder: (context, snapshot) {
                          return ProfileInfoCard(
                            title: "Commentaires",
                            items: [
                              ProfileItem(
                                icon: Icons.chat_bubble,
                                label: "Total",
                                value: snapshot.data?.toString() ?? "0",
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: profileSectionSpacingLarge),

                ProfileInfoCard(
                  title: "Informations personnelles",
                  items: [
                    ProfileItem(
                      icon: Icons.person,
                      label: "Nom",
                      value: user.nom,
                    ),
                    ProfileItem(
                      icon: Icons.person_outline,
                      label: "Prénom",
                      value: user.prenom,
                    ),
                    ProfileItem(
                      icon: Icons.cake,
                      label: "Date de naissance",
                      value: dateNaissance,
                    ),
                  ],
                ),

                const SizedBox(height: profileSectionSpacingXLarge),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recettes",
                    style: profileSectionTitleStyletest,
                  ),
                ),

                const SizedBox(height: profileSectionSpacingSmall),

                FutureBuilder<List<Recette>>(
                  future: daoRecette.getByUtilisateur(idUtilisateur),
                  builder: (context, recetteSnapshot) {
                    if (recetteSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (!recetteSnapshot.hasData ||
                        recetteSnapshot.data!.isEmpty) {
                      return const Text("Aucune recette");
                    }

                    final recettes = recetteSnapshot.data!;

                    return Column(
                      children: recettes.map((r) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: profileSectionSpacingMedium),
                          child: RecipeCard(
                            recipeId: r.id_recette!,
                            imageUrl: r.imageUrl,
                            recipeName: r.nom,
                            id_utilisateur: r.id_utilisateur!,
                            prepTime: r.temps,
                            ingredientsCount: r.ingredients.length,
                            likesCount:
                            daoLikes.countLikesByRecette(r.id_recette!),
                            commentsCount: daoCommentaires
                                .countCommentsByRecette(r.id_recette!),
                            description: r.description,
                            listIngredient: r.ingredients,
                            preparation: r.preparation,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const MenuDown(),
    );
  }

  String _formatDate(String date) {
    if (date.isEmpty) return '';
    try {
      if (date.contains('/')) return date;
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}
