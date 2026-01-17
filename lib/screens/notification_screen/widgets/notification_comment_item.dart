import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../dao/models/comment.dart';
import '../../../dao/models/recette.dart';
import '../../../dao/models/utilisateur.dart';
import '../../../dao/repositories/CommentRepository.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import '../../../dao/repositories/UtilisateurRepository.dart';

class NotificationCommentItem extends StatefulWidget {
  final Comment comment;

  const NotificationCommentItem({
    super.key,
    required this.comment,
  });

  @override
  State<NotificationCommentItem> createState() =>
      _NotificationCommentItemState();
}

class _NotificationCommentItemState extends State<NotificationCommentItem> {
  final utilisateurRepo = UtilisateurRepository(FirebaseFirestore.instance);
  final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
  final commentRepo = CommentRepository(FirebaseFirestore.instance);

  late bool consulte;

  late Future<Utilisateur?> _userFuture;
  late Future<Recette?> _recetteFuture;

  @override
  void initState() {
    super.initState();
    consulte = widget.comment.consulte;

    _userFuture = utilisateurRepo.getById(widget.comment.idUtilisateur);
    _recetteFuture = recetteRepo.getById(widget.comment.idRecette);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        _userFuture,
        _recetteFuture,
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        final utilisateur = snapshot.data![0] as Utilisateur?;
        final recette = snapshot.data![1] as Recette?;

        if (utilisateur == null || recette == null) {
          return const SizedBox();
        }

        final userName = "${utilisateur.prenom} ${utilisateur.nom}";
        final recetteName = recette.nom;

        return InkWell(
          onTap: () async {
            if (!consulte) {
              final success = await commentRepo
                  .updateCommentConsulte(widget.comment.idComment!);
              if (success && mounted) {
                setState(() {
                  consulte = true;
                });
              }
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: notificationHorizontalMargin,
              vertical: notificationVerticalMargin,
            ),
            padding: const EdgeInsets.all(notificationPadding),
            decoration: BoxDecoration(
              color: consulte
                  ? notificationReadBackgroundColor
                  : notificationUnreadBackgroundColor,
              borderRadius:
              BorderRadius.circular(notificationBorderRadius),
            ),
            child: Text(
              "$userName a commenté ta recette $recetteName",
              style: notificationTextStyle,
            ),
          ),
        );
      },
    );
  }
}
