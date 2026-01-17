import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/utilisateur.dart';
import 'firestorerepository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UtilisateurRepository extends FirestoreRepository<Utilisateur> {
  UtilisateurRepository(FirebaseFirestore firestore)
      : super(firestore, 'users');

  @override
  Utilisateur fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Utilisateur.fromFirestore(snapshot);
  }

  @override
  Map<String, dynamic> toFirestore(Utilisateur entity) {
    return entity.toFirestore();
  }

  String currentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('Aucun utilisateur connecté');
    }
    return user.uid;
  }



  Future<void> updateProfilImage(String idUtilisateur, File imagePath) async {
    final storageRef = FirebaseStorage.instance.ref().child('$idUtilisateur.jpg');
    await storageRef.putFile(imagePath);

    final downloadUrl = await storageRef.getDownloadURL();

    updateImage(idUtilisateur, downloadUrl);
  }

  Future<String> addImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    final ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('$fileName.jpg');

    await ref.putFile(imageFile);

    final downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }



  Future<void> updateImage(String id, String ImageUrl) async {
    await updateFields(id, {'imageUrl': ImageUrl});
  }

  Future<void> updateNom(String id, String nom) async {
    await updateFields(id, {'nom': nom});
  }

  Future<void> updatePrenom(String id, String prenom) async {
    await updateFields(id, {'prenom': prenom});
  }


  Future<void> updateDateNaissance(String id, String dateNaissance) async {
    await updateFields(id, {'dateNaissance': dateNaissance});
  }


  Future<void> updateApareilToken() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({
      'fcmToken': token,
    });
  }

  Future<UserCredential> checkConnexion(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return false;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.additionalUserInfo?.isNewUser ?? false;
    } catch (e) {
      print("Erreur Google Sign-In: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}