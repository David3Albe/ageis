// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perfil_direito_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PerfilDireitoModel _$PerfilDireitoModelFromJson(Map<String, dynamic> json) {
  return _PerfilDireitoModel.fromJson(json);
}

/// @nodoc
mixin _$PerfilDireitoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codDireito => throw _privateConstructorUsedError;
  set codDireito(int? value) => throw _privateConstructorUsedError;
  int? get codPerfil => throw _privateConstructorUsedError;
  set codPerfil(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  String? get tstamp => throw _privateConstructorUsedError;
  set tstamp(String? value) => throw _privateConstructorUsedError;
  PerfilAcessoModel? get perfilAcesso => throw _privateConstructorUsedError;
  set perfilAcesso(PerfilAcessoModel? value) =>
      throw _privateConstructorUsedError;
  UsuarioPerfilModel? get usuarioPerfil => throw _privateConstructorUsedError;
  set usuarioPerfil(UsuarioPerfilModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerfilDireitoModelCopyWith<PerfilDireitoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerfilDireitoModelCopyWith<$Res> {
  factory $PerfilDireitoModelCopyWith(
          PerfilDireitoModel value, $Res Function(PerfilDireitoModel) then) =
      _$PerfilDireitoModelCopyWithImpl<$Res, PerfilDireitoModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codDireito,
      int? codPerfil,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? tstamp,
      PerfilAcessoModel? perfilAcesso,
      UsuarioPerfilModel? usuarioPerfil});

  $PerfilAcessoModelCopyWith<$Res>? get perfilAcesso;
  $UsuarioPerfilModelCopyWith<$Res>? get usuarioPerfil;
}

/// @nodoc
class _$PerfilDireitoModelCopyWithImpl<$Res, $Val extends PerfilDireitoModel>
    implements $PerfilDireitoModelCopyWith<$Res> {
  _$PerfilDireitoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codDireito = freezed,
    Object? codPerfil = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? perfilAcesso = freezed,
    Object? usuarioPerfil = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codDireito: freezed == codDireito
          ? _value.codDireito
          : codDireito // ignore: cast_nullable_to_non_nullable
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
      perfilAcesso: freezed == perfilAcesso
          ? _value.perfilAcesso
          : perfilAcesso // ignore: cast_nullable_to_non_nullable
              as PerfilAcessoModel?,
      usuarioPerfil: freezed == usuarioPerfil
          ? _value.usuarioPerfil
          : usuarioPerfil // ignore: cast_nullable_to_non_nullable
              as UsuarioPerfilModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PerfilAcessoModelCopyWith<$Res>? get perfilAcesso {
    if (_value.perfilAcesso == null) {
      return null;
    }

    return $PerfilAcessoModelCopyWith<$Res>(_value.perfilAcesso!, (value) {
      return _then(_value.copyWith(perfilAcesso: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioPerfilModelCopyWith<$Res>? get usuarioPerfil {
    if (_value.usuarioPerfil == null) {
      return null;
    }

    return $UsuarioPerfilModelCopyWith<$Res>(_value.usuarioPerfil!, (value) {
      return _then(_value.copyWith(usuarioPerfil: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PerfilDireitoModelImplCopyWith<$Res>
    implements $PerfilDireitoModelCopyWith<$Res> {
  factory _$$PerfilDireitoModelImplCopyWith(_$PerfilDireitoModelImpl value,
          $Res Function(_$PerfilDireitoModelImpl) then) =
      __$$PerfilDireitoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codDireito,
      int? codPerfil,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      String? tstamp,
      PerfilAcessoModel? perfilAcesso,
      UsuarioPerfilModel? usuarioPerfil});

  @override
  $PerfilAcessoModelCopyWith<$Res>? get perfilAcesso;
  @override
  $UsuarioPerfilModelCopyWith<$Res>? get usuarioPerfil;
}

/// @nodoc
class __$$PerfilDireitoModelImplCopyWithImpl<$Res>
    extends _$PerfilDireitoModelCopyWithImpl<$Res, _$PerfilDireitoModelImpl>
    implements _$$PerfilDireitoModelImplCopyWith<$Res> {
  __$$PerfilDireitoModelImplCopyWithImpl(_$PerfilDireitoModelImpl _value,
      $Res Function(_$PerfilDireitoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codDireito = freezed,
    Object? codPerfil = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? perfilAcesso = freezed,
    Object? usuarioPerfil = freezed,
  }) {
    return _then(_$PerfilDireitoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codDireito: freezed == codDireito
          ? _value.codDireito
          : codDireito // ignore: cast_nullable_to_non_nullable
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
      perfilAcesso: freezed == perfilAcesso
          ? _value.perfilAcesso
          : perfilAcesso // ignore: cast_nullable_to_non_nullable
              as PerfilAcessoModel?,
      usuarioPerfil: freezed == usuarioPerfil
          ? _value.usuarioPerfil
          : usuarioPerfil // ignore: cast_nullable_to_non_nullable
              as UsuarioPerfilModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerfilDireitoModelImpl
    with DiagnosticableTreeMixin
    implements _PerfilDireitoModel {
  _$PerfilDireitoModelImpl(
      {required this.cod,
      required this.codDireito,
      required this.codPerfil,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      required this.tstamp,
      required this.perfilAcesso,
      required this.usuarioPerfil});

  factory _$PerfilDireitoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerfilDireitoModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codDireito;
  @override
  int? codPerfil;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  String? tstamp;
  @override
  PerfilAcessoModel? perfilAcesso;
  @override
  UsuarioPerfilModel? usuarioPerfil;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PerfilDireitoModel(cod: $cod, codDireito: $codDireito, codPerfil: $codPerfil, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, perfilAcesso: $perfilAcesso, usuarioPerfil: $usuarioPerfil)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PerfilDireitoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codDireito', codDireito))
      ..add(DiagnosticsProperty('codPerfil', codPerfil))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('perfilAcesso', perfilAcesso))
      ..add(DiagnosticsProperty('usuarioPerfil', usuarioPerfil));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerfilDireitoModelImplCopyWith<_$PerfilDireitoModelImpl> get copyWith =>
      __$$PerfilDireitoModelImplCopyWithImpl<_$PerfilDireitoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerfilDireitoModelImplToJson(
      this,
    );
  }
}

abstract class _PerfilDireitoModel implements PerfilDireitoModel {
  factory _PerfilDireitoModel(
      {required int? cod,
      required int? codDireito,
      required int? codPerfil,
      required int? codInstituicao,
      required DateTime? ultimaAlteracao,
      required String? tstamp,
      required PerfilAcessoModel? perfilAcesso,
      required UsuarioPerfilModel? usuarioPerfil}) = _$PerfilDireitoModelImpl;

  factory _PerfilDireitoModel.fromJson(Map<String, dynamic> json) =
      _$PerfilDireitoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codDireito;
  set codDireito(int? value);
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
  String? get tstamp;
  set tstamp(String? value);
  @override
  PerfilAcessoModel? get perfilAcesso;
  set perfilAcesso(PerfilAcessoModel? value);
  @override
  UsuarioPerfilModel? get usuarioPerfil;
  set usuarioPerfil(UsuarioPerfilModel? value);
  @override
  @JsonKey(ignore: true)
  _$$PerfilDireitoModelImplCopyWith<_$PerfilDireitoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
