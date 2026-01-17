import 'package:cloud_firestore/cloud_firestore.dart';


abstract class FirestoreRepository<T> {
  final FirebaseFirestore firestore;
  final String collectionPath;

  FirestoreRepository(this.firestore, this.collectionPath);
  CollectionReference<Map<String, dynamic>> get collection => firestore.collection(collectionPath);

  T fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot);
  Map<String, dynamic> toFirestore(T entity);

  Future<String> add(T entity) async {
    final docRef = await collection.add(toFirestore(entity));
    return docRef.id;
  }

// future veut dire que les resultats peut arriver plus tard
  Future<T?> getById(String id) async {
    final snapshot = await collection.doc(id).get();
    if (!snapshot.exists) return null;
    return fromFirestore(snapshot);
  }


  Future<List<T>> getAll() async {
    try {
      final snapshot = await collection.get();
      return snapshot.docs.map((doc) => fromFirestore(doc)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> update(String id, T entity) async {
    await collection.doc(id).update(toFirestore(entity));
  }


  Future<void> updateFields(String id, Map<String, dynamic> fields) async {
    await collection.doc(id).update(fields);
  }


  Future<void> delete(String id) async {
    await collection.doc(id).delete();
  }


  Future<int> count(String userId) async {
    final snapshot = await collection.count().get();
    return snapshot.count ?? 0;
  }

  Future<void> batchAdd(List<T> entities) async {
    final batch = firestore.batch();
    for (final entity in entities) {
      final docRef = collection.doc();
      batch.set(docRef, toFirestore(entity));
    }
    await batch.commit();
  }
}