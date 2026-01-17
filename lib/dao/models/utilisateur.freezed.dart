// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utilisateur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Utilisateur _$UtilisateurFromJson(Map<String, dynamic> json) {
  return _Utilisateur.fromJson(json);
}

/// @nodoc
mixin _$Utilisateur {
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get dateNaissance => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Utilisateur to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Utilisateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtilisateurCopyWith<Utilisateur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtilisateurCopyWith<$Res> {
  factory $UtilisateurCopyWith(
    Utilisateur value,
    $Res Function(Utilisateur) then,
  ) = _$UtilisateurCopyWithImpl<$Res, Utilisateur>;
  @useResult
  $Res call({
    String? id,
    String nom,
    String prenom,
    String email,
    String? imageUrl,
    String dateNaissance,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime createdAt,
  });
}

/// @nodoc
class _$UtilisateurCopyWithImpl<$Res, $Val extends Utilisateur>
    implements $UtilisateurCopyWith<$Res> {
  _$UtilisateurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Utilisateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? email = null,
    Object? imageUrl = freezed,
    Object? dateNaissance = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            nom: null == nom
                ? _value.nom
                : nom // ignore: cast_nullable_to_non_nullable
                      as String,
            prenom: null == prenom
                ? _value.prenom
                : prenom // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateNaissance: null == dateNaissance
                ? _value.dateNaissance
                : dateNaissance // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UtilisateurImplCopyWith<$Res>
    implements $UtilisateurCopyWith<$Res> {
  factory _$$UtilisateurImplCopyWith(
    _$UtilisateurImpl value,
    $Res Function(_$UtilisateurImpl) then,
  ) = __$$UtilisateurImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String nom,
    String prenom,
    String email,
    String? imageUrl,
    String dateNaissance,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime createdAt,
  });
}

/// @nodoc
class __$$UtilisateurImplCopyWithImpl<$Res>
    extends _$UtilisateurCopyWithImpl<$Res, _$UtilisateurImpl>
    implements _$$UtilisateurImplCopyWith<$Res> {
  __$$UtilisateurImplCopyWithImpl(
    _$UtilisateurImpl _value,
    $Res Function(_$UtilisateurImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Utilisateur
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? email = null,
    Object? imageUrl = freezed,
    Object? dateNaissance = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$UtilisateurImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        nom: null == nom
            ? _value.nom
            : nom // ignore: cast_nullable_to_non_nullable
                  as String,
        prenom: null == prenom
            ? _value.prenom
            : prenom // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateNaissance: null == dateNaissance
            ? _value.dateNaissance
            : dateNaissance // ignore: cast_nullable_to_non_nullable
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
class _$UtilisateurImpl extends _Utilisateur {
  _$UtilisateurImpl({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    this.imageUrl,
    required this.dateNaissance,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required this.createdAt,
  }) : super._();

  factory _$UtilisateurImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtilisateurImplFromJson(json);

  @override
  final String? id;
  @override
  final String nom;
  @override
  final String prenom;
  @override
  final String email;
  @override
  final String? imageUrl;
  @override
  final String dateNaissance;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'Utilisateur(id: $id, nom: $nom, prenom: $prenom, email: $email, imageUrl: $imageUrl, dateNaissance: $dateNaissance, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtilisateurImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nom,
    prenom,
    email,
    imageUrl,
    dateNaissance,
    createdAt,
  );

  /// Create a copy of Utilisateur
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtilisateurImplCopyWith<_$UtilisateurImpl> get copyWith =>
      __$$UtilisateurImplCopyWithImpl<_$UtilisateurImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtilisateurImplToJson(this);
  }
}

abstract class _Utilisateur extends Utilisateur {
  factory _Utilisateur({
    final String? id,
    required final String nom,
    required final String prenom,
    required final String email,
    final String? imageUrl,
    required final String dateNaissance,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    required final DateTime createdAt,
  }) = _$UtilisateurImpl;
  _Utilisateur._() : super._();

  factory _Utilisateur.fromJson(Map<String, dynamic> json) =
      _$UtilisateurImpl.fromJson;

  @override
  String? get id;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  String get email;
  @override
  String? get imageUrl;
  @override
  String get dateNaissance;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime get createdAt;

  /// Create a copy of Utilisateur
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtilisateurImplCopyWith<_$UtilisateurImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
