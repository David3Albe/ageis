// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_etiqueta_preparo_instituicao_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitEtiquetaPreparoInstituicaoResponseDTO
    _$KitEtiquetaPreparoInstituicaoResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _KitEtiquetaPreparoInstituicaoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitEtiquetaPreparoInstituicaoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitEtiquetaPreparoInstituicaoResponseDTOCopyWith<
          KitEtiquetaPreparoInstituicaoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  factory $KitEtiquetaPreparoInstituicaoResponseDTOCopyWith(
          KitEtiquetaPreparoInstituicaoResponseDTO value,
          $Res Function(KitEtiquetaPreparoInstituicaoResponseDTO) then) =
      _$KitEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
          KitEtiquetaPreparoInstituicaoResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$KitEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
        $Val extends KitEtiquetaPreparoInstituicaoResponseDTO>
    implements $KitEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  _$KitEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<$Res>
    implements $KitEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  factory _$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWith(
          _$KitEtiquetaPreparoInstituicaoResponseDTOImpl value,
          $Res Function(_$KitEtiquetaPreparoInstituicaoResponseDTOImpl) then) =
      __$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<$Res>
    extends _$KitEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
        _$KitEtiquetaPreparoInstituicaoResponseDTOImpl>
    implements _$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<$Res> {
  __$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl(
      _$KitEtiquetaPreparoInstituicaoResponseDTOImpl _value,
      $Res Function(_$KitEtiquetaPreparoInstituicaoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$KitEtiquetaPreparoInstituicaoResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitEtiquetaPreparoInstituicaoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitEtiquetaPreparoInstituicaoResponseDTO {
  _$KitEtiquetaPreparoInstituicaoResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$KitEtiquetaPreparoInstituicaoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitEtiquetaPreparoInstituicaoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitEtiquetaPreparoInstituicaoResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'KitEtiquetaPreparoInstituicaoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<
          _$KitEtiquetaPreparoInstituicaoResponseDTOImpl>
      get copyWith =>
          __$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<
              _$KitEtiquetaPreparoInstituicaoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitEtiquetaPreparoInstituicaoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitEtiquetaPreparoInstituicaoResponseDTO
    implements KitEtiquetaPreparoInstituicaoResponseDTO {
  factory _KitEtiquetaPreparoInstituicaoResponseDTO(
      {required int cod,
      required String nome}) = _$KitEtiquetaPreparoInstituicaoResponseDTOImpl;

  factory _KitEtiquetaPreparoInstituicaoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$KitEtiquetaPreparoInstituicaoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$KitEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<
          _$KitEtiquetaPreparoInstituicaoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
