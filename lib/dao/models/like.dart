import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like{
  const Like._(); // constructeur privé pour ajouter des methodes après.
  factory Like({ // factory controle la creation et genere une classe _Like.
    String? id_like,
    required String? id_utilisateur_editeur,
    required String? id_recette,
    required String? id_utilisateur,
    @Default(false) bool consulte,
  }) = _Like; // la vari classe generée par freezed.

  factory Like.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,) {
    // traite chaque document separament.
    final data = {...snapshot.data()!};
    // ... pour créer un autre map pour ne pas modifier directement le snapshot vient du firebase.
    data['id_like'] = snapshot.id;
    return Like.fromJson(data);
  }

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  // n'importa factory dans une classe doit retourner un objet de meme classe.

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id_like');
    return json;
  }
}