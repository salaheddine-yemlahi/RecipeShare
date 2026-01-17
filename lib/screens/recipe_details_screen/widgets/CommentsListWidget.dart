import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../dao/models/comment.dart';
import '../../../dao/repositories/CommentRepository.dart';
import 'CommentItemWidget.dart';

class CommentsListWidget extends StatefulWidget {
  final String recipeId;

  const CommentsListWidget({
    super.key,
    required this.recipeId,
  });

  @override
  State<CommentsListWidget> createState() => _CommentsListWidgetState();
}

class _CommentsListWidgetState extends State<CommentsListWidget> {
  late final CommentRepository _commentRepository;
  late final Future<List<Comment>> _commentsFuture;

  @override
  void initState() {
    super.initState();
    _commentRepository = CommentRepository(FirebaseFirestore.instance);


    _commentsFuture = _commentRepository.getCommentsByRecette(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.recipeId.isEmpty) {
      return const Text("Recette invalide");
    }

    return FutureBuilder<List<Comment>>(
      future: _commentsFuture,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }


        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("Aucun commentaire");
        }

        final comments = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return CommentItemWidget(comment: comments[index]);
          },
        );
      },
    );
  }
}
