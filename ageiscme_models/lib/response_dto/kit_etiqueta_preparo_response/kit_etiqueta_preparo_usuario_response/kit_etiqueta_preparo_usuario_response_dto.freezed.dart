// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_etiqueta_preparo_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitEtiquetaPreparoUsuarioResponseDTO
    _$KitEtiquetaPreparoUsuarioResponseDTOFromJson(Map<String, dynamic> json) {
  return _KitEtiquetaPreparoUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitEtiquetaPreparoUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  String? get docClasse => throw _privateConstructorUsedError;
  set docClasse(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitEtiquetaPreparoUsuarioResponseDTOCopyWith<
          KitEtiquetaPreparoUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  factory $KitEtiquetaPreparoUsuarioResponseDTOCopyWith(
          KitEtiquetaPreparoUsuarioResponseDTO value,
          $Res Function(KitEtiquetaPreparoUsuarioResponseDTO) then) =
      _$KitEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
          KitEtiquetaPreparoUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome, String? docClasse});
}

/// @nodoc
class _$KitEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends KitEtiquetaPreparoUsuarioResponseDTO>
    implements $KitEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  _$KitEtiquetaPreparoUsuarioResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWith<$Res>
    implements $KitEtiquetaPreparoUsuarioResponseDTOCopyWith<$Res> {
  factory _$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWith(
          _$KitEtiquetaPreparoUsuarioResponseDTOImpl value,
          $Res Function(_$KitEtiquetaPreparoUsuarioResponseDTOImpl) then) =
      __$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome, String? docClasse});
}

/// @nodoc
class __$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$KitEtiquetaPreparoUsuarioResponseDTOCopyWithImpl<$Res,
        _$KitEtiquetaPreparoUsuarioResponseDTOImpl>
    implements _$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWith<$Res> {
  __$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl(
      _$KitEtiquetaPreparoUsuarioResponseDTOImpl _value,
      $Res Function(_$KitEtiquetaPreparoUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
    Object? docClasse = freezed,
  }) {
    return _then(_$KitEtiquetaPreparoUsuarioResponseDTOImpl(
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
class _$KitEtiquetaPreparoUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitEtiquetaPreparoUsuarioResponseDTO {
  _$KitEtiquetaPreparoUsuarioResponseDTOImpl(
      {required this.cod, required this.nome, this.docClasse});

  factory _$KitEtiquetaPreparoUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitEtiquetaPreparoUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;
  @override
  String? docClasse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitEtiquetaPreparoUsuarioResponseDTO(cod: $cod, nome: $nome, docClasse: $docClasse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitEtiquetaPreparoUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('docClasse', docClasse));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWith<
          _$KitEtiquetaPreparoUsuarioResponseDTOImpl>
      get copyWith => __$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWithImpl<
          _$KitEtiquetaPreparoUsuarioResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitEtiquetaPreparoUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitEtiquetaPreparoUsuarioResponseDTO
    implements KitEtiquetaPreparoUsuarioResponseDTO {
  factory _KitEtiquetaPreparoUsuarioResponseDTO(
      {required int cod,
      required String nome,
      String? docClasse}) = _$KitEtiquetaPreparoUsuarioResponseDTOImpl;

  factory _KitEtiquetaPreparoUsuarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$KitEtiquetaPreparoUsuarioResponseDTOImpl.fromJson;

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
  _$$KitEtiquetaPreparoUsuarioResponseDTOImplCopyWith<
          _$KitEtiquetaPreparoUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
