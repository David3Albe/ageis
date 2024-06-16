// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_turno_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaTurnoSaveDTO _$EscalaTurnoSaveDTOFromJson(Map<String, dynamic> json) {
  return _EscalaTurnoSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaTurnoSaveDTO {
  DateTime get anoMes => throw _privateConstructorUsedError;
  set anoMes(DateTime value) => throw _privateConstructorUsedError;
  int get codTurno => throw _privateConstructorUsedError;
  set codTurno(int value) => throw _privateConstructorUsedError;
  TurnoShortResponseDTO? get turno => throw _privateConstructorUsedError;
  set turno(TurnoShortResponseDTO? value) => throw _privateConstructorUsedError;
  List<EscalaTurnoUsuarioSaveDTO>? get Usuarios =>
      throw _privateConstructorUsedError;
  set Usuarios(List<EscalaTurnoUsuarioSaveDTO>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EscalaTurnoSaveDTOCopyWith<EscalaTurnoSaveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaTurnoSaveDTOCopyWith<$Res> {
  factory $EscalaTurnoSaveDTOCopyWith(
          EscalaTurnoSaveDTO value, $Res Function(EscalaTurnoSaveDTO) then) =
      _$EscalaTurnoSaveDTOCopyWithImpl<$Res, EscalaTurnoSaveDTO>;
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      List<EscalaTurnoUsuarioSaveDTO>? Usuarios});

  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
}

/// @nodoc
class _$EscalaTurnoSaveDTOCopyWithImpl<$Res, $Val extends EscalaTurnoSaveDTO>
    implements $EscalaTurnoSaveDTOCopyWith<$Res> {
  _$EscalaTurnoSaveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? codTurno = null,
    Object? turno = freezed,
    Object? Usuarios = freezed,
  }) {
    return _then(_value.copyWith(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codTurno: null == codTurno
          ? _value.codTurno
          : codTurno // ignore: cast_nullable_to_non_nullable
              as int,
      turno: freezed == turno
          ? _value.turno
          : turno // ignore: cast_nullable_to_non_nullable
              as TurnoShortResponseDTO?,
      Usuarios: freezed == Usuarios
          ? _value.Usuarios
          : Usuarios // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoUsuarioSaveDTO>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnoShortResponseDTOCopyWith<$Res>? get turno {
    if (_value.turno == null) {
      return null;
    }

    return $TurnoShortResponseDTOCopyWith<$Res>(_value.turno!, (value) {
      return _then(_value.copyWith(turno: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EscalaTurnoSaveDTOImplCopyWith<$Res>
    implements $EscalaTurnoSaveDTOCopyWith<$Res> {
  factory _$$EscalaTurnoSaveDTOImplCopyWith(_$EscalaTurnoSaveDTOImpl value,
          $Res Function(_$EscalaTurnoSaveDTOImpl) then) =
      __$$EscalaTurnoSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      List<EscalaTurnoUsuarioSaveDTO>? Usuarios});

  @override
  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
}

/// @nodoc
class __$$EscalaTurnoSaveDTOImplCopyWithImpl<$Res>
    extends _$EscalaTurnoSaveDTOCopyWithImpl<$Res, _$EscalaTurnoSaveDTOImpl>
    implements _$$EscalaTurnoSaveDTOImplCopyWith<$Res> {
  __$$EscalaTurnoSaveDTOImplCopyWithImpl(_$EscalaTurnoSaveDTOImpl _value,
      $Res Function(_$EscalaTurnoSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? codTurno = null,
    Object? turno = freezed,
    Object? Usuarios = freezed,
  }) {
    return _then(_$EscalaTurnoSaveDTOImpl(
      anoMes: null == anoMes
          ? _value.anoMes
          : anoMes // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codTurno: null == codTurno
          ? _value.codTurno
          : codTurno // ignore: cast_nullable_to_non_nullable
              as int,
      turno: freezed == turno
          ? _value.turno
          : turno // ignore: cast_nullable_to_non_nullable
              as TurnoShortResponseDTO?,
      Usuarios: freezed == Usuarios
          ? _value.Usuarios
          : Usuarios // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoUsuarioSaveDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaTurnoSaveDTOImpl implements _EscalaTurnoSaveDTO {
  _$EscalaTurnoSaveDTOImpl(
      {required this.anoMes,
      required this.codTurno,
      this.turno,
      this.Usuarios});

  factory _$EscalaTurnoSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaTurnoSaveDTOImplFromJson(json);

  @override
  DateTime anoMes;
  @override
  int codTurno;
  @override
  TurnoShortResponseDTO? turno;
  @override
  List<EscalaTurnoUsuarioSaveDTO>? Usuarios;

  @override
  String toString() {
    return 'EscalaTurnoSaveDTO(anoMes: $anoMes, codTurno: $codTurno, turno: $turno, Usuarios: $Usuarios)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalaTurnoSaveDTOImplCopyWith<_$EscalaTurnoSaveDTOImpl> get copyWith =>
      __$$EscalaTurnoSaveDTOImplCopyWithImpl<_$EscalaTurnoSaveDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaTurnoSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaTurnoSaveDTO implements EscalaTurnoSaveDTO {
  factory _EscalaTurnoSaveDTO(
      {required DateTime anoMes,
      required int codTurno,
      TurnoShortResponseDTO? turno,
      List<EscalaTurnoUsuarioSaveDTO>? Usuarios}) = _$EscalaTurnoSaveDTOImpl;

  factory _EscalaTurnoSaveDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaTurnoSaveDTOImpl.fromJson;

  @override
  DateTime get anoMes;
  set anoMes(DateTime value);
  @override
  int get codTurno;
  set codTurno(int value);
  @override
  TurnoShortResponseDTO? get turno;
  set turno(TurnoShortResponseDTO? value);
  @override
  List<EscalaTurnoUsuarioSaveDTO>? get Usuarios;
  set Usuarios(List<EscalaTurnoUsuarioSaveDTO>? value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaTurnoSaveDTOImplCopyWith<_$EscalaTurnoSaveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
