import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../dao/repositories/CommentRepository.dart';
import 'AddCommentWidget.dart';
import 'CommentsListWidget.dart';

class CommentsWidget extends StatefulWidget {
  final String recipeId;
  final CommentRepository commentRepository;

  const CommentsWidget({
    super.key,
    required this.recipeId,
    required this.commentRepository,
  });

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  Key _listKey = UniqueKey();

  void _refreshComments() {
    setState(() {
      _listKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Text(
        'Vous devez être connecté pour commenter',
        style: commentsAuthTextStyle,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddCommentWidget(
          recetteId: widget.recipeId,
          userId: user.uid,
          onSubmit: (comment) async {
            await widget.commentRepository.addComment(comment);
            _refreshComments();
          },
        ),
        const SizedBox(height: commentsSpacingBetweenInputAndList),
        CommentsListWidget(
          key: _listKey,
          recipeId: widget.recipeId,
        ),
      ],
    );
  }
}
