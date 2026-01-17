import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'utilisateur.freezed.dart';
part 'utilisateur.g.dart';

DateTime _timestampFromJson(dynamic value) {
  return value.toDate();
}

Timestamp _timestampToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}

@freezed
class Utilisateur with _$Utilisateur {
  const Utilisateur._();

  factory Utilisateur({
    String? id,

    required String nom,
    required String prenom,
    required String email,


    String? imageUrl,


    required String dateNaissance,

    @JsonKey(
        fromJson: _timestampFromJson,
        toJson: _timestampToJson
    )

    required DateTime createdAt,
  }) = _Utilisateur;

  factory Utilisateur.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,) {
    final data = {...snapshot.data()!};
    data['id'] = snapshot.id;
    return Utilisateur.fromJson(data);
  }

  factory Utilisateur.fromJson(Map<String, dynamic> json) =>
      _$UtilisateurFromJson(json);

  get imageUrl => imageUrl;

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
