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
  DateTime get AnoMes => throw _privateConstructorUsedError;
  set AnoMes(DateTime value) => throw _privateConstructorUsedError;
  String? get Tstamp => throw _privateConstructorUsedError;
  set Tstamp(String? value) => throw _privateConstructorUsedError;
  List<EscalaTurnoSaveDTO>? get Turnos => throw _privateConstructorUsedError;
  set Turnos(List<EscalaTurnoSaveDTO>? value) =>
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
      {DateTime AnoMes, String? Tstamp, List<EscalaTurnoSaveDTO>? Turnos});
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
    Object? AnoMes = null,
    Object? Tstamp = freezed,
    Object? Turnos = freezed,
  }) {
    return _then(_value.copyWith(
      AnoMes: null == AnoMes
          ? _value.AnoMes
          : AnoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      Tstamp: freezed == Tstamp
          ? _value.Tstamp
          : Tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      Turnos: freezed == Turnos
          ? _value.Turnos
          : Turnos // ignore: cast_nullable_to_non_nullable
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
      {DateTime AnoMes, String? Tstamp, List<EscalaTurnoSaveDTO>? Turnos});
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
    Object? AnoMes = null,
    Object? Tstamp = freezed,
    Object? Turnos = freezed,
  }) {
    return _then(_$EscalaSaveDTOImpl(
      AnoMes: null == AnoMes
          ? _value.AnoMes
          : AnoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      Tstamp: freezed == Tstamp
          ? _value.Tstamp
          : Tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      Turnos: freezed == Turnos
          ? _value.Turnos
          : Turnos // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoSaveDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaSaveDTOImpl implements _EscalaSaveDTO {
  _$EscalaSaveDTOImpl({required this.AnoMes, this.Tstamp, this.Turnos});

  factory _$EscalaSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaSaveDTOImplFromJson(json);

  @override
  DateTime AnoMes;
  @override
  String? Tstamp;
  @override
  List<EscalaTurnoSaveDTO>? Turnos;

  @override
  String toString() {
    return 'EscalaSaveDTO(AnoMes: $AnoMes, Tstamp: $Tstamp, Turnos: $Turnos)';
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
      {required DateTime AnoMes,
      String? Tstamp,
      List<EscalaTurnoSaveDTO>? Turnos}) = _$EscalaSaveDTOImpl;

  factory _EscalaSaveDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaSaveDTOImpl.fromJson;

  @override
  DateTime get AnoMes;
  set AnoMes(DateTime value);
  @override
  String? get Tstamp;
  set Tstamp(String? value);
  @override
  List<EscalaTurnoSaveDTO>? get Turnos;
  set Turnos(List<EscalaTurnoSaveDTO>? value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaSaveDTOImplCopyWith<_$EscalaSaveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
