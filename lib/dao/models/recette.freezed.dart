// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Recette _$RecetteFromJson(Map<String, dynamic> json) {
  return _Recette.fromJson(json);
}

/// @nodoc
mixin _$Recette {
  String? get id_recette => throw _privateConstructorUsedError;
  String? get id_utilisateur => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get temps => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get preparation => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Recette to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecetteCopyWith<Recette> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecetteCopyWith<$Res> {
  factory $RecetteCopyWith(Recette value, $Res Function(Recette) then) =
      _$RecetteCopyWithImpl<$Res, Recette>;
  @useResult
  $Res call({
    String? id_recette,
    String? id_utilisateur,
    String imageUrl,
    String nom,
    List<String> ingredients,
    String temps,
    String description,
    String preparation,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime createdAt,
  });
}

/// @nodoc
class _$RecetteCopyWithImpl<$Res, $Val extends Recette>
    implements $RecetteCopyWith<$Res> {
  _$RecetteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_recette = freezed,
    Object? id_utilisateur = freezed,
    Object? imageUrl = null,
    Object? nom = null,
    Object? ingredients = null,
    Object? temps = null,
    Object? description = null,
    Object? preparation = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id_recette: freezed == id_recette
                ? _value.id_recette
                : id_recette // ignore: cast_nullable_to_non_nullable
                      as String?,
            id_utilisateur: freezed == id_utilisateur
                ? _value.id_utilisateur
                : id_utilisateur // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            ingredients: null == ingredients
                ? _value.ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            temps: null == temps
                ? _value.temps
                : temps // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            preparation: null == preparation
                ? _value.preparation
                : preparation // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecetteImplCopyWith<$Res> implements $RecetteCopyWith<$Res> {
  factory _$$RecetteImplCopyWith(
    _$RecetteImpl value,
    $Res Function(_$RecetteImpl) then,
  ) = __$$RecetteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id_recette,
    String? id_utilisateur,
    String imageUrl,
    String nom,
    List<String> ingredients,
    String temps,
    String description,
    String preparation,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime createdAt,
  });
}

/// @nodoc
class __$$RecetteImplCopyWithImpl<$Res>
    extends _$RecetteCopyWithImpl<$Res, _$RecetteImpl>
    implements _$$RecetteImplCopyWith<$Res> {
  __$$RecetteImplCopyWithImpl(
    _$RecetteImpl _value,
    $Res Function(_$RecetteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Recette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_recette = freezed,
    Object? id_utilisateur = freezed,
    Object? imageUrl = null,
    Object? nom = null,
    Object? ingredients = null,
    Object? temps = null,
    Object? description = null,
    Object? preparation = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$RecetteImpl(
        id_recette: freezed == id_recette
            ? _value.id_recette
            : id_recette // ignore: cast_nullable_to_non_nullable
                  as String?,
        id_utilisateur: freezed == id_utilisateur
            ? _value.id_utilisateur
            : id_utilisateur // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        ingredients: null == ingredients
            ? _value._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        temps: null == temps
            ? _value.temps
            : temps // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        preparation: null == preparation
            ? _value.preparation
            : preparation // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecetteImpl extends _Recette {
  _$RecetteImpl({
    this.id_recette,
    this.id_utilisateur,
    required this.imageUrl,
    required this.nom,
    required final List<String> ingredients,
    required this.temps,
    required this.description,
    required this.preparation,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required this.createdAt,
  }) : _ingredients = ingredients,
       super._();

  factory _$RecetteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecetteImplFromJson(json);

  @override
  final String? id_recette;
  @override
  final String? id_utilisateur;
  @override
  final String imageUrl;
  @override
  final String nom;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String temps;
  @override
  final String description;
  @override
  final String preparation;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'Recette(id_recette: $id_recette, id_utilisateur: $id_utilisateur, imageUrl: $imageUrl, nom: $nom, ingredients: $ingredients, temps: $temps, description: $description, preparation: $preparation, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecetteImpl &&
            (identical(other.id_recette, id_recette) ||
                other.id_recette == id_recette) &&
            (identical(other.id_utilisateur, id_utilisateur) ||
                other.id_utilisateur == id_utilisateur) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            (identical(other.temps, temps) || other.temps == temps) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.preparation, preparation) ||
                other.preparation == preparation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id_recette,
    id_utilisateur,
    imageUrl,
    nom,
    const DeepCollectionEquality().hash(_ingredients),
    temps,
    description,
    preparation,
    createdAt,
  );

  /// Create a copy of Recette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecetteImplCopyWith<_$RecetteImpl> get copyWith =>
      __$$RecetteImplCopyWithImpl<_$RecetteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecetteImplToJson(this);
  }
}

abstract class _Recette extends Recette {
  factory _Recette({
    final String? id_recette,
    final String? id_utilisateur,
    required final String imageUrl,
    required final String nom,
    required final List<String> ingredients,
    required final String temps,
    required final String description,
    required final String preparation,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required final DateTime createdAt,
  }) = _$RecetteImpl;
  _Recette._() : super._();

  factory _Recette.fromJson(Map<String, dynamic> json) = _$RecetteImpl.fromJson;

  @override
  String? get id_recette;
  @override
  String? get id_utilisateur;
  @override
  String get imageUrl;
  @override
  String get nom;
  @override
  List<String> get ingredients;
  @override
  String get temps;
  @override
  String get description;
  @override
  String get preparation;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime get createdAt;

  /// Create a copy of Recette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecetteImplCopyWith<_$RecetteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
