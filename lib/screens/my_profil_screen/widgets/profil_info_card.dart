import 'package:flutter/material.dart';
import 'package:recipeshare/screens/my_profil_screen/widgets/profile_info_row.dart';
import 'package:recipeshare/screens/my_profil_screen/widgets/profile_item.dart';

import '../../../constants/sizes.dart';
import '../../../constants/styles.dart';

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<ProfileItem> items;

  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(profileInfoCardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: profileInfoTitleStyle(context),
            ),
            const SizedBox(height: profileInfoTitleSpacing),
            ...items.asMap().entries.map((entry) {
              final isLast = entry.key == items.length - 1;
              return Column(
                children: [
                  ProfileInfoRow(item: entry.value),
                  if (!isLast)
                    const Divider(height: profileInfoDividerHeight),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
