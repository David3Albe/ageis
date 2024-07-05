// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atestado_saude_ocupacional_exame_query_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AtestadoSaudeOcupacionalExameQueryDTO
    _$AtestadoSaudeOcupacionalExameQueryDTOFromJson(Map<String, dynamic> json) {
  return _AtestadoSaudeOcupacionalExameQueryDTO.fromJson(json);
}

/// @nodoc
mixin _$AtestadoSaudeOcupacionalExameQueryDTO {
  int? get codAsoUsuario => throw _privateConstructorUsedError;
  set codAsoUsuario(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtestadoSaudeOcupacionalExameQueryDTOCopyWith<
          AtestadoSaudeOcupacionalExameQueryDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtestadoSaudeOcupacionalExameQueryDTOCopyWith<$Res> {
  factory $AtestadoSaudeOcupacionalExameQueryDTOCopyWith(
          AtestadoSaudeOcupacionalExameQueryDTO value,
          $Res Function(AtestadoSaudeOcupacionalExameQueryDTO) then) =
      _$AtestadoSaudeOcupacionalExameQueryDTOCopyWithImpl<$Res,
          AtestadoSaudeOcupacionalExameQueryDTO>;
  @useResult
  $Res call({int? codAsoUsuario});
}

/// @nodoc
class _$AtestadoSaudeOcupacionalExameQueryDTOCopyWithImpl<$Res,
        $Val extends AtestadoSaudeOcupacionalExameQueryDTO>
    implements $AtestadoSaudeOcupacionalExameQueryDTOCopyWith<$Res> {
  _$AtestadoSaudeOcupacionalExameQueryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codAsoUsuario = freezed,
  }) {
    return _then(_value.copyWith(
      codAsoUsuario: freezed == codAsoUsuario
          ? _value.codAsoUsuario
          : codAsoUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWith<$Res>
    implements $AtestadoSaudeOcupacionalExameQueryDTOCopyWith<$Res> {
  factory _$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWith(
          _$AtestadoSaudeOcupacionalExameQueryDTOImpl value,
          $Res Function(_$AtestadoSaudeOcupacionalExameQueryDTOImpl) then) =
      __$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codAsoUsuario});
}

/// @nodoc
class __$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWithImpl<$Res>
    extends _$AtestadoSaudeOcupacionalExameQueryDTOCopyWithImpl<$Res,
        _$AtestadoSaudeOcupacionalExameQueryDTOImpl>
    implements _$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWith<$Res> {
  __$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWithImpl(
      _$AtestadoSaudeOcupacionalExameQueryDTOImpl _value,
      $Res Function(_$AtestadoSaudeOcupacionalExameQueryDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codAsoUsuario = freezed,
  }) {
    return _then(_$AtestadoSaudeOcupacionalExameQueryDTOImpl(
      codAsoUsuario: freezed == codAsoUsuario
          ? _value.codAsoUsuario
          : codAsoUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtestadoSaudeOcupacionalExameQueryDTOImpl
    implements _AtestadoSaudeOcupacionalExameQueryDTO {
  _$AtestadoSaudeOcupacionalExameQueryDTOImpl({this.codAsoUsuario});

  factory _$AtestadoSaudeOcupacionalExameQueryDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AtestadoSaudeOcupacionalExameQueryDTOImplFromJson(json);

  @override
  int? codAsoUsuario;

  @override
  String toString() {
    return 'AtestadoSaudeOcupacionalExameQueryDTO(codAsoUsuario: $codAsoUsuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameQueryDTOImpl>
      get copyWith => __$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWithImpl<
          _$AtestadoSaudeOcupacionalExameQueryDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtestadoSaudeOcupacionalExameQueryDTOImplToJson(
      this,
    );
  }
}

abstract class _AtestadoSaudeOcupacionalExameQueryDTO
    implements AtestadoSaudeOcupacionalExameQueryDTO {
  factory _AtestadoSaudeOcupacionalExameQueryDTO({int? codAsoUsuario}) =
      _$AtestadoSaudeOcupacionalExameQueryDTOImpl;

  factory _AtestadoSaudeOcupacionalExameQueryDTO.fromJson(
          Map<String, dynamic> json) =
      _$AtestadoSaudeOcupacionalExameQueryDTOImpl.fromJson;

  @override
  int? get codAsoUsuario;
  set codAsoUsuario(int? value);
  @override
  @JsonKey(ignore: true)
  _$$AtestadoSaudeOcupacionalExameQueryDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameQueryDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
