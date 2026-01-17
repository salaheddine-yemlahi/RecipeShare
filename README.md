# RecipeShare

## Présentation
RecipeShare est une application qui permet de partager des recettes de cuisine entre passionnés. Chaque utilisateur peut publier ses propres recettes, ajouter des photos et découvrir celles des autres. L’objectif est de créer une vraie petite communauté autour de la cuisine, où chacun peut échanger et s’inspirer.

## Authentification
Chaque utilisateur possède un compte personnel pour pouvoir publier, commenter et suivre ses recettes. Cela permet aussi de retrouver facilement ses publications et ses interactions.

## Fonctionnement
Lorsqu’on crée une recette, on peut y ajouter :
  un titre
  la liste des ingrédients
  les étapes de préparation
  le temps de préparation
  une photo
Une fois publiée, la recette apparaît dans le fil d’actualité, visible par tous les utilisateurs. Les autres peuvent liker et commenter les recettes qu’ils apprécient. Il est aussi possible de rechercher une recette par son nom ou par ingrédient.

## Badges et motivation
Pour rendre l’expérience plus fun, j’ai ajouté un système de badges :
| Badge | Nom           | Condition |
| ----- | ------------- | --------- |
| 🥉    | **Apprécié**  | 5 likes   |
| 🥈    | **Populaire** | 15 likes  |
| 🥇    | **Star**      | 30 likes  |
| 🔥    | **Tendance**  | 50 likes  |
| 👑    | **Légende**   | 100 likes |
| Badge | Nom                         | Condition        |
| 💬    | **Actif**                   | 5 commentaires   |
| 🗣️   | **Engagé**                  | 15 commentaires  |
| ✍️    | **Contributeur**            | 30 commentaires  |
| 📣    | **Influenceur**             | 50 commentaires  |
| 🧠    | **Pilier de la communauté** | 100 commentaires |
| Nombre de recettes | Badge | Nom              |
| 1 recette          | 🥄    | Débutant         |
| 5 recettes         | 🍳    | Cuisinier        |
| 10 recettes        | 🍽️   | Chef             |
| 20 recettes        | 👨‍🍳 | Chef confirmé    |
| 50+ recettes       | 👑    | Maître cuisinier |




## Notifications
L’application envoie des notifications quand : quelqu’un like ou commente une de tes recettes, une recette populaire pourrait t’intéresser

## Mode hors ligne
Les recettes déjà consultées restent accessibles même sans connexion internet. Si tu veux publier ou commenter hors ligne, l’application te prévient et garde ton action en attente jusqu’à ce que la connexion revienne.

## Public cible
L'application vise tous les amateurs de cuisine : étudiants qui cherchent des recettes faciles, parents qui veulent des idées pour la famille, passionnés de pâtisserie, ou juste des gens qui aiment cuisiner et partager.



## Organisation générale du dépôt
Le dépôt du projet RecipeShare est structuré de manière à séparer clairement les ressources, le code applicatif et les fichiers de configuration. Cette organisation vise à améliorer la lisibilité, la maintenabilité et l’évolutivité du projet.

pubspec.yaml : Fichier de configuration Flutter contenant les dépendances du projet (Firebase, Auth, Firestore, etc.), les ressources déclarées (images, icônes, SVG), les paramètres globaux de l’application.

pubspec.lock : Fichier généré automatiquement assurant la cohérence des versions des dépendances.

assets : Dossier contenant les ressources statiques de l’application images, icones.

android, ios, web : Dossiers spécifiques aux plateformes cibles de Flutter, contenant les configurations natives nécessaires à la compilation et au déploiement.

firebase.json : Fichiers liés à la configuration Firebase (authentification, Firestore, Cloud Messaging).

## Organisation du dossier lib
Le dossier lib contient l’intégralité du code source de l’application Flutter.

constants : Ce dossier centralise toutes les constantes globales du projet (colors, sizes, styles). Cela permet une cohérence visuelle sur toute l’application et des modifications rapides sans toucher aux widgets.

Dao : regroupe la couche d’accès aux données de l’application. Il contient les modèles représentant les entités principales du projet comme les utilisateurs, les recettes, les commentaires et les likes, ainsi que les repositories chargés de communiquer avec Firebase (Firestore, Authentication et Storage). Cette séparation permet d’isoler la logique métier de l’interface utilisateur et facilite la maintenance du code.

Screens : contient l’ensemble des écrans de l’application. Chaque fonctionnalité majeure dispose de son propre dossier, comme l’écran d’accueil, l’authentification, l’ajout de recette, le profil utilisateur, la recherche ou encore les notifications. À l’intérieur de chaque écran, un sous-dossier widgets est utilisé pour regrouper les composants spécifiques à cet écran, ce qui améliore la lisibilité et évite la duplication de code.

Le fichier routes.dart : centralise la définition des routes de navigation de l’application. Il permet de gérer la navigation entre les différents écrans à l’aide de routes nommées, ce qui rend la structure de navigation plus claire et plus facile à faire évoluer.

Le fichier main.dart : constitue le point d’entrée de l’application. Il est responsable de l’initialisation de Flutter et de Firebase, de la configuration globale de l’application et du lancement du premier écran affiché à l’utilisateur.

