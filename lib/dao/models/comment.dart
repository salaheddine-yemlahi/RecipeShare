import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const Comment._();

  factory Comment({
    String? idComment,

    required String idRecette,
    required String id_utilisateur_editeur,
    required String idUtilisateur,
    required String content,
    @Default(false) bool consulte,

    @TimestampConverter()
    required DateTime commentDate,
  }) = _Comment;


  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);


  factory Comment.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final data = snapshot.data();

    if (data == null) {
      throw StateError('Document comments/${snapshot.id} est vide');
    }


    final rawDate = data['commentDate'];
    if (rawDate == null ||
        !(rawDate is Timestamp || rawDate is DateTime)) {
      throw StateError(
        'commentDate invalide dans comments/${snapshot.id}: $rawDate',
      );
    }

    return Comment.fromJson({
      ...data,
      'commentDate': rawDate is Timestamp
          ? rawDate
          : Timestamp.fromDate(rawDate),
      'idComment': snapshot.id,
    });
  }
  



  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('idComment');
    return json;
  }
}


class TimestampConverter
    implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}
