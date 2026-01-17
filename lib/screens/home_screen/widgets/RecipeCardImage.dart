import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, Icons;
import '../../../constants/sizes.dart';

class RecipeCardImage extends StatelessWidget {
  final String imageUrl;

  const RecipeCardImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(recipeCardImageRadius),
      child: Image.network(
        imageUrl,
        width: recipeCardImageSize,
        height: recipeCardImageSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported,
              size: 40,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
