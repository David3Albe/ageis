// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_tipo_short_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeTipoShortResponseDTO _$AnormalidadeTipoShortResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeTipoShortResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeTipoShortResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeTipoShortResponseDTOCopyWith<AnormalidadeTipoShortResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeTipoShortResponseDTOCopyWith<$Res> {
  factory $AnormalidadeTipoShortResponseDTOCopyWith(
          AnormalidadeTipoShortResponseDTO value,
          $Res Function(AnormalidadeTipoShortResponseDTO) then) =
      _$AnormalidadeTipoShortResponseDTOCopyWithImpl<$Res,
          AnormalidadeTipoShortResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$AnormalidadeTipoShortResponseDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeTipoShortResponseDTO>
    implements $AnormalidadeTipoShortResponseDTOCopyWith<$Res> {
  _$AnormalidadeTipoShortResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeTipoShortResponseDTOImplCopyWith<$Res>
    implements $AnormalidadeTipoShortResponseDTOCopyWith<$Res> {
  factory _$$AnormalidadeTipoShortResponseDTOImplCopyWith(
          _$AnormalidadeTipoShortResponseDTOImpl value,
          $Res Function(_$AnormalidadeTipoShortResponseDTOImpl) then) =
      __$$AnormalidadeTipoShortResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$AnormalidadeTipoShortResponseDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeTipoShortResponseDTOCopyWithImpl<$Res,
        _$AnormalidadeTipoShortResponseDTOImpl>
    implements _$$AnormalidadeTipoShortResponseDTOImplCopyWith<$Res> {
  __$$AnormalidadeTipoShortResponseDTOImplCopyWithImpl(
      _$AnormalidadeTipoShortResponseDTOImpl _value,
      $Res Function(_$AnormalidadeTipoShortResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$AnormalidadeTipoShortResponseDTOImpl(
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
class _$AnormalidadeTipoShortResponseDTOImpl
    extends _AnormalidadeTipoShortResponseDTO {
  _$AnormalidadeTipoShortResponseDTOImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$AnormalidadeTipoShortResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnormalidadeTipoShortResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString() {
    return 'AnormalidadeTipoShortResponseDTO(cod: $cod, nome: $nome)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeTipoShortResponseDTOImplCopyWith<
          _$AnormalidadeTipoShortResponseDTOImpl>
      get copyWith => __$$AnormalidadeTipoShortResponseDTOImplCopyWithImpl<
          _$AnormalidadeTipoShortResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeTipoShortResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeTipoShortResponseDTO
    extends AnormalidadeTipoShortResponseDTO {
  factory _AnormalidadeTipoShortResponseDTO(
      {required int cod,
      required String nome}) = _$AnormalidadeTipoShortResponseDTOImpl;
  _AnormalidadeTipoShortResponseDTO._() : super._();

  factory _AnormalidadeTipoShortResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$AnormalidadeTipoShortResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeTipoShortResponseDTOImplCopyWith<
          _$AnormalidadeTipoShortResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
