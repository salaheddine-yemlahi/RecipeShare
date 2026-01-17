import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/repositories/UtilisateurRepository.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../dao/models/comment.dart';
import '../../../dao/models/utilisateur.dart';
import '../../home_screen/widgets/Badgets.dart';

class CommentItemWidget extends StatelessWidget {
  final Comment comment;

  CommentItemWidget({
    super.key,
    required this.comment,
  });

  final utilisateurRepository =
  UtilisateurRepository(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Utilisateur?>(
      future: utilisateurRepository.getById(comment.idUtilisateur),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: commentCardVerticalMargin,
              horizontal: commentCardHorizontalMargin,
            ),
            child: const Padding(
              padding: EdgeInsets.all(commentCardPadding),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final userName =
        "${snapshot.data?.prenom ?? ''} ${snapshot.data?.nom ?? ''}".trim();

        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: commentCardVerticalMargin,
            horizontal: commentCardHorizontalMargin,
          ),
          child: Padding(
            padding: const EdgeInsets.all(commentCardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: commentUserNameStyle,
                        ),
                        Badget(idUtilisateur: snapshot.data?.id ?? ''),
                      ],
                    ),
                    Text(
                      _formatDate(comment.commentDate),
                      style: commentDateStyle,
                    ),
                  ],
                ),
                const SizedBox(height: commentSpacingSmall),
                Text(
                  comment.content,
                  style: commentContentStyle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes}min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays}j';
    } else {
      return '${date.day.toString().padLeft(2, '0')}/'
          '${date.month.toString().padLeft(2, '0')}/'
          '${date.year}';
    }
  }
}
