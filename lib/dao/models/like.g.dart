// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikeImpl _$$LikeImplFromJson(Map<String, dynamic> json) => _$LikeImpl(
  id_like: json['id_like'] as String?,
  id_utilisateur_editeur: json['id_utilisateur_editeur'] as String?,
  id_recette: json['id_recette'] as String?,
  id_utilisateur: json['id_utilisateur'] as String?,
  consulte: json['consulte'] as bool? ?? false,
);

Map<String, dynamic> _$$LikeImplToJson(_$LikeImpl instance) =>
    <String, dynamic>{
      'id_like': instance.id_like,
      'id_utilisateur_editeur': instance.id_utilisateur_editeur,
      'id_recette': instance.id_recette,
      'id_utilisateur': instance.id_utilisateur,
      'consulte': instance.consulte,
    };
