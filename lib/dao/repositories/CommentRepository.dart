import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment.dart';
import 'firestorerepository.dart';

class CommentRepository extends FirestoreRepository<Comment> {
  CommentRepository(FirebaseFirestore firestore)
      : super(firestore, 'comments');

  @override
  Comment fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Comment.fromFirestore(snapshot);
  }

  Future<int> countByUtilisateur(String userId) async {
    final snapshot = await collection
        .where('id_utilisateur', isEqualTo: userId)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  @override
  Map<String, dynamic> toFirestore(Comment entity) {
    return entity.toFirestore();
  }


  Future<int> countCommentsByRecette(String idRecette) async {
    final snapshot = await collection
        .where('idRecette', isEqualTo: idRecette)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future<int> countCommentsByUtilisateur(String idUtilisateur) async {
    final snapshot = await collection
        .where('idUtilisateur', isEqualTo: idUtilisateur)
        .count()
        .get();
    return snapshot.count ?? 0;
  }


  Future<List<Comment>> getCommentsByRecette(String idRecette) async {
    try {
      final snapshot = await collection
          .where('idRecette', isEqualTo: idRecette)
          .get();

      return snapshot.docs
          .map((doc) {
        try {
          return fromFirestore(doc);
        } catch (e) {
          print('Commentaire invalide ignoré (${doc.id}): $e');
          return null;
        }
      })
          .whereType<Comment>()
          .toList();
    } catch (e) {
      print('Erreur lors du chargement des commentaires: $e');
      return [];
    }
  }


  Future<String> addComment(Comment comment) async {
    final docRef = await collection.add(comment.toFirestore());
    return docRef.id;
  }

  Future<bool> updateCommentConsulte(String idComment) async {
    try {
      await collection.doc(idComment).update({
        'consulte': true,
      });
      return true;
    } catch (e) {
      print('Erreur updateCommentConsulte: $e');
      return false;
    }
  }


  Future<List<Comment>> getCommentsForUserRecipes(List<String> recipeIds) async {
    if (recipeIds.isEmpty) return [];

    try {
      final snapshot = await collection
          .where('idRecette', whereIn: recipeIds)
          .orderBy('commentDate', descending: true)
          .get();

      return snapshot.docs
          .map((doc) {
        try {
          return Comment.fromFirestore(doc);
        } catch (e) {
          print('Commentaire invalide ignoré (${doc.id}): $e');
          return null;
        }
      })
          .whereType<Comment>()
          .toList();
    } catch (e) {
      print('Erreur lors du chargement des commentaires: $e');
      return [];
    }
  }
}