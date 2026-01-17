import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/repositories/LikeRepository.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../dao/models/like.dart';
import '../../../dao/models/recette.dart';
import '../../../dao/models/utilisateur.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import '../../../dao/repositories/UtilisateurRepository.dart';

class NotificationLikeItem extends StatefulWidget {
  final Like like;

  const NotificationLikeItem({super.key, required this.like});

  @override
  State<NotificationLikeItem> createState() => _NotificationLikeItemState();
}

class _NotificationLikeItemState extends State<NotificationLikeItem> {
  final utilisateurRepo = UtilisateurRepository(FirebaseFirestore.instance);
  final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
  final likeRepo = LikeRepository(FirebaseFirestore.instance);

  late bool consulte;

  @override
  void initState() {
    super.initState();
    consulte = widget.like.consulte;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Utilisateur?>(
      future: utilisateurRepo.getById(widget.like.id_utilisateur!),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (!userSnapshot.hasData) {
          return const SizedBox();
        }

        final utilisateur = userSnapshot.data!;
        final userName = "${utilisateur.prenom} ${utilisateur.nom}";

        return FutureBuilder<Recette?>(
          future: recetteRepo.getById(widget.like.id_recette!),
          builder: (context, recetteSnapshot) {
            if (recetteSnapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (!recetteSnapshot.hasData) {
              return const SizedBox();
            }

            final recette = recetteSnapshot.data!;
            final recetteName = recette.nom;

            return InkWell(
              onTap: () async {
                if (!consulte) {
                  final success =
                  await likeRepo.updateLikeConsulte(widget.like.id_like!);
                  if (success && mounted) {
                    setState(() => consulte = true);
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: notificationHorizontalMargin,
                  vertical: notificationVerticalMargin,
                ),
                padding: const EdgeInsets.all(notificationPadding), // meme espace dans les quatres cotés
                decoration: BoxDecoration(
                  color: consulte
                      ? notificationReadBackgroundColor
                      : notificationUnreadBackgroundColor,
                  borderRadius:
                  BorderRadius.circular(notificationBorderRadius),
                ),
                child: Text(
                  "$userName a aimé ta recette $recetteName",
                  style: const TextStyle(
                    fontSize: notificationTextSize,
                    color: notificationTextColor,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
