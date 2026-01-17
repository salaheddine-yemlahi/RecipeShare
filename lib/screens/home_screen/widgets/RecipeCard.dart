import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/repositories/CommentRepository.dart';
import 'package:recipeshare/dao/repositories/LikeRepository.dart';
import 'package:recipeshare/dao/repositories/RecetteRepository.dart';
import 'package:recipeshare/screens/home_screen/widgets/RecipeCardImage.dart';
import 'package:recipeshare/screens/profil_screen/profil_screen.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../dao/models/utilisateur.dart';
import '../../../dao/repositories/UtilisateurRepository.dart';
import '../../recipe_details_screen/RecipeDetailPage.dart';
import 'Badgets.dart';

class RecipeCard extends StatefulWidget {
  final String imageUrl;
  final String recipeName;
  final String id_utilisateur;
  final String prepTime;
  final String description;
  final String preparation;
  final String recipeId;

  final int ingredientsCount;
  final Future<int> likesCount;
  final Future<int> commentsCount;

  final List<String> listIngredient;

  const RecipeCard({
    super.key,
    required this.recipeId,
    required this.imageUrl,
    required this.recipeName,
    required this.id_utilisateur,
    required this.prepTime,
    required this.ingredientsCount,
    required this.likesCount,
    required this.commentsCount,
    required this.description,
    required this.listIngredient,
    required this.preparation,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;
  int localLikesCount = 0;
  Color likeTextColor = Colors.black;
  List<String> badges = [];

  final utilisateurRepo = UtilisateurRepository(FirebaseFirestore.instance);
  final likeRepo = LikeRepository(FirebaseFirestore.instance);
  final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
  final commentRepo = CommentRepository(FirebaseFirestore.instance);

  @override
  void initState() {
    super.initState();
    _initLikes();
    _checkUserLike();
  }

  Future<void> _initLikes() async {
    localLikesCount = await widget.likesCount;
    setState(() {});
  }

  Future<void> _checkUserLike() async {
    final result = await likeRepo.checkLike(
      widget.recipeId,
      FirebaseAuth.instance.currentUser!.uid,
    );

    setState(() {
      liked = result;
      likeTextColor = liked ? recipeLikeActiveColor : recipeLikeInactiveColor;
    });
  }

  void _openDetails(BuildContext context) {
    Navigator.pushNamed(
      context,
      RecipeDetailPage.routeName,
      arguments: {
        "recipeId": widget.recipeId,
        "imageUrl": widget.imageUrl,
        "recipeName": widget.recipeName,
        "authorName": widget.id_utilisateur,
        "prepTime": widget.prepTime,
        "ingredientsCount": widget.ingredientsCount,
        "likesCount": widget.likesCount,
        "commentsCount": widget.commentsCount,
        "description": widget.description,
        "listIngredient": widget.listIngredient,
        "preparation": widget.preparation,
      },
    );
  }
  void _openProfil(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProfileScreen.routeName,
      arguments: {
        "utilisateurId": widget.id_utilisateur,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: recipeCardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _openDetails(context),
            child: RecipeCardImage(imageUrl: widget.imageUrl),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _openDetails(context),
                  child: Text(
                    widget.recipeName,
                    style: const TextStyle(
                      fontSize: recipeSpacingLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      InkWell(
                        onTap: () => _openProfil(context),
                        child: FutureBuilder<Utilisateur?>(
                          future: utilisateurRepo.getById(widget.id_utilisateur),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Text(
                                "Chargement...",
                                style: TextStyle(color: Colors.grey[600]),
                              );
                            }

                            if (!snapshot.hasData) {
                              return Text(
                              "Auteur inconnu",
                              style: TextStyle(color: Colors.grey[600]),
                              );
                            }

                            final u = snapshot.data!;
                            return Text(
                            "${u.prenom} ${u.nom}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                    ),

                    const SizedBox(width: recipeSpacingMedium),

                    Badget(idUtilisateur: widget.id_utilisateur),
                  ],
                ),

                const SizedBox(height: recipeSpacingSmall),
                InkWell(
                  onTap: () => _openDetails(context),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, size: recipeSpacingLarge),
                      Text(" ${widget.prepTime}"),
                      const SizedBox(width: 10),
                      const Icon(Icons.format_list_bulleted, size: recipeSpacingLarge),
                      Text(" ${widget.ingredientsCount} ingrédients"),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final result = await likeRepo.addRemoveLike(
                          widget.recipeId,
                          FirebaseAuth.instance.currentUser!.uid,
                          widget.id_utilisateur,
                        );

                        setState(() {
                          if (result) {
                            localLikesCount++;
                          } else {
                            localLikesCount--;
                          }

                          liked = result;
                          likeTextColor =
                          liked ? recipeLikeActiveColor : recipeLikeInactiveColor;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: likeTextColor,
                          ),
                          Text(
                            "$localLikesCount",
                            style:
                            TextStyle(color: likeTextColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: recipeTitleFontSize),
                    InkWell(
                      onTap: () => _openDetails(context),
                      child:
                        Row(
                        children: [
                        const Icon(Icons.chat_bubble_outline, size: 18),
                          FutureBuilder<int>(
                            future: widget.commentsCount,
                            builder: (context, snapshot) {
                              return Text("${snapshot.data ?? 0}");
                            },
                          )
                        ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
