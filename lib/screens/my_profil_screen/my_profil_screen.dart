import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';

import '../../dao/models/utilisateur.dart';
import '../../dao/repositories/UtilisateurRepository.dart';

import '../home_screen/widgets/Badgets.dart';
import '../home_screen/widgets/MenuDown.dart';
import '../login_screen/widgets/login_registre_button.dart';
import '../welcome/welcome_screen.dart';

import 'widgets/profile_image_section.dart';
import 'widgets/profil_info_card.dart';
import 'widgets/profile_item.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "/my_profile_screen";

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final utilirapo = UtilisateurRepository(FirebaseFirestore.instance);

  Utilisateur? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userId = utilirapo.currentUser();
    if (userId != null) {
      try {
        final doc = await utilirapo.getById(userId);
        if (doc != null) {
          setState(() {
            userData = doc;
            isLoading = false;
          });
        }
      } catch (_) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _updateField(String field, String value) async {
    final userId = utilirapo.currentUser();
    try {
      switch (field) {
        case 'nom':
          await utilirapo.updateNom(userId, value);
          break;
        case 'prenom':
          await utilirapo.updatePrenom(userId, value);
          break;
        case 'dateNaissance':
          await utilirapo.updateDateNaissance(userId, value);
          break;
      }

      final updatedUser = await utilirapo.getById(userId);
      setState(() {
        userData = updatedUser;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Modifié avec succès')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(myProfilePadding),
        child: Column(
          children: [
            ProfileImageSection(),

            const SizedBox(height: myProfileSpacingSmall),

            Badget(idUtilisateur: utilirapo.currentUser()),

            const SizedBox(height: myProfileSpacingMedium),

            LoginRegistreButton(
              text: "Déconnexion",
              onPressed: () {
                utilirapo.signOut();
                Navigator.pushNamed(
                  context,
                  WelcomeScreen.routeName,
                );
              },
            ),

            const SizedBox(height: myProfileSpacingMedium),

            ProfileInfoCard(
              title: 'Informations personnelles',
              items: [
                ProfileItem(
                  icon: Icons.person,
                  label: 'Nom',
                  value: userData?.nom ?? '',
                  onEdit: () =>
                      _showEditDialog('nom', userData?.nom ?? ''),
                ),
                ProfileItem(
                  icon: Icons.person_outline,
                  label: 'Prénom',
                  value: userData?.prenom ?? '',
                  onEdit: () =>
                      _showEditDialog('prenom', userData?.prenom ?? ''),
                ),
                ProfileItem(
                  icon: Icons.cake,
                  label: 'Date de naissance',
                  value: _formatDate(userData?.dateNaissance ?? ''),
                  onEdit: _showDatePicker,
                ),
              ],
            ),

            const SizedBox(height: myProfileSpacingLarge),

            ProfileInfoCard(
              title: 'Contact',
              items: [
                ProfileItem(
                  icon: Icons.email,
                  label: 'Email',
                  value: userData?.email ?? '',
                  onEdit: null,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuDown(),
    );
  }

  String _formatDate(String date) {
    if (date.isEmpty) return '';
    try {
      if (date.contains('/')) return date;
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (_) {
      return date;
    }
  }

  void _showEditDialog(String field, String currentValue) {
    final controller = TextEditingController(text: currentValue);
    final label = field == 'nom' ? 'Nom' : 'Prénom';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Modifier $label',
          style: profileDialogTitleStyle(context),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                _updateField(field, controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formatted = DateFormat('dd/MM/yyyy').format(picked);
      _updateField('dateNaissance', formatted);
    }
  }
}
