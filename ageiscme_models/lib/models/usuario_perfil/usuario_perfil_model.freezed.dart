// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_perfil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsuarioPerfilModel _$UsuarioPerfilModelFromJson(Map<String, dynamic> json) {
  return _UsuarioPerfilModel.fromJson(json);
}

/// @nodoc
mixin _$UsuarioPerfilModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  int? get codPerfil => throw _privateConstructorUsedError;
  set codPerfil(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  List<PerfilDireitoModel>? get direitos => throw _privateConstructorUsedError;
  set direitos(List<PerfilDireitoModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioPerfilModelCopyWith<UsuarioPerfilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioPerfilModelCopyWith<$Res> {
  factory $UsuarioPerfilModelCopyWith(
          UsuarioPerfilModel value, $Res Function(UsuarioPerfilModel) then) =
      _$UsuarioPerfilModelCopyWithImpl<$Res, UsuarioPerfilModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codUsuario,
      int? codPerfil,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      UsuarioModel? usuario,
      List<PerfilDireitoModel>? direitos});

  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class _$UsuarioPerfilModelCopyWithImpl<$Res, $Val extends UsuarioPerfilModel>
    implements $UsuarioPerfilModelCopyWith<$Res> {
  _$UsuarioPerfilModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codUsuario = freezed,
    Object? codPerfil = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuario = freezed,
    Object? direitos = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codPerfil: freezed == codPerfil
          ? _value.codPerfil
          : codPerfil // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      direitos: freezed == direitos
          ? _value.direitos
          : direitos // ignore: cast_nullable_to_non_nullable
              as List<PerfilDireitoModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioModelCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.usuario!, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UsuarioPerfilModelImplCopyWith<$Res>
    implements $UsuarioPerfilModelCopyWith<$Res> {
  factory _$$UsuarioPerfilModelImplCopyWith(_$UsuarioPerfilModelImpl value,
          $Res Function(_$UsuarioPerfilModelImpl) then) =
      __$$UsuarioPerfilModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codUsuario,
      int? codPerfil,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      UsuarioModel? usuario,
      List<PerfilDireitoModel>? direitos});

  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
}

/// @nodoc
class __$$UsuarioPerfilModelImplCopyWithImpl<$Res>
    extends _$UsuarioPerfilModelCopyWithImpl<$Res, _$UsuarioPerfilModelImpl>
    implements _$$UsuarioPerfilModelImplCopyWith<$Res> {
  __$$UsuarioPerfilModelImplCopyWithImpl(_$UsuarioPerfilModelImpl _value,
      $Res Function(_$UsuarioPerfilModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codUsuario = freezed,
    Object? codPerfil = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuario = freezed,
    Object? direitos = freezed,
  }) {
    return _then(_$UsuarioPerfilModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codPerfil: freezed == codPerfil
          ? _value.codPerfil
          : codPerfil // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      direitos: freezed == direitos
          ? _value.direitos
          : direitos // ignore: cast_nullable_to_non_nullable
              as List<PerfilDireitoModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioPerfilModelImpl
    with DiagnosticableTreeMixin
    implements _UsuarioPerfilModel {
  _$UsuarioPerfilModelImpl(
      {required this.cod,
      required this.codUsuario,
      required this.codPerfil,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.usuario,
      required this.direitos});

  factory _$UsuarioPerfilModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioPerfilModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codUsuario;
  @override
  int? codPerfil;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  UsuarioModel? usuario;
  @override
  List<PerfilDireitoModel>? direitos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsuarioPerfilModel(cod: $cod, codUsuario: $codUsuario, codPerfil: $codPerfil, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, usuario: $usuario, direitos: $direitos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsuarioPerfilModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('codPerfil', codPerfil))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('usuario', usuario))
      ..add(DiagnosticsProperty('direitos', direitos));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioPerfilModelImplCopyWith<_$UsuarioPerfilModelImpl> get copyWith =>
      __$$UsuarioPerfilModelImplCopyWithImpl<_$UsuarioPerfilModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioPerfilModelImplToJson(
      this,
    );
  }
}

abstract class _UsuarioPerfilModel implements UsuarioPerfilModel {
  factory _UsuarioPerfilModel(
      {required int? cod,
      required int? codUsuario,
      required int? codPerfil,
      required int? codInstituicao,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      required UsuarioModel? usuario,
      required List<PerfilDireitoModel>? direitos}) = _$UsuarioPerfilModelImpl;

  factory _UsuarioPerfilModel.fromJson(Map<String, dynamic> json) =
      _$UsuarioPerfilModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  int? get codPerfil;
  set codPerfil(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  List<PerfilDireitoModel>? get direitos;
  set direitos(List<PerfilDireitoModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioPerfilModelImplCopyWith<_$UsuarioPerfilModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
