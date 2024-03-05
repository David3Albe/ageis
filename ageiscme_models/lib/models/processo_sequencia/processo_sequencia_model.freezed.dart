// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_sequencia_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoSequenciaModel _$ProcessoSequenciaModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoSequenciaModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoSequenciaModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codEtapaProcesso => throw _privateConstructorUsedError;
  set codEtapaProcesso(int? value) => throw _privateConstructorUsedError;
  ProcessoEtapaModel? get etapa => throw _privateConstructorUsedError;
  set etapa(ProcessoEtapaModel? value) => throw _privateConstructorUsedError;
  int? get codEtapaSeguinte => throw _privateConstructorUsedError;
  set codEtapaSeguinte(int? value) => throw _privateConstructorUsedError;
  ProcessoEtapaModel? get etapaSequinte => throw _privateConstructorUsedError;
  set etapaSequinte(ProcessoEtapaModel? value) =>
      throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  InstituicaoModel? get instituicao => throw _privateConstructorUsedError;
  set instituicao(InstituicaoModel? value) =>
      throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoSequenciaModelCopyWith<ProcessoSequenciaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoSequenciaModelCopyWith<$Res> {
  factory $ProcessoSequenciaModelCopyWith(ProcessoSequenciaModel value,
          $Res Function(ProcessoSequenciaModel) then) =
      _$ProcessoSequenciaModelCopyWithImpl<$Res, ProcessoSequenciaModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcesso,
      ProcessoEtapaModel? etapa,
      int? codEtapaSeguinte,
      ProcessoEtapaModel? etapaSequinte,
      int? codInstituicao,
      InstituicaoModel? instituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});

  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  $ProcessoEtapaModelCopyWith<$Res>? get etapaSequinte;
  $InstituicaoModelCopyWith<$Res>? get instituicao;
}

/// @nodoc
class _$ProcessoSequenciaModelCopyWithImpl<$Res,
        $Val extends ProcessoSequenciaModel>
    implements $ProcessoSequenciaModelCopyWith<$Res> {
  _$ProcessoSequenciaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcesso = freezed,
    Object? etapa = freezed,
    Object? codEtapaSeguinte = freezed,
    Object? etapaSequinte = freezed,
    Object? codInstituicao = freezed,
    Object? instituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      codEtapaSeguinte: freezed == codEtapaSeguinte
          ? _value.codEtapaSeguinte
          : codEtapaSeguinte // ignore: cast_nullable_to_non_nullable
              as int?,
      etapaSequinte: freezed == etapaSequinte
          ? _value.etapaSequinte
          : etapaSequinte // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get etapa {
    if (_value.etapa == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.etapa!, (value) {
      return _then(_value.copyWith(etapa: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get etapaSequinte {
    if (_value.etapaSequinte == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.etapaSequinte!, (value) {
      return _then(_value.copyWith(etapaSequinte: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InstituicaoModelCopyWith<$Res>? get instituicao {
    if (_value.instituicao == null) {
      return null;
    }

    return $InstituicaoModelCopyWith<$Res>(_value.instituicao!, (value) {
      return _then(_value.copyWith(instituicao: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessoSequenciaModelImplCopyWith<$Res>
    implements $ProcessoSequenciaModelCopyWith<$Res> {
  factory _$$ProcessoSequenciaModelImplCopyWith(
          _$ProcessoSequenciaModelImpl value,
          $Res Function(_$ProcessoSequenciaModelImpl) then) =
      __$$ProcessoSequenciaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codEtapaProcesso,
      ProcessoEtapaModel? etapa,
      int? codEtapaSeguinte,
      ProcessoEtapaModel? etapaSequinte,
      int? codInstituicao,
      InstituicaoModel? instituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp});

  @override
  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  @override
  $ProcessoEtapaModelCopyWith<$Res>? get etapaSequinte;
  @override
  $InstituicaoModelCopyWith<$Res>? get instituicao;
}

/// @nodoc
class __$$ProcessoSequenciaModelImplCopyWithImpl<$Res>
    extends _$ProcessoSequenciaModelCopyWithImpl<$Res,
        _$ProcessoSequenciaModelImpl>
    implements _$$ProcessoSequenciaModelImplCopyWith<$Res> {
  __$$ProcessoSequenciaModelImplCopyWithImpl(
      _$ProcessoSequenciaModelImpl _value,
      $Res Function(_$ProcessoSequenciaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEtapaProcesso = freezed,
    Object? etapa = freezed,
    Object? codEtapaSeguinte = freezed,
    Object? etapaSequinte = freezed,
    Object? codInstituicao = freezed,
    Object? instituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$ProcessoSequenciaModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      codEtapaSeguinte: freezed == codEtapaSeguinte
          ? _value.codEtapaSeguinte
          : codEtapaSeguinte // ignore: cast_nullable_to_non_nullable
              as int?,
      etapaSequinte: freezed == etapaSequinte
          ? _value.etapaSequinte
          : etapaSequinte // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoSequenciaModelImpl extends _ProcessoSequenciaModel
    with DiagnosticableTreeMixin {
  _$ProcessoSequenciaModelImpl(
      {required this.cod,
      required this.codEtapaProcesso,
      required this.etapa,
      required this.codEtapaSeguinte,
      required this.etapaSequinte,
      required this.codInstituicao,
      required this.instituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$ProcessoSequenciaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoSequenciaModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codEtapaProcesso;
  @override
  ProcessoEtapaModel? etapa;
  @override
  int? codEtapaSeguinte;
  @override
  ProcessoEtapaModel? etapaSequinte;
  @override
  int? codInstituicao;
  @override
  InstituicaoModel? instituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoSequenciaModel(cod: $cod, codEtapaProcesso: $codEtapaProcesso, etapa: $etapa, codEtapaSeguinte: $codEtapaSeguinte, etapaSequinte: $etapaSequinte, codInstituicao: $codInstituicao, instituicao: $instituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoSequenciaModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codEtapaProcesso', codEtapaProcesso))
      ..add(DiagnosticsProperty('etapa', etapa))
      ..add(DiagnosticsProperty('codEtapaSeguinte', codEtapaSeguinte))
      ..add(DiagnosticsProperty('etapaSequinte', etapaSequinte))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('instituicao', instituicao))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoSequenciaModelImplCopyWith<_$ProcessoSequenciaModelImpl>
      get copyWith => __$$ProcessoSequenciaModelImplCopyWithImpl<
          _$ProcessoSequenciaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoSequenciaModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoSequenciaModel extends ProcessoSequenciaModel {
  factory _ProcessoSequenciaModel(
          {required int? cod,
          required int? codEtapaProcesso,
          required ProcessoEtapaModel? etapa,
          required int? codEtapaSeguinte,
          required ProcessoEtapaModel? etapaSequinte,
          required int? codInstituicao,
          required InstituicaoModel? instituicao,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp}) =
      _$ProcessoSequenciaModelImpl;
  _ProcessoSequenciaModel._() : super._();

  factory _ProcessoSequenciaModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoSequenciaModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codEtapaProcesso;
  set codEtapaProcesso(int? value);
  @override
  ProcessoEtapaModel? get etapa;
  set etapa(ProcessoEtapaModel? value);
  @override
  int? get codEtapaSeguinte;
  set codEtapaSeguinte(int? value);
  @override
  ProcessoEtapaModel? get etapaSequinte;
  set etapaSequinte(ProcessoEtapaModel? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  InstituicaoModel? get instituicao;
  set instituicao(InstituicaoModel? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoSequenciaModelImplCopyWith<_$ProcessoSequenciaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
