// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      idComment: json['idComment'] as String?,
      idRecette: json['idRecette'] as String,
      id_utilisateur_editeur: json['id_utilisateur_editeur'] as String,
      idUtilisateur: json['idUtilisateur'] as String,
      content: json['content'] as String,
      consulte: json['consulte'] as bool? ?? false,
      commentDate: const TimestampConverter().fromJson(
        json['commentDate'] as Timestamp,
      ),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'idComment': instance.idComment,
      'idRecette': instance.idRecette,
      'id_utilisateur_editeur': instance.id_utilisateur_editeur,
      'idUtilisateur': instance.idUtilisateur,
      'content': instance.content,
      'consulte': instance.consulte,
      'commentDate': const TimestampConverter().toJson(instance.commentDate),
    };
