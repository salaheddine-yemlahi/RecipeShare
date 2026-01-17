import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/like.dart';
import 'firestorerepository.dart';

class LikeRepository extends FirestoreRepository<Like> {
  LikeRepository(FirebaseFirestore firestore)
      : super(firestore, 'likes');


  @override
  Like fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Like.fromFirestore(snapshot);
  }

  @override
  Map<String, dynamic> toFirestore(Like entity) {
    return entity.toFirestore();
  }

  Future<int> countLikesByRecette(String idRecette) async {
    final snapshot = await collection
        .where('id_recette', isEqualTo: idRecette)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future<int> countLikesByUtilisateurs(String idUtilisateur) async {
    final snapshot = await collection
        .where('id_utilisateur', isEqualTo: idUtilisateur)
        .count()
        .get();
    return snapshot.count ?? 0;
  }


  Future<bool> checkLike(String idRecette, String idUser) async {
    final snapshot = await collection
        .where('id_recette', isEqualTo: idRecette)
        .where('id_utilisateur', isEqualTo: idUser)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  Future<bool> addRemoveLike(String idRecette, String idUser, String idUserCreator) async {
    bool check = await checkLike(idRecette, idUser);

    if (check) {
      final snapshot = await collection
          .where('id_recette', isEqualTo: idRecette)
          .where('id_utilisateur', isEqualTo: idUser)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      }
      return false;
    } else {
      final like = Like(
        id_utilisateur_editeur: idUserCreator,
        id_recette: idRecette,
        id_utilisateur: idUser,
      );

      await collection.add(like.toFirestore());
      return true;
    }
  }

  Future<List<Like>> getLikesByUser(String userId) async {
    final snapshot = await collection
        .where('id_utilisateur_editeur', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => Like.fromFirestore(doc))
        .toList();
  }

  Future<List<Like>> getLikesForUserRecipes(List<String> recipeIds) async {
    if (recipeIds.isEmpty) return [];

    try {
      final snapshot = await collection.get();

      return snapshot.docs
          .map((doc) {
        try {
          return Like.fromFirestore(doc);
        } catch (e) {
          print('Like invalide ignoré (${doc.id}): $e');
          return null;
        }
      })
          .whereType<Like>()
          .where((like) => recipeIds.contains(like.id_recette))
          .toList();
    } catch (e) {
      print('Erreur lors du chargement des likes: $e');
      return [];
    }
  }

  Future<bool> updateLikeConsulte(String idLike) async {
    try {
      await collection.doc(idLike).update({
        'consulte': true,
      });
      return true;
    } catch (e) {
      print('Erreur updateLikeConsulte: $e');
      return false;
    }
  }
}