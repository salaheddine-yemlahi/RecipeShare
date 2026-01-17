import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeshare/screens/add_recipe_screen/widgets/AddImageWidget.dart';
import 'package:recipeshare/screens/add_recipe_screen/widgets/IngredientsSectionWidget.dart';
import '../../../dao/models/recette.dart';
import '../../../dao/repositories/RecetteRepository.dart';
import '../../constants/fonctions.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../../dao/repositories/UtilisateurRepository.dart';
import '../home_screen/widgets/MenuDown.dart';
import '../login_screen/widgets/login_registre_button.dart';

class AddRecipePage extends StatefulWidget {
  static const String routeName = '/add-recipe';

  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _nomController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _preparationController = TextEditingController();

  final daoUtilisateur = UtilisateurRepository(FirebaseFirestore.instance);
  final daoRecette = RecetteRepository(FirebaseFirestore.instance);

  File? _selectedImage;
  var _isLoading = false;
  final List<String> _ingredients = [];

  void _addIngredient(String ingredient) {
    setState(() => _ingredients.add(ingredient));
  }

  void _removeIngredient(int index) {
    setState(() => _ingredients.removeAt(index));
  }

  Future<void> _submitRecipe() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner une image'),
          backgroundColor: errorColor,
        ),
      );
      return;
    }

    if (_ingredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez ajouter au moins un ingrédient'),
          backgroundColor: errorColor,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = daoUtilisateur.currentUser();
      if (userId == null) {
        throw Exception('Utilisateur non connecté');
      }

      final imageUrl = await daoUtilisateur.addImage(_selectedImage!);
      if (imageUrl == null) {
        throw Exception('Erreur lors de l\'upload de l\'image');
      }

      final recette = Recette(
        id_utilisateur: userId,
        imageUrl: imageUrl,
        nom: _nomController.text.trim(),
        ingredients: _ingredients,
        description: _descriptionController.text.trim(),
        preparation: _preparationController.text.trim(),
        temps: '',
        createdAt: DateTime.now(),
      );

      await daoRecette.add(recette);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recette ajoutée avec succès !'),
          backgroundColor: successColor,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur : ${e.toString()}'),
          backgroundColor: errorColor,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage() async {
    final imageFile = await pickImageFromGallery();
    if (imageFile != null) {
      setState(() => _selectedImage = imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(pagePadding),
        child: Column(
          children: [
            Addimagewidget(
              selectedImage: _selectedImage,
              isLoading: _isLoading,
              onPickImage: _pickImage,
            ),


            const SizedBox(height: spaceMedium),

            TextFormField(
              controller: _nomController,
              decoration: textFieldBaseDecoration.copyWith(
                labelText: 'Nom de la recette',
                prefixIcon: const Icon(Icons.restaurant),
              ),
            ),

            const SizedBox(height: spaceSmall),

            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: textFieldBaseDecoration.copyWith(
                labelText: 'Description',
                prefixIcon: const Icon(Icons.description),
              ),
            ),

            const SizedBox(height: spaceMedium),

            IngredientsSectionWidget(
              ingredients: _ingredients,
              onAddIngredient: _addIngredient,
              onRemoveIngredient: _removeIngredient,
            ),

            const SizedBox(height: spaceMedium),

            TextFormField(
              controller: _preparationController,
              maxLines: 8,
              decoration: textFieldBaseDecoration.copyWith(
                labelText: 'Étapes de préparation',
                prefixIcon: const Icon(Icons.format_list_numbered),
              ),
            ),

            const SizedBox(height: spaceMedium),

            LoginRegistreButton(
              text: 'Ajouter',
              onPressed: _submitRecipe,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuDown(),
    );
  }
}
