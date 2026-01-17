// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecetteImpl _$$RecetteImplFromJson(Map<String, dynamic> json) =>
    _$RecetteImpl(
      id_recette: json['id_recette'] as String?,
      id_utilisateur: json['id_utilisateur'] as String?,
      imageUrl: json['imageUrl'] as String,
      nom: json['nom'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      temps: json['temps'] as String,
      description: json['description'] as String,
      preparation: json['preparation'] as String,
      createdAt: _timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$RecetteImplToJson(_$RecetteImpl instance) =>
    <String, dynamic>{
      'id_recette': instance.id_recette,
      'id_utilisateur': instance.id_utilisateur,
      'imageUrl': instance.imageUrl,
      'nom': instance.nom,
      'ingredients': instance.ingredients,
      'temps': instance.temps,
      'description': instance.description,
      'preparation': instance.preparation,
      'createdAt': _timestampToJson(instance.createdAt),
    };
