import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/dao/models/recette.dart';
import 'package:recipeshare/dao/repositories/RecetteRepository.dart';
import '../../../dao/models/comment.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class AddCommentWidget extends StatefulWidget {
  final String recetteId;
  final String userId;
  final Future<void> Function(Comment comment) onSubmit;
  final int maxLength;

  const AddCommentWidget({
    super.key,
    required this.recetteId,
    required this.userId,
    required this.onSubmit,
    this.maxLength = 500,
  });

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final _controller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    final recetteRepo = RecetteRepository(FirebaseFirestore.instance);
    if (text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final recette = await recetteRepo.getById(widget.recetteId);

      if (recette == null) {
        throw Exception("Recette introuvable");
      }

      final String utilisateurCreatorId = recette.id_utilisateur as String;

      final comment = Comment(
        idRecette: widget.recetteId,
        idUtilisateur: widget.userId,
        id_utilisateur_editeur: utilisateurCreatorId,
        content: text,
        commentDate: DateTime.now(),
      );

      await widget.onSubmit(comment);

      if (!mounted) return;

      _controller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Commentaire ajouté avec succès'),
          backgroundColor: addCommentSuccessColor,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de l\'ajout : $e'),
          backgroundColor: addCommentErrorColor,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            enabled: !_isLoading,
            maxLength: widget.maxLength,
            maxLines: null,
            minLines: 1,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Ajouter un commentaire...',
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(addCommentBorderRadius),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: addCommentHorizontalPadding,
                vertical: addCommentVerticalPadding,
              ),
            ),
            onSubmitted: (_) => _submit(),
          ),
        ),
        const SizedBox(width: addCommentSpacing),
        _isLoading
            ? const Padding(
          padding: EdgeInsets.all(addCommentVerticalPadding),
          child: SizedBox(
            width: addCommentLoaderSize,
            height: addCommentLoaderSize,
            child: CircularProgressIndicator(
              strokeWidth: addCommentLoaderStroke,
              color: addCommentLoaderColor,
            ),
          ),
        )
            : IconButton(
          icon: const Icon(Icons.send),
          onPressed:
          _controller.text.trim().isEmpty ? null : _submit,
          tooltip: 'Envoyer le commentaire',
        ),
      ],
    );
  }
}
