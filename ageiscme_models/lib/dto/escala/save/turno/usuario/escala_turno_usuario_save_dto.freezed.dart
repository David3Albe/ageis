// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escala_turno_usuario_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EscalaTurnoUsuarioSaveDTO _$EscalaTurnoUsuarioSaveDTOFromJson(
    Map<String, dynamic> json) {
  return _EscalaTurnoUsuarioSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$EscalaTurnoUsuarioSaveDTO {
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
  List<EscalaTurnoUsuarioSiglaSaveDTO>? get siglas =>
      throw _privateConstructorUsedError;
  set siglas(List<EscalaTurnoUsuarioSiglaSaveDTO>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EscalaTurnoUsuarioSaveDTOCopyWith<EscalaTurnoUsuarioSaveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalaTurnoUsuarioSaveDTOCopyWith<$Res> {
  factory $EscalaTurnoUsuarioSaveDTOCopyWith(EscalaTurnoUsuarioSaveDTO value,
          $Res Function(EscalaTurnoUsuarioSaveDTO) then) =
      _$EscalaTurnoUsuarioSaveDTOCopyWithImpl<$Res, EscalaTurnoUsuarioSaveDTO>;
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      int codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario,
      List<EscalaTurnoUsuarioSiglaSaveDTO>? siglas});

  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$EscalaTurnoUsuarioSaveDTOCopyWithImpl<$Res,
        $Val extends EscalaTurnoUsuarioSaveDTO>
    implements $EscalaTurnoUsuarioSaveDTOCopyWith<$Res> {
  _$EscalaTurnoUsuarioSaveDTOCopyWithImpl(this._value, this._then);

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
    Object? siglas = freezed,
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
      siglas: freezed == siglas
          ? _value.siglas
          : siglas // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoUsuarioSiglaSaveDTO>?,
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
}

/// @nodoc
abstract class _$$EscalaTurnoUsuarioSaveDTOImplCopyWith<$Res>
    implements $EscalaTurnoUsuarioSaveDTOCopyWith<$Res> {
  factory _$$EscalaTurnoUsuarioSaveDTOImplCopyWith(
          _$EscalaTurnoUsuarioSaveDTOImpl value,
          $Res Function(_$EscalaTurnoUsuarioSaveDTOImpl) then) =
      __$$EscalaTurnoUsuarioSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime anoMes,
      int codTurno,
      TurnoShortResponseDTO? turno,
      int codUsuario,
      UsuarioDropDownSearchResponseDTO? usuario,
      List<EscalaTurnoUsuarioSiglaSaveDTO>? siglas});

  @override
  $TurnoShortResponseDTOCopyWith<$Res>? get turno;
  @override
  $UsuarioDropDownSearchResponseDTOCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$EscalaTurnoUsuarioSaveDTOImplCopyWithImpl<$Res>
    extends _$EscalaTurnoUsuarioSaveDTOCopyWithImpl<$Res,
        _$EscalaTurnoUsuarioSaveDTOImpl>
    implements _$$EscalaTurnoUsuarioSaveDTOImplCopyWith<$Res> {
  __$$EscalaTurnoUsuarioSaveDTOImplCopyWithImpl(
      _$EscalaTurnoUsuarioSaveDTOImpl _value,
      $Res Function(_$EscalaTurnoUsuarioSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anoMes = null,
    Object? codTurno = null,
    Object? turno = freezed,
    Object? codUsuario = null,
    Object? usuario = freezed,
    Object? siglas = freezed,
  }) {
    return _then(_$EscalaTurnoUsuarioSaveDTOImpl(
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
      siglas: freezed == siglas
          ? _value.siglas
          : siglas // ignore: cast_nullable_to_non_nullable
              as List<EscalaTurnoUsuarioSiglaSaveDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalaTurnoUsuarioSaveDTOImpl implements _EscalaTurnoUsuarioSaveDTO {
  _$EscalaTurnoUsuarioSaveDTOImpl(
      {required this.anoMes,
      required this.codTurno,
      this.turno,
      required this.codUsuario,
      this.usuario,
      this.siglas});

  factory _$EscalaTurnoUsuarioSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalaTurnoUsuarioSaveDTOImplFromJson(json);

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
  List<EscalaTurnoUsuarioSiglaSaveDTO>? siglas;

  @override
  String toString() {
    return 'EscalaTurnoUsuarioSaveDTO(anoMes: $anoMes, codTurno: $codTurno, turno: $turno, codUsuario: $codUsuario, usuario: $usuario, siglas: $siglas)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalaTurnoUsuarioSaveDTOImplCopyWith<_$EscalaTurnoUsuarioSaveDTOImpl>
      get copyWith => __$$EscalaTurnoUsuarioSaveDTOImplCopyWithImpl<
          _$EscalaTurnoUsuarioSaveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalaTurnoUsuarioSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _EscalaTurnoUsuarioSaveDTO implements EscalaTurnoUsuarioSaveDTO {
  factory _EscalaTurnoUsuarioSaveDTO(
          {required DateTime anoMes,
          required int codTurno,
          TurnoShortResponseDTO? turno,
          required int codUsuario,
          UsuarioDropDownSearchResponseDTO? usuario,
          List<EscalaTurnoUsuarioSiglaSaveDTO>? siglas}) =
      _$EscalaTurnoUsuarioSaveDTOImpl;

  factory _EscalaTurnoUsuarioSaveDTO.fromJson(Map<String, dynamic> json) =
      _$EscalaTurnoUsuarioSaveDTOImpl.fromJson;

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
  List<EscalaTurnoUsuarioSiglaSaveDTO>? get siglas;
  set siglas(List<EscalaTurnoUsuarioSiglaSaveDTO>? value);
  @override
  @JsonKey(ignore: true)
  _$$EscalaTurnoUsuarioSaveDTOImplCopyWith<_$EscalaTurnoUsuarioSaveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
