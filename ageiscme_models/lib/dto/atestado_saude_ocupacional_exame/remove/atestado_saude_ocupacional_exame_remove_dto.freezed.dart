// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atestado_saude_ocupacional_exame_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AtestadoSaudeOcupacionalExameRemoveDTO
    _$AtestadoSaudeOcupacionalExameRemoveDTOFromJson(
        Map<String, dynamic> json) {
  return _AtestadoSaudeOcupacionalExameRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$AtestadoSaudeOcupacionalExameRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtestadoSaudeOcupacionalExameRemoveDTOCopyWith<
          AtestadoSaudeOcupacionalExameRemoveDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtestadoSaudeOcupacionalExameRemoveDTOCopyWith<$Res> {
  factory $AtestadoSaudeOcupacionalExameRemoveDTOCopyWith(
          AtestadoSaudeOcupacionalExameRemoveDTO value,
          $Res Function(AtestadoSaudeOcupacionalExameRemoveDTO) then) =
      _$AtestadoSaudeOcupacionalExameRemoveDTOCopyWithImpl<$Res,
          AtestadoSaudeOcupacionalExameRemoveDTO>;
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class _$AtestadoSaudeOcupacionalExameRemoveDTOCopyWithImpl<$Res,
        $Val extends AtestadoSaudeOcupacionalExameRemoveDTO>
    implements $AtestadoSaudeOcupacionalExameRemoveDTOCopyWith<$Res> {
  _$AtestadoSaudeOcupacionalExameRemoveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWith<$Res>
    implements $AtestadoSaudeOcupacionalExameRemoveDTOCopyWith<$Res> {
  factory _$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWith(
          _$AtestadoSaudeOcupacionalExameRemoveDTOImpl value,
          $Res Function(_$AtestadoSaudeOcupacionalExameRemoveDTOImpl) then) =
      __$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class __$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWithImpl<$Res>
    extends _$AtestadoSaudeOcupacionalExameRemoveDTOCopyWithImpl<$Res,
        _$AtestadoSaudeOcupacionalExameRemoveDTOImpl>
    implements _$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWith<$Res> {
  __$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWithImpl(
      _$AtestadoSaudeOcupacionalExameRemoveDTOImpl _value,
      $Res Function(_$AtestadoSaudeOcupacionalExameRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_$AtestadoSaudeOcupacionalExameRemoveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtestadoSaudeOcupacionalExameRemoveDTOImpl
    implements _AtestadoSaudeOcupacionalExameRemoveDTO {
  _$AtestadoSaudeOcupacionalExameRemoveDTOImpl(
      {required this.cod, required this.tstamp});

  factory _$AtestadoSaudeOcupacionalExameRemoveDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AtestadoSaudeOcupacionalExameRemoveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;

  @override
  String toString() {
    return 'AtestadoSaudeOcupacionalExameRemoveDTO(cod: $cod, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameRemoveDTOImpl>
      get copyWith =>
          __$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWithImpl<
              _$AtestadoSaudeOcupacionalExameRemoveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtestadoSaudeOcupacionalExameRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _AtestadoSaudeOcupacionalExameRemoveDTO
    implements AtestadoSaudeOcupacionalExameRemoveDTO {
  factory _AtestadoSaudeOcupacionalExameRemoveDTO(
      {required int cod,
      required String tstamp}) = _$AtestadoSaudeOcupacionalExameRemoveDTOImpl;

  factory _AtestadoSaudeOcupacionalExameRemoveDTO.fromJson(
          Map<String, dynamic> json) =
      _$AtestadoSaudeOcupacionalExameRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$AtestadoSaudeOcupacionalExameRemoveDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameRemoveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
