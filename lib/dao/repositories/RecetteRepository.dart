import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeshare/dao/repositories/CommentRepository.dart';
import '../models/comment.dart';
import '../models/recette.dart';
import 'firestorerepository.dart';

class RecetteRepository extends FirestoreRepository<Recette> {
  RecetteRepository(FirebaseFirestore firestore)
      : super(firestore, 'recettes');

  @override
  Recette fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Recette.fromFirestore(snapshot);
  }

  @override
  Map<String, dynamic> toFirestore(Recette entity) {
    return entity.toFirestore();
  }


  Future<int> countByUtilisateur(String userId) async {
    final snapshot = await collection
        .where('id_utilisateur', isEqualTo: userId)
        .count()
        .get();

    return snapshot.count ?? 0;
  }


  Future<List<Recette>> getByUtilisateur(String idUtilisateur) async {
    try {
      final snapshot = await collection
          .where('id_utilisateur', isEqualTo: idUtilisateur)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) {
        try {
          return fromFirestore(doc);
        } catch (e) {
          print('Recettes invalide ignoré (${doc.id}): $e');
          return null;
        }
      })
          .whereType<Recette>()
          .toList();
    } catch (e) {
      print('Erreur lors du chargement des recettes: $e');
      return [];
    }
  }

  Future<List<Recette>> getByNomPrefix(String prefix) async {
    final snapshot = await collection
        .orderBy('nom')
        .where('nom', isGreaterThanOrEqualTo: prefix)
        .where('nom', isLessThan: prefix + '\uf8ff')
        .get();
    //\uf8ff sert à définir une borne supérieure Unicode afin de récupérer toutes les chaînes
    //qui commencent par un préfixe donné dans Firestore.
    return snapshot.docs
        .map((doc) {
      try {
        return fromFirestore(doc);
      } catch (e) {
        print('Recette invalide ignorée (${doc.id}): $e');
        return null;
      }
    })
        .whereType<Recette>()
        .toList();
  }
}