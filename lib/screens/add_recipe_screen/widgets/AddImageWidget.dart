import 'dart:io';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class Addimagewidget extends StatelessWidget {
  final File? selectedImage;
  final bool isLoading;
  final VoidCallback onPickImage;

  const Addimagewidget({
    super.key,
    required this.selectedImage,
    required this.isLoading,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Photo de la recette', style: sectionTitleStyle),
        const SizedBox(height: paddingSmall),
        InkWell(
          onTap: isLoading ? null : onPickImage,
          child: Container(
            width: double.infinity, // toute la place disponible.
            height: imageHeight,
            decoration: BoxDecoration(
              color: cardBackgroundColor,
              borderRadius: BorderRadius.circular(imageRadius),
              border: Border.all(color: borderColor),
            ),
            child: selectedImage != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(imageRadius),
              child: Image.file(
                selectedImage!,
                fit: BoxFit.cover,
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_photo_alternate,
                  size: iconLarge,
                  color: iconGreyColor,
                ),
                const SizedBox(height: paddingSmall),
                Text(
                  'Appuyez pour choisir une image',
                  style: hintGreyStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
