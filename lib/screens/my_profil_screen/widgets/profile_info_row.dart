import 'package:flutter/material.dart';
import 'package:recipeshare/screens/my_profil_screen/widgets/profile_item.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class ProfileInfoRow extends StatelessWidget {
  final ProfileItem item;

  const ProfileInfoRow({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: mainContentColor,
          size: profileInfoIconSize,
        ),
        const SizedBox(width: profileInfoIconSpacing),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: profileInfoLabelStyle(context),
              ),
              const SizedBox(height: profileInfoValueSpacing),
              Text(
                item.value,
                style: profileInfoValueStyle(context),
              ),
            ],
          ),
        ),
        if (item.onEdit != null)
          IconButton(
            onPressed: item.onEdit,
            icon: const Icon(
              Icons.edit,
              color: mainContentColor,
            ),
          ),
      ],
    );
  }
}
