import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../dao/repositories/CommentRepository.dart';
import '../../../dao/repositories/LikeRepository.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import '../../../dialogs/badges_dialog.dart';

class Badget extends StatelessWidget {
  final String idUtilisateur;

  const Badget({
    super.key,
    required this.idUtilisateur,
  });

  Future<List<String>> getBadges() async {
    final likeRepo = LikeRepository(FirebaseFirestore.instance);
    final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
    final commentRepo = CommentRepository(FirebaseFirestore.instance);

    final likes = await likeRepo.countLikesByUtilisateurs(idUtilisateur);
    final recipes = await recetteRepo.countByUtilisateur(idUtilisateur);
    final comments = await commentRepo.countByUtilisateur(idUtilisateur);

    List<String> badges = [];

    if (likes >= 1) badges.add("🥉");
    if (likes >= 5) badges.add("🥈");
    if (likes >= 10) badges.add("🥇");
    if (likes >= 20) badges.add("🔥");
    if (likes >= 30) badges.add("👑");

    if (comments >= 1) badges.add("💬");
    if (comments >= 5) badges.add("🗣️");
    if (comments >= 10) badges.add("✍️");
    if (comments >= 20) badges.add("📣");
    if (comments >= 30) badges.add("🧠");

    if (recipes >= 1) badges.add("🥄");
    if (recipes >= 5) badges.add("🍳");
    if (recipes >= 10) badges.add("🍽️");
    if (recipes >= 20) badges.add("👨‍🍳");
    if (recipes >= 30) badges.add("👑");

    return badges;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getBadges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox();
        }

        final badges = snapshot.data!;

        return Wrap(
          spacing: badgeSpacing,
          children: badges.map((badge) {
            return InkWell(
              onTap: () => BadgesDialog.show(context),
              child: Padding(
                padding: badgePadding,
                child: Text(
                  badge,
                  style: badgeTextStyle,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
