// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arsenal_estoque_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArsenalEstoqueModel _$ArsenalEstoqueModelFromJson(Map<String, dynamic> json) {
  return _ArsenalEstoqueModel.fromJson(json);
}

/// @nodoc
mixin _$ArsenalEstoqueModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get codBarra => throw _privateConstructorUsedError;
  set codBarra(String? value) => throw _privateConstructorUsedError;
  int? get codLocal => throw _privateConstructorUsedError;
  set codLocal(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  bool? get ativo => throw _privateConstructorUsedError;
  set ativo(bool? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  List<ProcessoEtapaModel>? get processosEtapas =>
      throw _privateConstructorUsedError;
  set processosEtapas(List<ProcessoEtapaModel>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  LocalInstituicaoModel? get local => throw _privateConstructorUsedError;
  set local(LocalInstituicaoModel? value) => throw _privateConstructorUsedError;
  List<LocalizacaoArsenalModel>? get locaisArs =>
      throw _privateConstructorUsedError;
  set locaisArs(List<LocalizacaoArsenalModel>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArsenalEstoqueModelCopyWith<ArsenalEstoqueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArsenalEstoqueModelCopyWith<$Res> {
  factory $ArsenalEstoqueModelCopyWith(
          ArsenalEstoqueModel value, $Res Function(ArsenalEstoqueModel) then) =
      _$ArsenalEstoqueModelCopyWithImpl<$Res, ArsenalEstoqueModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? codBarra,
      int? codLocal,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      List<ProcessoEtapaModel>? processosEtapas,
      @JsonKey(name: 'tStamp') String? tstamp,
      LocalInstituicaoModel? local,
      List<LocalizacaoArsenalModel>? locaisArs});

  $LocalInstituicaoModelCopyWith<$Res>? get local;
}

/// @nodoc
class _$ArsenalEstoqueModelCopyWithImpl<$Res, $Val extends ArsenalEstoqueModel>
    implements $ArsenalEstoqueModelCopyWith<$Res> {
  _$ArsenalEstoqueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? codBarra = freezed,
    Object? codLocal = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? processosEtapas = freezed,
    Object? tstamp = freezed,
    Object? local = freezed,
    Object? locaisArs = freezed,
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
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
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
      processosEtapas: freezed == processosEtapas
          ? _value.processosEtapas
          : processosEtapas // ignore: cast_nullable_to_non_nullable
              as List<ProcessoEtapaModel>?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalInstituicaoModel?,
      locaisArs: freezed == locaisArs
          ? _value.locaisArs
          : locaisArs // ignore: cast_nullable_to_non_nullable
              as List<LocalizacaoArsenalModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalInstituicaoModelCopyWith<$Res>? get local {
    if (_value.local == null) {
      return null;
    }

    return $LocalInstituicaoModelCopyWith<$Res>(_value.local!, (value) {
      return _then(_value.copyWith(local: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArsenalEstoqueModelImplCopyWith<$Res>
    implements $ArsenalEstoqueModelCopyWith<$Res> {
  factory _$$ArsenalEstoqueModelImplCopyWith(_$ArsenalEstoqueModelImpl value,
          $Res Function(_$ArsenalEstoqueModelImpl) then) =
      __$$ArsenalEstoqueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? codBarra,
      int? codLocal,
      int? codInstituicao,
      bool? ativo,
      DateTime? ultimaAlteracao,
      List<ProcessoEtapaModel>? processosEtapas,
      @JsonKey(name: 'tStamp') String? tstamp,
      LocalInstituicaoModel? local,
      List<LocalizacaoArsenalModel>? locaisArs});

  @override
  $LocalInstituicaoModelCopyWith<$Res>? get local;
}

/// @nodoc
class __$$ArsenalEstoqueModelImplCopyWithImpl<$Res>
    extends _$ArsenalEstoqueModelCopyWithImpl<$Res, _$ArsenalEstoqueModelImpl>
    implements _$$ArsenalEstoqueModelImplCopyWith<$Res> {
  __$$ArsenalEstoqueModelImplCopyWithImpl(_$ArsenalEstoqueModelImpl _value,
      $Res Function(_$ArsenalEstoqueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? codBarra = freezed,
    Object? codLocal = freezed,
    Object? codInstituicao = freezed,
    Object? ativo = freezed,
    Object? ultimaAlteracao = freezed,
    Object? processosEtapas = freezed,
    Object? tstamp = freezed,
    Object? local = freezed,
    Object? locaisArs = freezed,
  }) {
    return _then(_$ArsenalEstoqueModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
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
      processosEtapas: freezed == processosEtapas
          ? _value.processosEtapas
          : processosEtapas // ignore: cast_nullable_to_non_nullable
              as List<ProcessoEtapaModel>?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as LocalInstituicaoModel?,
      locaisArs: freezed == locaisArs
          ? _value.locaisArs
          : locaisArs // ignore: cast_nullable_to_non_nullable
              as List<LocalizacaoArsenalModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArsenalEstoqueModelImpl extends _ArsenalEstoqueModel
    with DiagnosticableTreeMixin {
  _$ArsenalEstoqueModelImpl(
      {required this.cod,
      required this.nome,
      required this.codBarra,
      required this.codLocal,
      required this.codInstituicao,
      required this.ativo,
      required this.ultimaAlteracao,
      required this.processosEtapas,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.local,
      required this.locaisArs})
      : super._();

  factory _$ArsenalEstoqueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArsenalEstoqueModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  String? codBarra;
  @override
  int? codLocal;
  @override
  int? codInstituicao;
  @override
  bool? ativo;
  @override
  DateTime? ultimaAlteracao;
  @override
  List<ProcessoEtapaModel>? processosEtapas;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  LocalInstituicaoModel? local;
  @override
  List<LocalizacaoArsenalModel>? locaisArs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArsenalEstoqueModel(cod: $cod, nome: $nome, codBarra: $codBarra, codLocal: $codLocal, codInstituicao: $codInstituicao, ativo: $ativo, ultimaAlteracao: $ultimaAlteracao, processosEtapas: $processosEtapas, tstamp: $tstamp, local: $local, locaisArs: $locaisArs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArsenalEstoqueModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('codLocal', codLocal))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('processosEtapas', processosEtapas))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('local', local))
      ..add(DiagnosticsProperty('locaisArs', locaisArs));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArsenalEstoqueModelImplCopyWith<_$ArsenalEstoqueModelImpl> get copyWith =>
      __$$ArsenalEstoqueModelImplCopyWithImpl<_$ArsenalEstoqueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArsenalEstoqueModelImplToJson(
      this,
    );
  }
}

abstract class _ArsenalEstoqueModel extends ArsenalEstoqueModel {
  factory _ArsenalEstoqueModel(
          {required int? cod,
          required String? nome,
          required String? codBarra,
          required int? codLocal,
          required int? codInstituicao,
          required bool? ativo,
          required DateTime? ultimaAlteracao,
          required List<ProcessoEtapaModel>? processosEtapas,
          @JsonKey(name: 'tStamp') required String? tstamp,
          required LocalInstituicaoModel? local,
          required List<LocalizacaoArsenalModel>? locaisArs}) =
      _$ArsenalEstoqueModelImpl;
  _ArsenalEstoqueModel._() : super._();

  factory _ArsenalEstoqueModel.fromJson(Map<String, dynamic> json) =
      _$ArsenalEstoqueModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get codBarra;
  set codBarra(String? value);
  @override
  int? get codLocal;
  set codLocal(int? value);
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
  List<ProcessoEtapaModel>? get processosEtapas;
  set processosEtapas(List<ProcessoEtapaModel>? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  LocalInstituicaoModel? get local;
  set local(LocalInstituicaoModel? value);
  @override
  List<LocalizacaoArsenalModel>? get locaisArs;
  set locaisArs(List<LocalizacaoArsenalModel>? value);
  @override
  @JsonKey(ignore: true)
  _$$ArsenalEstoqueModelImplCopyWith<_$ArsenalEstoqueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
