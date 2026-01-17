import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/models/utilisateur.dart';
import 'package:recipeshare/dao/repositories/UtilisateurRepository.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../dao/models/like.dart';
import '../../../dao/models/recette.dart';
import '../../../dao/repositories/LikeRepository.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import 'notification_like_item.dart';

class NotificationsLikesCards extends StatefulWidget {
  const NotificationsLikesCards({super.key});

  @override
  State<NotificationsLikesCards> createState() =>
      _NotificationsLikesCardsState();
}

class _NotificationsLikesCardsState extends State<NotificationsLikesCards> {
  final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
  final likeRepo = LikeRepository(FirebaseFirestore.instance);
  final utilisateurRepo = UtilisateurRepository(FirebaseFirestore.instance);

  late final Future<List<Recette>> _userRecipesFuture;
  late final Future<List<Like>> _likesFuture;
  late final String _currentUtilisateur;

  bool _forceShowData = false;

  @override
  void initState() {
    super.initState();

    _currentUtilisateur = utilisateurRepo.currentUser();


    Timer(const Duration(seconds: 2), () { // Après 2 secondes, si le widget est toujours actif, on met à jour l’état pour forcer l’affichage de données.
      if (mounted) {
        setState(() {
          _forceShowData = true;
        });
      }
    });


    _userRecipesFuture = recetteRepo.getByUtilisateur(_currentUtilisateur);


    _likesFuture = _userRecipesFuture.then((recipes) {
      if (recipes.isEmpty) return <Like>[];
      final recipeIds = recipes.map((r) => r.id_recette!).toList();
      return likeRepo.getLikesForUserRecipes(recipeIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Like>>(
      future: _likesFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting && !_forceShowData) {
          return const Center(
            child: CircularProgressIndicator(
              color: notificationLoaderColor,
            ),
          );
        }

        final likes = snapshot.data ?? [];


        if (likes.isEmpty) {
          return const Center(
            child: Text(
              "Aucune notification",
              style: TextStyle(color: notificationEmptyTextColor),
            ),
          );
        }


        return ListView.builder(
          padding: const EdgeInsets.all(notificationListPaddingCard),
          itemCount: likes.length,
          itemBuilder: (context, index) {
            return NotificationLikeItem(like: likes[index]);
          },
        );
      },
    );
  }
}