## étude de l’existant
Il existe déjà plusieurs applications de recettes comme Marmiton, 750g, Tasty ou Cookpad qui proposent un grand nombre de recettes. Ces applications permettent de consulter des recettes, parfois de les noter ou de laisser des commentaires.
Cependant, certaines présentent des limites. Par exemple, Marmiton et 750g contiennent beaucoup de publicités et certaines recettes sont longues ou peu claires. Tasty propose surtout des vidéos attractives mais manque parfois de détails dans les étapes. Cookpad offre une dimension communautaire intéressante, mais la qualité des recettes peut varier et certaines fonctionnalités sont payantes.
RecipeShare cherche donc à répondre au même besoin tout en améliorant l’expérience utilisateur, en proposant des recettes claires, une recherche simple et une vraie interaction entre utilisateurs (likes, commentaires, badges). Des captures d’écran des applications existantes sont ajoutées afin de mieux comparer les interfaces et fonctionnalités.

## Public cible
L’application RecipeShare s’adresse aux amateurs de cuisine, aux étudiants et aux jeunes adultes qui aiment cuisiner ou qui cherchent des idées de recettes simples et rapides. Elle vise également les personnes qui utilisent déjà des applications de recettes et qui souhaitent partager leurs plats avec d’autres utilisateurs.
Le public cible est pris en compte grâce à une interface simple et intuitive, une recherche facile des recettes et des fonctionnalités sociales comme les likes, les commentaires et les badges. Ces éléments rendent l’application plus engageante et adaptée à des utilisateurs habitués aux applications mobiles et aux réseaux sociaux.

## Récits utilisateurs
En tant qu’utilisateur non connecté, je veux créer un compte ou me connecter afin de pouvoir accéder aux fonctionnalités de l’application et interagir avec la communauté.

En tant qu’utilisateur de l’application et amateur de cuisine, je veux créer un compte et me connecter afin de pouvoir accéder à l’ensemble des fonctionnalités et participer à la communauté.

En tant qu’utilisateur connecté, je veux consulter les recettes partagées par les autres utilisateurs afin de découvrir de nouvelles idées de plats et m’inspirer au quotidien.

En tant qu’amateur de cuisine, je veux ajouter mes propres recettes avec une image, des ingrédients et des étapes de préparation afin de partager mes créations culinaires avec la communauté.

En tant qu’utilisateur connecté, je veux aimer les recettes des autres utilisateurs afin d’exprimer mon appréciation et valoriser leur travail.

En tant qu’utilisateur connecté, je veux commenter les recettes afin de donner mon avis, poser des questions ou échanger avec les autres membres.

En tant qu’utilisateur, je veux recevoir des notifications lorsqu’un utilisateur aime ou commente une de mes recettes afin de suivre l’activité liée à mes publications.

En tant qu’utilisateur connecté, je veux rechercher des recettes par leur nom afin de trouver rapidement une recette précise.



En tant qu’utilisateur connecté, je veux consulter mon profil afin de voir mes informations personnelles, mes badges et mon activité sur l’application.

En tant qu’utilisateur, je veux obtenir des badges en fonction de mon activité (likes, commentaires, recettes publiées) afin d’être motivé à utiliser l’application régulièrement.

En tant qu’utilisateur premium, je veux utiliser l’application sans publicité afin de profiter d’une expérience plus fluide et agréable.


## Développeur section
RecipeShare est une application Flutter connectée à Firebase utilisant Firebase Authentication, Firestore, Firebase Storage, Cloud Messaging et Cloud Functions, avec une architecture basée sur des repositories et des modèles générés avec Freezed.

Prérequis : Flutter (version minimale recommandée : Flutter 3.x), Dart (inclus avec Flutter), Android Studio ou VS Code, un émulateur Android ou un appareil physique, Node.js (version 18+ recommandée) et un compte Firebase.

Vérifier l’installation de Flutter avec la commande flutter doctor.

Cloner le dépôt puis se placer à la racine du projet avec git clone <url-du-repo> puis cd recipeshare.

Installer toutes les dépendances Flutter déclarées dans le fichier pubspec.yaml avec la commande flutter pub get.

Créer un projet Firebase depuis la console Firebase, puis activer les services suivants : Authentication (Email/Mot de passe et Google), Firestore Database, Firebase Storage et Cloud Messaging.

Ajouter les fichiers de configuration Firebase dans le projet :

android/app/google-services.json pour Android et ios/Runner/GoogleService-Info.plist pour iOS.

Configurer Firebase Authentication depuis la console Firebase en activant Email/Mot de passe et Google Sign-In. Pour Android, ajouter l’empreinte SHA-1 afin que Google Sign-In fonctionne correctement.

Configurer Firestore et Firebase Storage. Firestore est utilisé pour stocker les utilisateurs, les recettes, les commentaires, les likes et les notifications. Firebase Storage est utilisé pour stocker les images des 

recettes et les photos de profil. Les règles de sécurité doivent autoriser l’accès uniquement aux utilisateurs authentifiés.

Le projet utilise Freezed pour la gestion des modèles de données. Après toute modification d’un modèle, exécuter la commande flutter pub run build_runner build --delete-conflicting-outputs.

Configurer les Firebase Cloud Functions pour la gestion des notifications. Se placer dans le dossier functions, installer les dépendances avec npm install, se connecter à Firebase avec firebase login, sélectionner le projet avec firebase use <id-du-projet>, puis déployer les fonctions avec firebase deploy --only functions.

Configurer Firebase Cloud Messaging depuis la console Firebase. Lors de la connexion d’un utilisateur, le token de l’appareil est enregistré dans Firestore afin de permettre l’envoi de notifications push lors des likes et des commentaires.

Revenir à la racine du projet avec cd .. puis lancer l’application sur un émulateur ou un appareil physique avec la commande flutter run.

Les fichiers sensibles comme google-services.json, GoogleService-Info.plist et les clés Firebase ne doivent pas être ajoutés au dépôt Git.
