import 'package:flutter/material.dart';

class BadgesDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text("Badges"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [


                Text("Likes : ", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("🥉 Apprécié – 5 likes"),
                Text("🥈 Populaire – 15 likes"),
                Text("🥇 Star – 30 likes"),
                Text("🔥 Tendance – 50 likes"),
                Text("👑 Légende – 100 likes"),

                SizedBox(height: 16),


                Text("Commentaires : ", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("💬 Actif – 5 commentaires"),
                Text("🗣️ Engagé – 15 commentaires"),
                Text("✍️ Contributeur – 30 commentaires"),
                Text("📣 Influenceur – 50 commentaires"),
                Text("🧠 Pilier de la communauté – 100 commentaires"),

                SizedBox(height: 16),


                Text("Recettes : ", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("🥄 Débutant – 1 recette"),
                Text("🍳 Cuisinier – 5 recettes"),
                Text("🍽️ Chef – 10 recettes"),
                Text("👨‍🍳 Chef confirmé – 20 recettes"),
                Text("👑 Maître cuisinier – 50 recettes"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
