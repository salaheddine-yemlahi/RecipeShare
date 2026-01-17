import 'package:flutter/cupertino.dart';
import '../../../constants/sizes.dart';

class RecipeDetailImage extends StatelessWidget {
  final String imageurl;

  const RecipeDetailImage({
    super.key,
    required this.imageurl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(recipeDetailImageRadius),
        bottomRight: Radius.circular(recipeDetailImageRadius),
      ),
      child: Image.network(
        imageurl,
        width: double.infinity,
        height: recipeDetailImageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
