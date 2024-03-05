// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proprietario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProprietarioModel _$ProprietarioModelFromJson(Map<String, dynamic> json) {
  return _ProprietarioModel.fromJson(json);
}

/// @nodoc
mixin _$ProprietarioModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get contato => throw _privateConstructorUsedError;
  set contato(String? value) => throw _privateConstructorUsedError;
  int? get codBarra => throw _privateConstructorUsedError;
  set codBarra(int? value) => throw _privateConstructorUsedError;
  bool? get manutencaoLiberada => throw _privateConstructorUsedError;
  set manutencaoLiberada(bool? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  set ativo(bool? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  List<ProprietarioLocalModel>? get proprietariosLocais =>
      throw _privateConstructorUsedError;
  set proprietariosLocais(List<ProprietarioLocalModel>? value) =>
      throw _privateConstructorUsedError;
  List<ProprietarioArsenalModel>? get proprietariosArsenais =>
      throw _privateConstructorUsedError;
  set proprietariosArsenais(List<ProprietarioArsenalModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProprietarioModelCopyWith<ProprietarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProprietarioModelCopyWith<$Res> {
  factory $ProprietarioModelCopyWith(
          ProprietarioModel value, $Res Function(ProprietarioModel) then) =
      _$ProprietarioModelCopyWithImpl<$Res, ProprietarioModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? contato,
      int? codBarra,
      bool? manutencaoLiberada,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<ProprietarioLocalModel>? proprietariosLocais,
      List<ProprietarioArsenalModel>? proprietariosArsenais});
}

/// @nodoc
class _$ProprietarioModelCopyWithImpl<$Res, $Val extends ProprietarioModel>
    implements $ProprietarioModelCopyWith<$Res> {
  _$ProprietarioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? contato = freezed,
    Object? codBarra = freezed,
    Object? manutencaoLiberada = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? proprietariosLocais = freezed,
    Object? proprietariosArsenais = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      contato: freezed == contato
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as String?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      manutencaoLiberada: freezed == manutencaoLiberada
          ? _value.manutencaoLiberada
          : manutencaoLiberada // ignore: cast_nullable_to_non_nullable
              as bool?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      proprietariosLocais: freezed == proprietariosLocais
          ? _value.proprietariosLocais
          : proprietariosLocais // ignore: cast_nullable_to_non_nullable
              as List<ProprietarioLocalModel>?,
      proprietariosArsenais: freezed == proprietariosArsenais
          ? _value.proprietariosArsenais
          : proprietariosArsenais // ignore: cast_nullable_to_non_nullable
              as List<ProprietarioArsenalModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProprietarioModelImplCopyWith<$Res>
    implements $ProprietarioModelCopyWith<$Res> {
  factory _$$ProprietarioModelImplCopyWith(_$ProprietarioModelImpl value,
          $Res Function(_$ProprietarioModelImpl) then) =
      __$$ProprietarioModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? contato,
      int? codBarra,
      bool? manutencaoLiberada,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<ProprietarioLocalModel>? proprietariosLocais,
      List<ProprietarioArsenalModel>? proprietariosArsenais});
}

/// @nodoc
class __$$ProprietarioModelImplCopyWithImpl<$Res>
    extends _$ProprietarioModelCopyWithImpl<$Res, _$ProprietarioModelImpl>
    implements _$$ProprietarioModelImplCopyWith<$Res> {
  __$$ProprietarioModelImplCopyWithImpl(_$ProprietarioModelImpl _value,
      $Res Function(_$ProprietarioModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? contato = freezed,
    Object? codBarra = freezed,
    Object? manutencaoLiberada = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? proprietariosLocais = freezed,
    Object? proprietariosArsenais = freezed,
  }) {
    return _then(_$ProprietarioModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      contato: freezed == contato
          ? _value.contato
          : contato // ignore: cast_nullable_to_non_nullable
              as String?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      manutencaoLiberada: freezed == manutencaoLiberada
          ? _value.manutencaoLiberada
          : manutencaoLiberada // ignore: cast_nullable_to_non_nullable
              as bool?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: freezed == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      proprietariosLocais: freezed == proprietariosLocais
          ? _value.proprietariosLocais
          : proprietariosLocais // ignore: cast_nullable_to_non_nullable
              as List<ProprietarioLocalModel>?,
      proprietariosArsenais: freezed == proprietariosArsenais
          ? _value.proprietariosArsenais
          : proprietariosArsenais // ignore: cast_nullable_to_non_nullable
              as List<ProprietarioArsenalModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProprietarioModelImpl extends _ProprietarioModel
    with DiagnosticableTreeMixin {
  _$ProprietarioModelImpl(
      {required this.cod,
      required this.nome,
      required this.contato,
      required this.codBarra,
      required this.manutencaoLiberada,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.proprietariosLocais,
      required this.proprietariosArsenais})
      : super._();

  factory _$ProprietarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProprietarioModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  String? contato;
  @override
  int? codBarra;
  @override
  bool? manutencaoLiberada;
  @override
  int? codInstituicao;
  @override
  bool? ativo;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  List<ProprietarioLocalModel>? proprietariosLocais;
  @override
  List<ProprietarioArsenalModel>? proprietariosArsenais;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProprietarioModel(cod: $cod, nome: $nome, contato: $contato, codBarra: $codBarra, manutencaoLiberada: $manutencaoLiberada, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, proprietariosLocais: $proprietariosLocais, proprietariosArsenais: $proprietariosArsenais)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProprietarioModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('contato', contato))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('manutencaoLiberada', manutencaoLiberada))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('proprietariosLocais', proprietariosLocais))
      ..add(
          DiagnosticsProperty('proprietariosArsenais', proprietariosArsenais));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProprietarioModelImplCopyWith<_$ProprietarioModelImpl> get copyWith =>
      __$$ProprietarioModelImplCopyWithImpl<_$ProprietarioModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProprietarioModelImplToJson(
      this,
    );
  }
}

abstract class _ProprietarioModel extends ProprietarioModel {
  factory _ProprietarioModel(
          {required int? cod,
          required String? nome,
          required String? contato,
          required int? codBarra,
          required bool? manutencaoLiberada,
          required int? codInstituicao,
          required bool? ativo,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp,
          required List<ProprietarioLocalModel>? proprietariosLocais,
          required List<ProprietarioArsenalModel>? proprietariosArsenais}) =
      _$ProprietarioModelImpl;
  _ProprietarioModel._() : super._();

  factory _ProprietarioModel.fromJson(Map<String, dynamic> json) =
      _$ProprietarioModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get contato;
  set contato(String? value);
  @override
  int? get codBarra;
  set codBarra(int? value);
  @override
  bool? get manutencaoLiberada;
  set manutencaoLiberada(bool? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  bool? get ativo;
  set ativo(bool? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  List<ProprietarioLocalModel>? get proprietariosLocais;
  set proprietariosLocais(List<ProprietarioLocalModel>? value);
  @override
  List<ProprietarioArsenalModel>? get proprietariosArsenais;
  set proprietariosArsenais(List<ProprietarioArsenalModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$ProprietarioModelImplCopyWith<_$ProprietarioModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
