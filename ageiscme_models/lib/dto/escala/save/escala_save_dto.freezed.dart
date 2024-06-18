// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaSaveDTO _$EscalaSaveDTOFromJson(Map<String, dynamic> json) {
  return _EscalaSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaSaveDTO {
  DateTime get anoMes => throw _privateConstructorUsedError;
  set anoMes(DateTime value) => throw _privateConstructorUsedError;
  String? get tstamp => throw _privateConstructorUsedError;
  set tstamp(String? value) => throw _privateConstructorUsedError;
  List<EscalaTurnoSaveDTO>? get turnos => throw _privateConstructorUsedError;
  set turnos(List<EscalaTurnoSaveDTO>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EscalaSaveDTOCopyWith<EscalaSaveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaSaveDTOCopyWith<$Res> {
  factory $EscalaSaveDTOCopyWith(
          EscalaSaveDTO value, $Res Function(EscalaSaveDTO) then) =
      _$EscalaSaveDTOCopyWithImpl<$Res, EscalaSaveDTO>;
  @useResult
  $Res call(
      {DateTime anoMes, String? tstamp, List<EscalaTurnoSaveDTO>? turnos});
}

/// @nodoc
class _$EscalaSaveDTOCopyWithImpl<$Res, $Val extends EscalaSaveDTO>
    implements $EscalaSaveDTOCopyWith<$Res> {
  _$EscalaSaveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? tstamp = freezed,
    Object? turnos = freezed,
  }) {
    return _then(_value.copyWith(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      turnos: freezed == turnos
          ? _value.turnos
          : turnos // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoSaveDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EscalaSaveDTOImplCopyWith<$Res>
    implements $EscalaSaveDTOCopyWith<$Res> {
  factory _$$EscalaSaveDTOImplCopyWith(
          _$EscalaSaveDTOImpl value, $Res Function(_$EscalaSaveDTOImpl) then) =
      __$$EscalaSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime anoMes, String? tstamp, List<EscalaTurnoSaveDTO>? turnos});
}

/// @nodoc
class __$$EscalaSaveDTOImplCopyWithImpl<$Res>
    extends _$EscalaSaveDTOCopyWithImpl<$Res, _$EscalaSaveDTOImpl>
    implements _$$EscalaSaveDTOImplCopyWith<$Res> {
  __$$EscalaSaveDTOImplCopyWithImpl(
      _$EscalaSaveDTOImpl _value, $Res Function(_$EscalaSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? tstamp = freezed,
    Object? turnos = freezed,
  }) {
    return _then(_$EscalaSaveDTOImpl(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      turnos: freezed == turnos
          ? _value.turnos
          : turnos // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoSaveDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaSaveDTOImpl implements _EscalaSaveDTO {
  _$EscalaSaveDTOImpl({required this.anoMes, this.tstamp, this.turnos});

  factory _$EscalaSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaSaveDTOImplFromJson(json);

  @override
  DateTime anoMes;
  @override
  String? tstamp;
  @override
  List<EscalaTurnoSaveDTO>? turnos;

  @override
  String toString() {
    return 'EscalaSaveDTO(anoMes: $anoMes, tstamp: $tstamp, turnos: $turnos)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalaSaveDTOImplCopyWith<_$EscalaSaveDTOImpl> get copyWith =>
      __$$EscalaSaveDTOImplCopyWithImpl<_$EscalaSaveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaSaveDTO implements EscalaSaveDTO {
  factory _EscalaSaveDTO(
      {required DateTime anoMes,
      String? tstamp,
      List<EscalaTurnoSaveDTO>? turnos}) = _$EscalaSaveDTOImpl;

  factory _EscalaSaveDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaSaveDTOImpl.fromJson;

  @override
  DateTime get anoMes;
  set anoMes(DateTime value);
  @override
  String? get tstamp;
  set tstamp(String? value);
  @override
  List<EscalaTurnoSaveDTO>? get turnos;
  set turnos(List<EscalaTurnoSaveDTO>? value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaSaveDTOImplCopyWith<_$EscalaSaveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
