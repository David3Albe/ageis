// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_preparo_instituicao_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemEtiquetaPreparoInstituicaoResponseDTO
    _$ItemEtiquetaPreparoInstituicaoResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _ItemEtiquetaPreparoInstituicaoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaPreparoInstituicaoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaPreparoInstituicaoResponseDTOCopyWith<
          ItemEtiquetaPreparoInstituicaoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  factory $ItemEtiquetaPreparoInstituicaoResponseDTOCopyWith(
          ItemEtiquetaPreparoInstituicaoResponseDTO value,
          $Res Function(ItemEtiquetaPreparoInstituicaoResponseDTO) then) =
      _$ItemEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
          ItemEtiquetaPreparoInstituicaoResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ItemEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
        $Val extends ItemEtiquetaPreparoInstituicaoResponseDTO>
    implements $ItemEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  _$ItemEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl(
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
abstract class _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<$Res>
    implements $ItemEtiquetaPreparoInstituicaoResponseDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWith(
          _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl value,
          $Res Function(_$ItemEtiquetaPreparoInstituicaoResponseDTOImpl) then) =
      __$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaPreparoInstituicaoResponseDTOCopyWithImpl<$Res,
        _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl>
    implements _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl(
      _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl _value,
      $Res Function(_$ItemEtiquetaPreparoInstituicaoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ItemEtiquetaPreparoInstituicaoResponseDTOImpl(
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
class _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemEtiquetaPreparoInstituicaoResponseDTO {
  _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEtiquetaPreparoInstituicaoResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ItemEtiquetaPreparoInstituicaoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<
          _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl>
      get copyWith =>
          __$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWithImpl<
                  _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaPreparoInstituicaoResponseDTO
    implements ItemEtiquetaPreparoInstituicaoResponseDTO {
  factory _ItemEtiquetaPreparoInstituicaoResponseDTO(
      {required int cod,
      required String nome}) = _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl;

  factory _ItemEtiquetaPreparoInstituicaoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaPreparoInstituicaoResponseDTOImplCopyWith<
          _$ItemEtiquetaPreparoInstituicaoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
