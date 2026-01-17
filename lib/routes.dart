import 'package:recipeshare/screens/add_recipe_screen/AddRecipeScreen.dart';
import 'package:recipeshare/screens/auth_entre/auth_entre.dart';
import 'package:recipeshare/screens/home_screen/HomeScreen.dart';
import 'package:recipeshare/screens/my_profil_screen/my_profil_screen.dart';
import 'package:recipeshare/screens/notification_screen/notification_screen.dart';
import 'package:recipeshare/screens/profil_screen/profil_screen.dart';
import 'package:recipeshare/screens/recipe_details_screen/RecipeDetailPage.dart';
import 'package:recipeshare/screens/register_screen/register_screen.dart';
import 'package:recipeshare/screens/search_screen/search_screen.dart';
import 'package:recipeshare/screens/welcome/welcome_screen.dart';
import 'package:recipeshare/screens/login_screen/login_screen.dart';
import 'package:recipeshare/screens/profil_creation/profile_creation.dart';




final routes = {
    AuthEntre.routeName: (context) => const AuthEntre(),
    WelcomeScreen.routeName: (context) => const WelcomeScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    ProfileCreation.routeName: (context) => const ProfileCreation(),
    HomeScreen.routeName: (context) =>  HomeScreen(),
    RecipeDetailPage.routeName: (contexte) => RecipeDetailPage(),
    SearchScreen.routeName: (contexte) => SearchScreen(),
    NotificationsScreen.routeName: (contexte) => NotificationsScreen(),
    MyProfileScreen.routeName: (contexte) => MyProfileScreen(),
    ProfileScreen.routeName: (contexte) => ProfileScreen(),
    AddRecipePage.routeName: (contexte) => AddRecipePage(),
};