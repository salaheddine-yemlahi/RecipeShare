import 'package:flutter/material.dart';
import 'package:recipeshare/screens/notification_screen/widgets/Notifications_Likes_card.dart';
import 'package:recipeshare/screens/notification_screen/widgets/Notifications_comments_card.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../home_screen/widgets/MenuDown.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  static const String routeName = "/notification_screen";

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool showLikes = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showLikes = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: showLikes
                        ? notificationTabActiveColor
                        : notificationTabInactiveColor,
                  ),
                  child: const Text("Likes"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showLikes = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: !showLikes
                        ? notificationTabActiveColor
                        : notificationTabInactiveColor,
                  ),
                  child: const Text("Commentaires"),
                ),
              ),
            ],
          ),
          const SizedBox(height: notificationTabsSpacing),
          Expanded(
            child: showLikes
                ? NotificationsLikesCards()
                : NotificationsCommentsCards(),
          ),
        ],
      ),
      bottomNavigationBar: const MenuDown(),
    );
  }
}
