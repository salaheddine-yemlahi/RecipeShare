import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';
import '../../../constants/fonctions.dart';
import '../../../dao/models/utilisateur.dart';
import '../../../dao/repositories/UtilisateurRepository.dart';

class ProfileImageSection extends StatelessWidget {
  ProfileImageSection({Key? key}) : super(key: key);

  final daoUtilisateur = UtilisateurRepository(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<Utilisateur?>(
      future: daoUtilisateur.getById(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          return const Icon(Icons.person, size: profileIconSize);
        }

        final user = snapshot.data!;
        final imageUrl = user.imageUrl;

        return Column(
          children: [
            Container(
              width: profileImageSize,
              height: profileImageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primaryContainer,
                image: (imageUrl != null && imageUrl.isNotEmpty)
                    ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              child: (imageUrl == null || imageUrl.isEmpty)
                  ? const Icon(
                Icons.person,
                size: profileIconSize,
                color: mainContentColor,
              )
                  : null,
            ),
            const SizedBox(height: profileImageSpacing),
            TextButton.icon(
              onPressed: () async {
                final imageFile = await pickImageFromGallery();
                if (imageFile != null) {
                  await daoUtilisateur.updateProfilImage(
                    userId,
                    imageFile,
                  );
                }
              },
              icon: const Icon(
                Icons.camera_alt,
                size: profileCameraIconSize,
                color: mainContentColor,
              ),
              label: const Text(
                'Changer la photo',
                style: profileImageButtonTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
