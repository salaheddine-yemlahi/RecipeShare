import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'recette.freezed.dart';
part 'recette.g.dart';


DateTime _timestampFromJson(dynamic timestamp) {
  return timestamp.toDate();
}

Timestamp _timestampToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}

@freezed
class Recette with _$Recette {
  const Recette._();

  factory Recette({
    String? id_recette,
    String? id_utilisateur,
    required String imageUrl,
    required String nom,
    required List<String> ingredients,
    required String temps,
    required String description,
    required String preparation,
    // ça montre à json_serializable quelle methode à utiliser pour les dates.
    @JsonKey(
        fromJson: _timestampFromJson,
        toJson: _timestampToJson
    )
    required DateTime createdAt,
  }) = _Recette;

  factory Recette.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,) {
    final data = {...snapshot.data()!};
    data['id_recette'] = snapshot.id;
    return Recette.fromJson(data);
  }

  factory Recette.fromJson(Map<String, dynamic> json) =>
      _$RecetteFromJson(json);

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id_recette');
    return json;
  }
}
