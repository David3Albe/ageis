// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_turno_usuario_sigla_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaTurnoUsuarioSiglaSaveDTO _$EscalaTurnoUsuarioSiglaSaveDTOFromJson(
    Map<String, dynamic> json) {
  return _EscalaTurnoUsuarioSiglaSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaTurnoUsuarioSiglaSaveDTO {
  DateTime get anoMes => throw _privateConstructorUsedError;
  set anoMes(DateTime value) => throw _privateConstructorUsedError;
  int get codTurno => throw _privateConstructorUsedError;
  set codTurno(int value) => throw _privateConstructorUsedError;
  TurnoShortResponseDTO? get turno => throw _privateConstructorUsedError;
  set turno(TurnoShortResponseDTO? value) => throw _privateConstructorUsedError;
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;
  UsuarioDropDownSearchResponseDTO? get usuario =>
      throw _privateConstructorUsedError;
  set usuario(UsuarioDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  DateTime get data => throw _privateConstructorUsedError;
  set data(DateTime value) => throw _privateConstructorUsedError;
  int get codSigla => throw _privateConstructorUsedError;
  set codSigla(int value) => throw _privateConstructorUsedError;
  SiglaShortResponseDTO? get sigla => throw _privateConstructorUsedError;
  set sigla(SiglaShortResponseDTO? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EscalaTurnoUsuarioSiglaSaveDTOCopyWith<EscalaTurnoUsuarioSiglaSaveDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaTurnoUsuarioSiglaSaveDTOCopyWith<$Res> {
  factory $EscalaTurnoUsuarioSiglaSaveDTOCopyWith(
          EscalaTurnoUsuarioSiglaSaveDTO value,
          $Res Function(EscalaTurnoUsuarioSiglaSaveDTO) then) =
      _$EscalaTurnoUsuarioSiglaSaveDTOCopyWithImpl<$Res,
          EscalaTurnoUsuarioSiglaSaveDTO>;
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      int codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario,
      DateTime data,
      int codSigla,
      SiglaShortResponseDTO? sigla});

  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
  $SiglaShortResponseDTOCopyWith<$Res>? get sigla;
}

/// @nodoc
class _$EscalaTurnoUsuarioSiglaSaveDTOCopyWithImpl<$Res,
        $Val extends EscalaTurnoUsuarioSiglaSaveDTO>
    implements $EscalaTurnoUsuarioSiglaSaveDTOCopyWith<$Res> {
  _$EscalaTurnoUsuarioSiglaSaveDTOCopyWithImpl(this._value, this._then);

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
    Object? codUsuario = null,
    Object? usuario = freezed,
    Object? data = null,
    Object? codSigla = null,
    Object? sigla = freezed,
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
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioDropDownSearchResponseDTO?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codSigla: null == codSigla
          ? _value.codSigla
          : codSigla // ignore: cast_nullable_to_non_nullable
              as int,
      sigla: freezed == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as SiglaShortResponseDTO?,
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

  @override
  @pragma('vm:prefer-inline')
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioDropDownSearchResponseDTOCopyWith<$Res>(_value.usuario!,
        (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SiglaShortResponseDTOCopyWith<$Res>? get sigla {
    if (_value.sigla == null) {
      return null;
    }

    return $SiglaShortResponseDTOCopyWith<$Res>(_value.sigla!, (value) {
      return _then(_value.copyWith(sigla: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWith<$Res>
    implements $EscalaTurnoUsuarioSiglaSaveDTOCopyWith<$Res> {
  factory _$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWith(
          _$EscalaTurnoUsuarioSiglaSaveDTOImpl value,
          $Res Function(_$EscalaTurnoUsuarioSiglaSaveDTOImpl) then) =
      __$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      int codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario,
      DateTime data,
      int codSigla,
      SiglaShortResponseDTO? sigla});

  @override
  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
  @override
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
  @override
  $SiglaShortResponseDTOCopyWith<$Res>? get sigla;
}

/// @nodoc
class __$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWithImpl<$Res>
    extends _$EscalaTurnoUsuarioSiglaSaveDTOCopyWithImpl<$Res,
        _$EscalaTurnoUsuarioSiglaSaveDTOImpl>
    implements _$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWith<$Res> {
  __$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWithImpl(
      _$EscalaTurnoUsuarioSiglaSaveDTOImpl _value,
      $Res Function(_$EscalaTurnoUsuarioSiglaSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? codTurno = null,
    Object? turno = freezed,
    Object? codUsuario = null,
    Object? usuario = freezed,
    Object? data = null,
    Object? codSigla = null,
    Object? sigla = freezed,
  }) {
    return _then(_$EscalaTurnoUsuarioSiglaSaveDTOImpl(
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
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioDropDownSearchResponseDTO?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codSigla: null == codSigla
          ? _value.codSigla
          : codSigla // ignore: cast_nullable_to_non_nullable
              as int,
      sigla: freezed == sigla
          ? _value.sigla
          : sigla // ignore: cast_nullable_to_non_nullable
              as SiglaShortResponseDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaTurnoUsuarioSiglaSaveDTOImpl
    implements _EscalaTurnoUsuarioSiglaSaveDTO {
  _$EscalaTurnoUsuarioSiglaSaveDTOImpl(
      {required this.anoMes,
      required this.codTurno,
      this.turno,
      required this.codUsuario,
      this.usuario,
      required this.data,
      required this.codSigla,
      this.sigla});

  factory _$EscalaTurnoUsuarioSiglaSaveDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EscalaTurnoUsuarioSiglaSaveDTOImplFromJson(json);

  @override
  DateTime anoMes;
  @override
  int codTurno;
  @override
  TurnoShortResponseDTO? turno;
  @override
  int codUsuario;
  @override
  UsuarioDropDownSearchResponseDTO? usuario;
  @override
  DateTime data;
  @override
  int codSigla;
  @override
  SiglaShortResponseDTO? sigla;

  @override
  String toString() {
    return 'EscalaTurnoUsuarioSiglaSaveDTO(anoMes: $anoMes, codTurno: $codTurno, turno: $turno, codUsuario: $codUsuario, usuario: $usuario, data: $data, codSigla: $codSigla, sigla: $sigla)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWith<
          _$EscalaTurnoUsuarioSiglaSaveDTOImpl>
      get copyWith => __$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWithImpl<
          _$EscalaTurnoUsuarioSiglaSaveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaTurnoUsuarioSiglaSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaTurnoUsuarioSiglaSaveDTO
    implements EscalaTurnoUsuarioSiglaSaveDTO {
  factory _EscalaTurnoUsuarioSiglaSaveDTO(
      {required DateTime anoMes,
      required int codTurno,
      TurnoShortResponseDTO? turno,
      required int codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario,
      required DateTime data,
      required int codSigla,
      SiglaShortResponseDTO? sigla}) = _$EscalaTurnoUsuarioSiglaSaveDTOImpl;

  factory _EscalaTurnoUsuarioSiglaSaveDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaTurnoUsuarioSiglaSaveDTOImpl.fromJson;

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
  int get codUsuario;
  set codUsuario(int value);
  @override
  UsuarioDropDownSearchResponseDTO? get usuario;
  set usuario(UsuarioDropDownSearchResponseDTO? value);
  @override
  DateTime get data;
  set data(DateTime value);
  @override
  int get codSigla;
  set codSigla(int value);
  @override
  SiglaShortResponseDTO? get sigla;
  set sigla(SiglaShortResponseDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaTurnoUsuarioSiglaSaveDTOImplCopyWith<
          _$EscalaTurnoUsuarioSiglaSaveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
