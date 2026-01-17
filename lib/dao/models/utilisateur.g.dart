// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utilisateur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtilisateurImpl _$$UtilisateurImplFromJson(Map<String, dynamic> json) =>
    _$UtilisateurImpl(
      id: json['id'] as String?,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String?,
      dateNaissance: json['dateNaissance'] as String,
      createdAt: _timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$UtilisateurImplToJson(_$UtilisateurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'dateNaissance': instance.dateNaissance,
      'createdAt': _timestampToJson(instance.createdAt),
    };
