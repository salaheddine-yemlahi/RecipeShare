// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
mixin _$Like {
  String? get id_like => throw _privateConstructorUsedError;
  String? get id_utilisateur_editeur => throw _privateConstructorUsedError;
  String? get id_recette => throw _privateConstructorUsedError;
  String? get id_utilisateur => throw _privateConstructorUsedError;
  bool get consulte => throw _privateConstructorUsedError;

  /// Serializes this Like to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res, Like>;
  @useResult
  $Res call({
    String? id_like,
    String? id_utilisateur_editeur,
    String? id_recette,
    String? id_utilisateur,
    bool consulte,
  });
}

/// @nodoc
class _$LikeCopyWithImpl<$Res, $Val extends Like>
    implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_like = freezed,
    Object? id_utilisateur_editeur = freezed,
    Object? id_recette = freezed,
    Object? id_utilisateur = freezed,
    Object? consulte = null,
  }) {
    return _then(
      _value.copyWith(
            id_like: freezed == id_like
                ? _value.id_like
                : id_like // ignore: cast_nullable_to_non_nullable
                      as String?,
            id_utilisateur_editeur: freezed == id_utilisateur_editeur
                ? _value.id_utilisateur_editeur
                : id_utilisateur_editeur // ignore: cast_nullable_to_non_nullable
                      as String?,
            id_recette: freezed == id_recette
                ? _value.id_recette
                : id_recette // ignore: cast_nullable_to_non_nullable
                      as String?,
            id_utilisateur: freezed == id_utilisateur
                ? _value.id_utilisateur
                : id_utilisateur // ignore: cast_nullable_to_non_nullable
                      as String?,
            consulte: null == consulte
                ? _value.consulte
                : consulte // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LikeImplCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$$LikeImplCopyWith(
    _$LikeImpl value,
    $Res Function(_$LikeImpl) then,
  ) = __$$LikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id_like,
    String? id_utilisateur_editeur,
    String? id_recette,
    String? id_utilisateur,
    bool consulte,
  });
}

/// @nodoc
class __$$LikeImplCopyWithImpl<$Res>
    extends _$LikeCopyWithImpl<$Res, _$LikeImpl>
    implements _$$LikeImplCopyWith<$Res> {
  __$$LikeImplCopyWithImpl(_$LikeImpl _value, $Res Function(_$LikeImpl) _then)
    : super(_value, _then);

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_like = freezed,
    Object? id_utilisateur_editeur = freezed,
    Object? id_recette = freezed,
    Object? id_utilisateur = freezed,
    Object? consulte = null,
  }) {
    return _then(
      _$LikeImpl(
        id_like: freezed == id_like
            ? _value.id_like
            : id_like // ignore: cast_nullable_to_non_nullable
                  as String?,
        id_utilisateur_editeur: freezed == id_utilisateur_editeur
            ? _value.id_utilisateur_editeur
            : id_utilisateur_editeur // ignore: cast_nullable_to_non_nullable
                  as String?,
        id_recette: freezed == id_recette
            ? _value.id_recette
            : id_recette // ignore: cast_nullable_to_non_nullable
                  as String?,
        id_utilisateur: freezed == id_utilisateur
            ? _value.id_utilisateur
            : id_utilisateur // ignore: cast_nullable_to_non_nullable
                  as String?,
        consulte: null == consulte
            ? _value.consulte
            : consulte // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeImpl extends _Like {
  _$LikeImpl({
    this.id_like,
    required this.id_utilisateur_editeur,
    required this.id_recette,
    required this.id_utilisateur,
    this.consulte = false,
  }) : super._();

  factory _$LikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeImplFromJson(json);

  @override
  final String? id_like;
  @override
  final String? id_utilisateur_editeur;
  @override
  final String? id_recette;
  @override
  final String? id_utilisateur;
  @override
  @JsonKey()
  final bool consulte;

  @override
  String toString() {
    return 'Like(id_like: $id_like, id_utilisateur_editeur: $id_utilisateur_editeur, id_recette: $id_recette, id_utilisateur: $id_utilisateur, consulte: $consulte)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeImpl &&
            (identical(other.id_like, id_like) || other.id_like == id_like) &&
            (identical(other.id_utilisateur_editeur, id_utilisateur_editeur) ||
                other.id_utilisateur_editeur == id_utilisateur_editeur) &&
            (identical(other.id_recette, id_recette) ||
                other.id_recette == id_recette) &&
            (identical(other.id_utilisateur, id_utilisateur) ||
                other.id_utilisateur == id_utilisateur) &&
            (identical(other.consulte, consulte) ||
                other.consulte == consulte));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id_like,
    id_utilisateur_editeur,
    id_recette,
    id_utilisateur,
    consulte,
  );

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeImplCopyWith<_$LikeImpl> get copyWith =>
      __$$LikeImplCopyWithImpl<_$LikeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeImplToJson(this);
  }
}

abstract class _Like extends Like {
  factory _Like({
    final String? id_like,
    required final String? id_utilisateur_editeur,
    required final String? id_recette,
    required final String? id_utilisateur,
    final bool consulte,
  }) = _$LikeImpl;
  _Like._() : super._();

  factory _Like.fromJson(Map<String, dynamic> json) = _$LikeImpl.fromJson;

  @override
  String? get id_like;
  @override
  String? get id_utilisateur_editeur;
  @override
  String? get id_recette;
  @override
  String? get id_utilisateur;
  @override
  bool get consulte;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeImplCopyWith<_$LikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
