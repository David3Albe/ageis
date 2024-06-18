// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_preparo_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemEtiquetaPreparoUsuarioResponseDTO
    _$ItemEtiquetaPreparoUsuarioResponseDTOFromJson(Map<String, dynamic> json) {
  return _ItemEtiquetaPreparoUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaPreparoUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  String? get docClasse => throw _privateConstructorUsedError;
  set docClasse(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaPreparoUsuarioResponseDTOCopyWith<
          ItemEtiquetaPreparoUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  factory $ItemEtiquetaPreparoUsuarioResponseDTOCopyWith(
          ItemEtiquetaPreparoUsuarioResponseDTO value,
          $Res Function(ItemEtiquetaPreparoUsuarioResponseDTO) then) =
      _$ItemEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
          ItemEtiquetaPreparoUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome, String? docClasse});
}

/// @nodoc
class _$ItemEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends ItemEtiquetaPreparoUsuarioResponseDTO>
    implements $ItemEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  _$ItemEtiquetaPreparoUsuarioResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? docClasse = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      docClasse: freezed == docClasse
          ? _value.docClasse
          : docClasse // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWith<$Res>
    implements $ItemEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWith(
          _$ItemEtiquetaPreparoUsuarioResponseDTOImpl value,
          $Res Function(_$ItemEtiquetaPreparoUsuarioResponseDTOImpl) then) =
      __$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome, String? docClasse});
}

/// @nodoc
class __$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
        _$ItemEtiquetaPreparoUsuarioResponseDTOImpl>
    implements _$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl(
      _$ItemEtiquetaPreparoUsuarioResponseDTOImpl _value,
      $Res Function(_$ItemEtiquetaPreparoUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? docClasse = freezed,
  }) {
    return _then(_$ItemEtiquetaPreparoUsuarioResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      docClasse: freezed == docClasse
          ? _value.docClasse
          : docClasse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemEtiquetaPreparoUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemEtiquetaPreparoUsuarioResponseDTO {
  _$ItemEtiquetaPreparoUsuarioResponseDTOImpl(
      {required this.cod, required this.nome, this.docClasse});

  factory _$ItemEtiquetaPreparoUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemEtiquetaPreparoUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;
  @override
  String? docClasse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEtiquetaPreparoUsuarioResponseDTO(cod: $cod, nome: $nome, docClasse: $docClasse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ItemEtiquetaPreparoUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('docClasse', docClasse));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWith<
          _$ItemEtiquetaPreparoUsuarioResponseDTOImpl>
      get copyWith => __$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<
          _$ItemEtiquetaPreparoUsuarioResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaPreparoUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaPreparoUsuarioResponseDTO
    implements ItemEtiquetaPreparoUsuarioResponseDTO {
  factory _ItemEtiquetaPreparoUsuarioResponseDTO(
      {required int cod,
      required String nome,
      String? docClasse}) = _$ItemEtiquetaPreparoUsuarioResponseDTOImpl;

  factory _ItemEtiquetaPreparoUsuarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ItemEtiquetaPreparoUsuarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  String? get docClasse;
  set docClasse(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaPreparoUsuarioResponseDTOImplCopyWith<
          _$ItemEtiquetaPreparoUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
