// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_rotulado_tipos_processo_normal_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemRotuladoTiposProcessoNormalResponseDTO
    _$ItemRotuladoTiposProcessoNormalResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _ItemRotuladoTiposProcessoNormalResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemRotuladoTiposProcessoNormalResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemRotuladoTiposProcessoNormalResponseDTOCopyWith<
          ItemRotuladoTiposProcessoNormalResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemRotuladoTiposProcessoNormalResponseDTOCopyWith<$Res> {
  factory $ItemRotuladoTiposProcessoNormalResponseDTOCopyWith(
          ItemRotuladoTiposProcessoNormalResponseDTO value,
          $Res Function(ItemRotuladoTiposProcessoNormalResponseDTO) then) =
      _$ItemRotuladoTiposProcessoNormalResponseDTOCopyWithImpl<$Res,
          ItemRotuladoTiposProcessoNormalResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ItemRotuladoTiposProcessoNormalResponseDTOCopyWithImpl<$Res,
        $Val extends ItemRotuladoTiposProcessoNormalResponseDTO>
    implements $ItemRotuladoTiposProcessoNormalResponseDTOCopyWith<$Res> {
  _$ItemRotuladoTiposProcessoNormalResponseDTOCopyWithImpl(
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
abstract class _$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWith<$Res>
    implements $ItemRotuladoTiposProcessoNormalResponseDTOCopyWith<$Res> {
  factory _$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWith(
          _$ItemRotuladoTiposProcessoNormalResponseDTOImpl value,
          $Res Function(_$ItemRotuladoTiposProcessoNormalResponseDTOImpl)
              then) =
      __$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemRotuladoTiposProcessoNormalResponseDTOCopyWithImpl<$Res,
        _$ItemRotuladoTiposProcessoNormalResponseDTOImpl>
    implements _$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWith<$Res> {
  __$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWithImpl(
      _$ItemRotuladoTiposProcessoNormalResponseDTOImpl _value,
      $Res Function(_$ItemRotuladoTiposProcessoNormalResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ItemRotuladoTiposProcessoNormalResponseDTOImpl(
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
class _$ItemRotuladoTiposProcessoNormalResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemRotuladoTiposProcessoNormalResponseDTO {
  _$ItemRotuladoTiposProcessoNormalResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$ItemRotuladoTiposProcessoNormalResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemRotuladoTiposProcessoNormalResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemRotuladoTiposProcessoNormalResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ItemRotuladoTiposProcessoNormalResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWith<
          _$ItemRotuladoTiposProcessoNormalResponseDTOImpl>
      get copyWith =>
          __$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWithImpl<
                  _$ItemRotuladoTiposProcessoNormalResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemRotuladoTiposProcessoNormalResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemRotuladoTiposProcessoNormalResponseDTO
    implements ItemRotuladoTiposProcessoNormalResponseDTO {
  factory _ItemRotuladoTiposProcessoNormalResponseDTO(
      {required int cod,
      required String nome}) = _$ItemRotuladoTiposProcessoNormalResponseDTOImpl;

  factory _ItemRotuladoTiposProcessoNormalResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ItemRotuladoTiposProcessoNormalResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemRotuladoTiposProcessoNormalResponseDTOImplCopyWith<
          _$ItemRotuladoTiposProcessoNormalResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
