// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return _UsuarioModel.fromJson(json);
}

/// @nodoc
mixin _$UsuarioModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get login => throw _privateConstructorUsedError;
  set login(String? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  int? get rg => throw _privateConstructorUsedError;
  set rg(int? value) => throw _privateConstructorUsedError;
  String? get docClasse => throw _privateConstructorUsedError;
  set docClasse(String? value) => throw _privateConstructorUsedError;
  int? get codBarra => throw _privateConstructorUsedError;
  set codBarra(int? value) => throw _privateConstructorUsedError;
  int? get codBarraTemporario => throw _privateConstructorUsedError;
  set codBarraTemporario(int? value) => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;
  set senha(String? value) => throw _privateConstructorUsedError;
  bool? get colaborador => throw _privateConstructorUsedError;
  set colaborador(bool? value) => throw _privateConstructorUsedError;
  String? get nomeEmpresa => throw _privateConstructorUsedError;
  set nomeEmpresa(String? value) => throw _privateConstructorUsedError;
  bool? get controleGestao => throw _privateConstructorUsedError;
  set controleGestao(bool? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  set ativo(bool? value) => throw _privateConstructorUsedError;
  String? get foto => throw _privateConstructorUsedError;
  set foto(String? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  List<UsuarioPerfilModel>? get usuariosPerfis =>
      throw _privateConstructorUsedError;
  set usuariosPerfis(List<UsuarioPerfilModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioModelCopyWith<UsuarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioModelCopyWith<$Res> {
  factory $UsuarioModelCopyWith(
          UsuarioModel value, $Res Function(UsuarioModel) then) =
      _$UsuarioModelCopyWithImpl<$Res, UsuarioModel>;
  @useResult
  $Res call(
      {int? cod,
      String? login,
      String? nome,
      int? rg,
      String? docClasse,
      int? codBarra,
      int? codBarraTemporario,
      String? senha,
      bool? colaborador,
      String? nomeEmpresa,
      bool? controleGestao,
      int? codInstituicao,
      bool? ativo,
      String? foto,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<UsuarioPerfilModel>? usuariosPerfis});
}

/// @nodoc
class _$UsuarioModelCopyWithImpl<$Res, $Val extends UsuarioModel>
    implements $UsuarioModelCopyWith<$Res> {
  _$UsuarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? login = freezed,
    Object? nome = freezed,
    Object? rg = freezed,
    Object? docClasse = freezed,
    Object? codBarra = freezed,
    Object? codBarraTemporario = freezed,
    Object? senha = freezed,
    Object? colaborador = freezed,
    Object? nomeEmpresa = freezed,
    Object? controleGestao = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? foto = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuariosPerfis = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      rg: freezed == rg
          ? _value.rg
          : rg // ignore: cast_nullable_to_non_nullable
              as int?,
      docClasse: freezed == docClasse
          ? _value.docClasse
          : docClasse // ignore: cast_nullable_to_non_nullable
              as String?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraTemporario: freezed == codBarraTemporario
          ? _value.codBarraTemporario
          : codBarraTemporario // ignore: cast_nullable_to_non_nullable
              as int?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      colaborador: freezed == colaborador
          ? _value.colaborador
          : colaborador // ignore: cast_nullable_to_non_nullable
              as bool?,
      nomeEmpresa: freezed == nomeEmpresa
          ? _value.nomeEmpresa
          : nomeEmpresa // ignore: cast_nullable_to_non_nullable
              as String?,
      controleGestao: freezed == controleGestao
          ? _value.controleGestao
          : controleGestao // ignore: cast_nullable_to_non_nullable
              as bool?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuariosPerfis: freezed == usuariosPerfis
          ? _value.usuariosPerfis
          : usuariosPerfis // ignore: cast_nullable_to_non_nullable
              as List<UsuarioPerfilModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioModelImplCopyWith<$Res>
    implements $UsuarioModelCopyWith<$Res> {
  factory _$$UsuarioModelImplCopyWith(
          _$UsuarioModelImpl value, $Res Function(_$UsuarioModelImpl) then) =
      __$$UsuarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? login,
      String? nome,
      int? rg,
      String? docClasse,
      int? codBarra,
      int? codBarraTemporario,
      String? senha,
      bool? colaborador,
      String? nomeEmpresa,
      bool? controleGestao,
      int? codInstituicao,
      bool? ativo,
      String? foto,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<UsuarioPerfilModel>? usuariosPerfis});
}

/// @nodoc
class __$$UsuarioModelImplCopyWithImpl<$Res>
    extends _$UsuarioModelCopyWithImpl<$Res, _$UsuarioModelImpl>
    implements _$$UsuarioModelImplCopyWith<$Res> {
  __$$UsuarioModelImplCopyWithImpl(
      _$UsuarioModelImpl _value, $Res Function(_$UsuarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? login = freezed,
    Object? nome = freezed,
    Object? rg = freezed,
    Object? docClasse = freezed,
    Object? codBarra = freezed,
    Object? codBarraTemporario = freezed,
    Object? senha = freezed,
    Object? colaborador = freezed,
    Object? nomeEmpresa = freezed,
    Object? controleGestao = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? foto = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? usuariosPerfis = freezed,
  }) {
    return _then(_$UsuarioModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      rg: freezed == rg
          ? _value.rg
          : rg // ignore: cast_nullable_to_non_nullable
              as int?,
      docClasse: freezed == docClasse
          ? _value.docClasse
          : docClasse // ignore: cast_nullable_to_non_nullable
              as String?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraTemporario: freezed == codBarraTemporario
          ? _value.codBarraTemporario
          : codBarraTemporario // ignore: cast_nullable_to_non_nullable
              as int?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      colaborador: freezed == colaborador
          ? _value.colaborador
          : colaborador // ignore: cast_nullable_to_non_nullable
              as bool?,
      nomeEmpresa: freezed == nomeEmpresa
          ? _value.nomeEmpresa
          : nomeEmpresa // ignore: cast_nullable_to_non_nullable
              as String?,
      controleGestao: freezed == controleGestao
          ? _value.controleGestao
          : controleGestao // ignore: cast_nullable_to_non_nullable
              as bool?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usuariosPerfis: freezed == usuariosPerfis
          ? _value.usuariosPerfis
          : usuariosPerfis // ignore: cast_nullable_to_non_nullable
              as List<UsuarioPerfilModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioModelImpl extends _UsuarioModel with DiagnosticableTreeMixin {
  _$UsuarioModelImpl(
      {required this.cod,
      required this.login,
      required this.nome,
      required this.rg,
      required this.docClasse,
      required this.codBarra,
      required this.codBarraTemporario,
      required this.senha,
      required this.colaborador,
      required this.nomeEmpresa,
      required this.controleGestao,
      required this.codInstituicao,
      required this.ativo,
      required this.foto,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.usuariosPerfis})
      : super._();

  factory _$UsuarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? login;
  @override
  String? nome;
  @override
  int? rg;
  @override
  String? docClasse;
  @override
  int? codBarra;
  @override
  int? codBarraTemporario;
  @override
  String? senha;
  @override
  bool? colaborador;
  @override
  String? nomeEmpresa;
  @override
  bool? controleGestao;
  @override
  int? codInstituicao;
  @override
  bool? ativo;
  @override
  String? foto;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  List<UsuarioPerfilModel>? usuariosPerfis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsuarioModel(cod: $cod, login: $login, nome: $nome, rg: $rg, docClasse: $docClasse, codBarra: $codBarra, codBarraTemporario: $codBarraTemporario, senha: $senha, colaborador: $colaborador, nomeEmpresa: $nomeEmpresa, controleGestao: $controleGestao, codInstituicao: $codInstituicao, ativo: $ativo, foto: $foto, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, usuariosPerfis: $usuariosPerfis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsuarioModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('login', login))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('rg', rg))
      ..add(DiagnosticsProperty('docClasse', docClasse))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('codBarraTemporario', codBarraTemporario))
      ..add(DiagnosticsProperty('senha', senha))
      ..add(DiagnosticsProperty('colaborador', colaborador))
      ..add(DiagnosticsProperty('nomeEmpresa', nomeEmpresa))
      ..add(DiagnosticsProperty('controleGestao', controleGestao))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('foto', foto))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('usuariosPerfis', usuariosPerfis));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioModelImplCopyWith<_$UsuarioModelImpl> get copyWith =>
      __$$UsuarioModelImplCopyWithImpl<_$UsuarioModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioModelImplToJson(
      this,
    );
  }
}

abstract class _UsuarioModel extends UsuarioModel {
  factory _UsuarioModel(
      {required int? cod,
      required String? login,
      required String? nome,
      required int? rg,
      required String? docClasse,
      required int? codBarra,
      required int? codBarraTemporario,
      required String? senha,
      required bool? colaborador,
      required String? nomeEmpresa,
      required bool? controleGestao,
      required int? codInstituicao,
      required bool? ativo,
      required String? foto,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      required List<UsuarioPerfilModel>? usuariosPerfis}) = _$UsuarioModelImpl;
  _UsuarioModel._() : super._();

  factory _UsuarioModel.fromJson(Map<String, dynamic> json) =
      _$UsuarioModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get login;
  set login(String? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  int? get rg;
  set rg(int? value);
  @override
  String? get docClasse;
  set docClasse(String? value);
  @override
  int? get codBarra;
  set codBarra(int? value);
  @override
  int? get codBarraTemporario;
  set codBarraTemporario(int? value);
  @override
  String? get senha;
  set senha(String? value);
  @override
  bool? get colaborador;
  set colaborador(bool? value);
  @override
  String? get nomeEmpresa;
  set nomeEmpresa(String? value);
  @override
  bool? get controleGestao;
  set controleGestao(bool? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  bool? get ativo;
  set ativo(bool? value);
  @override
  String? get foto;
  set foto(String? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  List<UsuarioPerfilModel>? get usuariosPerfis;
  set usuariosPerfis(List<UsuarioPerfilModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$UsuarioModelImplCopyWith<_$UsuarioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
