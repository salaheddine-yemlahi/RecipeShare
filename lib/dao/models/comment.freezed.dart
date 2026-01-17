// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String? get idComment => throw _privateConstructorUsedError;
  String get idRecette => throw _privateConstructorUsedError;
  String get id_utilisateur_editeur => throw _privateConstructorUsedError;
  String get idUtilisateur => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get consulte => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get commentDate => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call({
    String? idComment,
    String idRecette,
    String id_utilisateur_editeur,
    String idUtilisateur,
    String content,
    bool consulte,
    @TimestampConverter() DateTime commentDate,
  });
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idComment = freezed,
    Object? idRecette = null,
    Object? id_utilisateur_editeur = null,
    Object? idUtilisateur = null,
    Object? content = null,
    Object? consulte = null,
    Object? commentDate = null,
  }) {
    return _then(
      _value.copyWith(
            idComment: freezed == idComment
                ? _value.idComment
                : idComment // ignore: cast_nullable_to_non_nullable
                      as String?,
            idRecette: null == idRecette
                ? _value.idRecette
                : idRecette // ignore: cast_nullable_to_non_nullable
                      as String,
            id_utilisateur_editeur: null == id_utilisateur_editeur
                ? _value.id_utilisateur_editeur
                : id_utilisateur_editeur // ignore: cast_nullable_to_non_nullable
                      as String,
            idUtilisateur: null == idUtilisateur
                ? _value.idUtilisateur
                : idUtilisateur // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            consulte: null == consulte
                ? _value.consulte
                : consulte // ignore: cast_nullable_to_non_nullable
                      as bool,
            commentDate: null == commentDate
                ? _value.commentDate
                : commentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
    _$CommentImpl value,
    $Res Function(_$CommentImpl) then,
  ) = __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? idComment,
    String idRecette,
    String id_utilisateur_editeur,
    String idUtilisateur,
    String content,
    bool consulte,
    @TimestampConverter() DateTime commentDate,
  });
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
    _$CommentImpl _value,
    $Res Function(_$CommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idComment = freezed,
    Object? idRecette = null,
    Object? id_utilisateur_editeur = null,
    Object? idUtilisateur = null,
    Object? content = null,
    Object? consulte = null,
    Object? commentDate = null,
  }) {
    return _then(
      _$CommentImpl(
        idComment: freezed == idComment
            ? _value.idComment
            : idComment // ignore: cast_nullable_to_non_nullable
                  as String?,
        idRecette: null == idRecette
            ? _value.idRecette
            : idRecette // ignore: cast_nullable_to_non_nullable
                  as String,
        id_utilisateur_editeur: null == id_utilisateur_editeur
            ? _value.id_utilisateur_editeur
            : id_utilisateur_editeur // ignore: cast_nullable_to_non_nullable
                  as String,
        idUtilisateur: null == idUtilisateur
            ? _value.idUtilisateur
            : idUtilisateur // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        consulte: null == consulte
            ? _value.consulte
            : consulte // ignore: cast_nullable_to_non_nullable
                  as bool,
        commentDate: null == commentDate
            ? _value.commentDate
            : commentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl extends _Comment {
  _$CommentImpl({
    this.idComment,
    required this.idRecette,
    required this.id_utilisateur_editeur,
    required this.idUtilisateur,
    required this.content,
    this.consulte = false,
    @TimestampConverter() required this.commentDate,
  }) : super._();

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String? idComment;
  @override
  final String idRecette;
  @override
  final String id_utilisateur_editeur;
  @override
  final String idUtilisateur;
  @override
  final String content;
  @override
  @JsonKey()
  final bool consulte;
  @override
  @TimestampConverter()
  final DateTime commentDate;

  @override
  String toString() {
    return 'Comment(idComment: $idComment, idRecette: $idRecette, id_utilisateur_editeur: $id_utilisateur_editeur, idUtilisateur: $idUtilisateur, content: $content, consulte: $consulte, commentDate: $commentDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.idComment, idComment) ||
                other.idComment == idComment) &&
            (identical(other.idRecette, idRecette) ||
                other.idRecette == idRecette) &&
            (identical(other.id_utilisateur_editeur, id_utilisateur_editeur) ||
                other.id_utilisateur_editeur == id_utilisateur_editeur) &&
            (identical(other.idUtilisateur, idUtilisateur) ||
                other.idUtilisateur == idUtilisateur) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.consulte, consulte) ||
                other.consulte == consulte) &&
            (identical(other.commentDate, commentDate) ||
                other.commentDate == commentDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    idComment,
    idRecette,
    id_utilisateur_editeur,
    idUtilisateur,
    content,
    consulte,
    commentDate,
  );

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(this);
  }
}

abstract class _Comment extends Comment {
  factory _Comment({
    final String? idComment,
    required final String idRecette,
    required final String id_utilisateur_editeur,
    required final String idUtilisateur,
    required final String content,
    final bool consulte,
    @TimestampConverter() required final DateTime commentDate,
  }) = _$CommentImpl;
  _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String? get idComment;
  @override
  String get idRecette;
  @override
  String get id_utilisateur_editeur;
  @override
  String get idUtilisateur;
  @override
  String get content;
  @override
  bool get consulte;
  @override
  @TimestampConverter()
  DateTime get commentDate;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
