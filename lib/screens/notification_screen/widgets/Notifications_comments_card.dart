import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../dao/models/comment.dart';
import '../../../dao/models/recette.dart';
import '../../../dao/repositories/CommentRepository.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import 'notification_comment_item.dart';

class NotificationsCommentsCards extends StatefulWidget {
  const NotificationsCommentsCards({super.key});

  @override
  State<NotificationsCommentsCards> createState() =>
      _NotificationsCommentsCardsState();
}

class _NotificationsCommentsCardsState
    extends State<NotificationsCommentsCards> {
  final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
  final commentRepo = CommentRepository(FirebaseFirestore.instance);

  late final Future<List<Recette>> _userRecipesFuture;
  late final Future<List<Comment>> _commentsFuture;

  bool _forceShowData = false;

  @override
  void initState() {
    super.initState();

    final userId = FirebaseAuth.instance.currentUser!.uid;

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _forceShowData = true;
        });
      }
    });


    _userRecipesFuture = recetteRepo.getByUtilisateur(userId);


    _commentsFuture = _userRecipesFuture.then((recipes) {
      if (recipes.isEmpty) return <Comment>[];
      final recipeIds = recipes.map((r) => r.id_recette!).toList();
      return commentRepo.getCommentsForUserRecipes(recipeIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
      future: _commentsFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting &&
            !_forceShowData) {
          return const Center(
            child: CircularProgressIndicator(
              color: notificationLoaderColor,
            ),
          );
        }

        final comments = snapshot.data ?? [];


        if (comments.isEmpty) {
          return const Center(
            child: Text(
              "Aucune notification",
              style: TextStyle(color: notificationEmptyTextColor),
            ),
          );
        }


        return ListView.builder(
          padding: const EdgeInsets.all(notificationListPadding),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return NotificationCommentItem(
              comment: comments[index],
            );
          },
        );
      },
    );
  }
}
