import 'package:flutter/material.dart';
import 'package:recipeshare/constants/colors.dart';
import 'package:recipeshare/constants/sizes.dart';
import 'package:recipeshare/constants/styles.dart';
import 'package:recipeshare/screens/add_recipe_screen/AddRecipeScreen.dart';

import '../../my_profil_screen/my_profil_screen.dart';
import '../../notification_screen/notification_screen.dart';
import '../../search_screen/search_screen.dart';
import '../HomeScreen.dart';

class MenuDown extends StatelessWidget {
  const MenuDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: menuDownHeight,
      decoration: const BoxDecoration(
        color: menuDownBackgroundColor,
        boxShadow: menuDownShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, size: menuDownIconSize),
            color: menuDownIconColor,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, size: menuDownIconSize),
            color: menuDownIconColor,
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_box_rounded, size: menuDownIconSize),
            color: menuDownIconColor,
            onPressed: () {
              Navigator.pushNamed(context, AddRecipePage.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, size: menuDownIconSize),
            color: menuDownIconColor,
            onPressed: () {
              Navigator.pushNamed(context, NotificationsScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, size: menuDownIconSize),
            color: menuDownIconColor,
            onPressed: () {
              Navigator.pushNamed(context, MyProfileScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
