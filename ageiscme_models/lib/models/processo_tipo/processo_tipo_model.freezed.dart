// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_tipo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoTipoModel _$ProcessoTipoModelFromJson(Map<String, dynamic> json) {
  return _ProcessoTipoModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoTipoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codEtapaProcessoInicial => throw _privateConstructorUsedError;
  set codEtapaProcessoInicial(int? value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  int? get prazoValidade => throw _privateConstructorUsedError;
  set prazoValidade(int? value) => throw _privateConstructorUsedError;
  String get tipoValidade => throw _privateConstructorUsedError;
  set tipoValidade(String value) => throw _privateConstructorUsedError;
  String get nivelPrioridade => throw _privateConstructorUsedError;
  set nivelPrioridade(String value) => throw _privateConstructorUsedError;
  DateTime? get limiteVigencia => throw _privateConstructorUsedError;
  set limiteVigencia(DateTime? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  set ativo(bool? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  ProcessoEtapaModel? get etapaInicial => throw _privateConstructorUsedError;
  set etapaInicial(ProcessoEtapaModel? value) =>
      throw _privateConstructorUsedError;
  List<ProcessoEtapaModel>? get etapas => throw _privateConstructorUsedError;
  set etapas(List<ProcessoEtapaModel>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoTipoModelCopyWith<ProcessoTipoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoTipoModelCopyWith<$Res> {
  factory $ProcessoTipoModelCopyWith(
          ProcessoTipoModel value, $Res Function(ProcessoTipoModel) then) =
      _$ProcessoTipoModelCopyWithImpl<$Res, ProcessoTipoModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcessoInicial,
      String nome,
      String? descricao,
      int? prazoValidade,
      String tipoValidade,
      String nivelPrioridade,
      DateTime? limiteVigencia,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      ProcessoEtapaModel? etapaInicial,
      List<ProcessoEtapaModel>? etapas,
      @JsonKey(name: 'tStamp') String? tstamp});

  $ProcessoEtapaModelCopyWith<$Res>? get etapaInicial;
}

/// @nodoc
class _$ProcessoTipoModelCopyWithImpl<$Res, $Val extends ProcessoTipoModel>
    implements $ProcessoTipoModelCopyWith<$Res> {
  _$ProcessoTipoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcessoInicial = freezed,
    Object? nome = null,
    Object? descricao = freezed,
    Object? prazoValidade = freezed,
    Object? tipoValidade = null,
    Object? nivelPrioridade = null,
    Object? limiteVigencia = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? etapaInicial = freezed,
    Object? etapas = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcessoInicial: freezed == codEtapaProcessoInicial
          ? _value.codEtapaProcessoInicial
          : codEtapaProcessoInicial // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      prazoValidade: freezed == prazoValidade
          ? _value.prazoValidade
          : prazoValidade // ignore: cast_nullable_to_non_nullable
              as int?,
      tipoValidade: null == tipoValidade
          ? _value.tipoValidade
          : tipoValidade // ignore: cast_nullable_to_non_nullable
              as String,
      nivelPrioridade: null == nivelPrioridade
          ? _value.nivelPrioridade
          : nivelPrioridade // ignore: cast_nullable_to_non_nullable
              as String,
      limiteVigencia: freezed == limiteVigencia
          ? _value.limiteVigencia
          : limiteVigencia // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      etapaInicial: freezed == etapaInicial
          ? _value.etapaInicial
          : etapaInicial // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      etapas: freezed == etapas
          ? _value.etapas
          : etapas // ignore: cast_nullable_to_non_nullable
              as List<ProcessoEtapaModel>?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get etapaInicial {
    if (_value.etapaInicial == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.etapaInicial!, (value) {
      return _then(_value.copyWith(etapaInicial: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessoTipoModelImplCopyWith<$Res>
    implements $ProcessoTipoModelCopyWith<$Res> {
  factory _$$ProcessoTipoModelImplCopyWith(_$ProcessoTipoModelImpl value,
          $Res Function(_$ProcessoTipoModelImpl) then) =
      __$$ProcessoTipoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcessoInicial,
      String nome,
      String? descricao,
      int? prazoValidade,
      String tipoValidade,
      String nivelPrioridade,
      DateTime? limiteVigencia,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      ProcessoEtapaModel? etapaInicial,
      List<ProcessoEtapaModel>? etapas,
      @JsonKey(name: 'tStamp') String? tstamp});

  @override
  $ProcessoEtapaModelCopyWith<$Res>? get etapaInicial;
}

/// @nodoc
class __$$ProcessoTipoModelImplCopyWithImpl<$Res>
    extends _$ProcessoTipoModelCopyWithImpl<$Res, _$ProcessoTipoModelImpl>
    implements _$$ProcessoTipoModelImplCopyWith<$Res> {
  __$$ProcessoTipoModelImplCopyWithImpl(_$ProcessoTipoModelImpl _value,
      $Res Function(_$ProcessoTipoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcessoInicial = freezed,
    Object? nome = null,
    Object? descricao = freezed,
    Object? prazoValidade = freezed,
    Object? tipoValidade = null,
    Object? nivelPrioridade = null,
    Object? limiteVigencia = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? etapaInicial = freezed,
    Object? etapas = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$ProcessoTipoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcessoInicial: freezed == codEtapaProcessoInicial
          ? _value.codEtapaProcessoInicial
          : codEtapaProcessoInicial // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      prazoValidade: freezed == prazoValidade
          ? _value.prazoValidade
          : prazoValidade // ignore: cast_nullable_to_non_nullable
              as int?,
      tipoValidade: null == tipoValidade
          ? _value.tipoValidade
          : tipoValidade // ignore: cast_nullable_to_non_nullable
              as String,
      nivelPrioridade: null == nivelPrioridade
          ? _value.nivelPrioridade
          : nivelPrioridade // ignore: cast_nullable_to_non_nullable
              as String,
      limiteVigencia: freezed == limiteVigencia
          ? _value.limiteVigencia
          : limiteVigencia // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      etapaInicial: freezed == etapaInicial
          ? _value.etapaInicial
          : etapaInicial // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      etapas: freezed == etapas
          ? _value.etapas
          : etapas // ignore: cast_nullable_to_non_nullable
              as List<ProcessoEtapaModel>?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoTipoModelImpl extends _ProcessoTipoModel
    with DiagnosticableTreeMixin {
  _$ProcessoTipoModelImpl(
      {required this.cod,
      required this.codEtapaProcessoInicial,
      required this.nome,
      required this.descricao,
      required this.prazoValidade,
      required this.tipoValidade,
      required this.nivelPrioridade,
      required this.limiteVigencia,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      required this.etapaInicial,
      required this.etapas,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$ProcessoTipoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoTipoModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codEtapaProcessoInicial;
  @override
  String nome;
  @override
  String? descricao;
  @override
  int? prazoValidade;
  @override
  String tipoValidade;
  @override
  String nivelPrioridade;
  @override
  DateTime? limiteVigencia;
  @override
  int? codInstituicao;
  @override
  bool? ativo;
  @override
  DateTime? ultimaAlteracao;
  @override
  ProcessoEtapaModel? etapaInicial;
  @override
  List<ProcessoEtapaModel>? etapas;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoTipoModel(cod: $cod, codEtapaProcessoInicial: $codEtapaProcessoInicial, nome: $nome, descricao: $descricao, prazoValidade: $prazoValidade, tipoValidade: $tipoValidade, nivelPrioridade: $nivelPrioridade, limiteVigencia: $limiteVigencia, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, etapaInicial: $etapaInicial, etapas: $etapas, tstamp: $tstamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoTipoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty(
          'codEtapaProcessoInicial', codEtapaProcessoInicial))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('prazoValidade', prazoValidade))
      ..add(DiagnosticsProperty('tipoValidade', tipoValidade))
      ..add(DiagnosticsProperty('nivelPrioridade', nivelPrioridade))
      ..add(DiagnosticsProperty('limiteVigencia', limiteVigencia))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('etapaInicial', etapaInicial))
      ..add(DiagnosticsProperty('etapas', etapas))
      ..add(DiagnosticsProperty('tstamp', tstamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoTipoModelImplCopyWith<_$ProcessoTipoModelImpl> get copyWith =>
      __$$ProcessoTipoModelImplCopyWithImpl<_$ProcessoTipoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoTipoModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoTipoModel extends ProcessoTipoModel {
  factory _ProcessoTipoModel(
          {required int? cod,
          required int? codEtapaProcessoInicial,
          required String nome,
          required String? descricao,
          required int? prazoValidade,
          required String tipoValidade,
          required String nivelPrioridade,
          required DateTime? limiteVigencia,
          required int? codInstituicao,
          required bool? ativo,
          required DateTime? ultimaAlteracao,
          required ProcessoEtapaModel? etapaInicial,
          required List<ProcessoEtapaModel>? etapas,
          @JsonKey(name: 'tStamp') required String? tstamp}) =
      _$ProcessoTipoModelImpl;
  _ProcessoTipoModel._() : super._();

  factory _ProcessoTipoModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoTipoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codEtapaProcessoInicial;
  set codEtapaProcessoInicial(int? value);
  @override
  String get nome;
  set nome(String value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  int? get prazoValidade;
  set prazoValidade(int? value);
  @override
  String get tipoValidade;
  set tipoValidade(String value);
  @override
  String get nivelPrioridade;
  set nivelPrioridade(String value);
  @override
  DateTime? get limiteVigencia;
  set limiteVigencia(DateTime? value);
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
  ProcessoEtapaModel? get etapaInicial;
  set etapaInicial(ProcessoEtapaModel? value);
  @override
  List<ProcessoEtapaModel>? get etapas;
  set etapas(List<ProcessoEtapaModel>? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoTipoModelImplCopyWith<_$ProcessoTipoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
