// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_rotulado_proprietario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemRotuladoProprietarioResponseDTO
    _$ItemRotuladoProprietarioResponseDTOFromJson(Map<String, dynamic> json) {
  return _ItemRotuladoProprietarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemRotuladoProprietarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemRotuladoProprietarioResponseDTOCopyWith<
          ItemRotuladoProprietarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemRotuladoProprietarioResponseDTOCopyWith<$Res> {
  factory $ItemRotuladoProprietarioResponseDTOCopyWith(
          ItemRotuladoProprietarioResponseDTO value,
          $Res Function(ItemRotuladoProprietarioResponseDTO) then) =
      _$ItemRotuladoProprietarioResponseDTOCopyWithImpl<$Res,
          ItemRotuladoProprietarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ItemRotuladoProprietarioResponseDTOCopyWithImpl<$Res,
        $Val extends ItemRotuladoProprietarioResponseDTO>
    implements $ItemRotuladoProprietarioResponseDTOCopyWith<$Res> {
  _$ItemRotuladoProprietarioResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$ItemRotuladoProprietarioResponseDTOImplCopyWith<$Res>
    implements $ItemRotuladoProprietarioResponseDTOCopyWith<$Res> {
  factory _$$ItemRotuladoProprietarioResponseDTOImplCopyWith(
          _$ItemRotuladoProprietarioResponseDTOImpl value,
          $Res Function(_$ItemRotuladoProprietarioResponseDTOImpl) then) =
      __$$ItemRotuladoProprietarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ItemRotuladoProprietarioResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemRotuladoProprietarioResponseDTOCopyWithImpl<$Res,
        _$ItemRotuladoProprietarioResponseDTOImpl>
    implements _$$ItemRotuladoProprietarioResponseDTOImplCopyWith<$Res> {
  __$$ItemRotuladoProprietarioResponseDTOImplCopyWithImpl(
      _$ItemRotuladoProprietarioResponseDTOImpl _value,
      $Res Function(_$ItemRotuladoProprietarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ItemRotuladoProprietarioResponseDTOImpl(
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
class _$ItemRotuladoProprietarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemRotuladoProprietarioResponseDTO {
  _$ItemRotuladoProprietarioResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$ItemRotuladoProprietarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemRotuladoProprietarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemRotuladoProprietarioResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemRotuladoProprietarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRotuladoProprietarioResponseDTOImplCopyWith<
          _$ItemRotuladoProprietarioResponseDTOImpl>
      get copyWith => __$$ItemRotuladoProprietarioResponseDTOImplCopyWithImpl<
          _$ItemRotuladoProprietarioResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemRotuladoProprietarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemRotuladoProprietarioResponseDTO
    implements ItemRotuladoProprietarioResponseDTO {
  factory _ItemRotuladoProprietarioResponseDTO(
      {required int cod,
      required String nome}) = _$ItemRotuladoProprietarioResponseDTOImpl;

  factory _ItemRotuladoProprietarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ItemRotuladoProprietarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemRotuladoProprietarioResponseDTOImplCopyWith<
          _$ItemRotuladoProprietarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
