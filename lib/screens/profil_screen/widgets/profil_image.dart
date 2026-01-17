import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const ProfileImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: profileImageSize,
      height: profileImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primaryContainer,
        image: (imageUrl != null && imageUrl!.isNotEmpty)
            ? DecorationImage(
          image: NetworkImage(imageUrl!),
          fit: BoxFit.cover,
        )
            : null,
      ),
      child: (imageUrl == null || imageUrl!.isEmpty)
          ? Icon(
        Icons.person,
        size: profileImageIconSize,
        color: mainContentColor,
      )
          : null,
    );
  }
}
