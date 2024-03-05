// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_resposta_epcepi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoRespostaEPCEPIModel _$ProcessoRespostaEPCEPIModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoRespostaEPCEPIModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoRespostaEPCEPIModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  InstituicaoModel? get instituicao => throw _privateConstructorUsedError;
  set instituicao(InstituicaoModel? value) =>
      throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  int? get codUsuarioLiberacao => throw _privateConstructorUsedError;
  set codUsuarioLiberacao(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  int? get resposta => throw _privateConstructorUsedError;
  set resposta(int? value) => throw _privateConstructorUsedError;
  int? get codEquipamento => throw _privateConstructorUsedError;
  set codEquipamento(int? value) => throw _privateConstructorUsedError;
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
  EquipamentoModel? get equipamento => throw _privateConstructorUsedError;
  set equipamento(EquipamentoModel? value) =>
      throw _privateConstructorUsedError;
  String? get entradaSaida => throw _privateConstructorUsedError;
  set entradaSaida(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoRespostaEPCEPIModelCopyWith<ProcessoRespostaEPCEPIModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoRespostaEPCEPIModelCopyWith<$Res> {
  factory $ProcessoRespostaEPCEPIModelCopyWith(
          ProcessoRespostaEPCEPIModel value,
          $Res Function(ProcessoRespostaEPCEPIModel) then) =
      _$ProcessoRespostaEPCEPIModelCopyWithImpl<$Res,
          ProcessoRespostaEPCEPIModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codInstituicao,
      InstituicaoModel? instituicao,
      int? codUsuario,
      int? codUsuarioLiberacao,
      DateTime? dataHora,
      int? resposta,
      int? codEquipamento,
      int? codEstoque,
      EquipamentoModel? equipamento,
      String? entradaSaida,
      @JsonKey(name: 'tStamp') String? tstamp});

  $InstituicaoModelCopyWith<$Res>? get instituicao;
  $EquipamentoModelCopyWith<$Res>? get equipamento;
}

/// @nodoc
class _$ProcessoRespostaEPCEPIModelCopyWithImpl<$Res,
        $Val extends ProcessoRespostaEPCEPIModel>
    implements $ProcessoRespostaEPCEPIModelCopyWith<$Res> {
  _$ProcessoRespostaEPCEPIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInstituicao = freezed,
    Object? instituicao = freezed,
    Object? codUsuario = freezed,
    Object? codUsuarioLiberacao = freezed,
    Object? dataHora = freezed,
    Object? resposta = freezed,
    Object? codEquipamento = freezed,
    Object? codEstoque = freezed,
    Object? equipamento = freezed,
    Object? entradaSaida = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resposta: freezed == resposta
          ? _value.resposta
          : resposta // ignore: cast_nullable_to_non_nullable
              as int?,
      codEquipamento: freezed == codEquipamento
          ? _value.codEquipamento
          : codEquipamento // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      entradaSaida: freezed == entradaSaida
          ? _value.entradaSaida
          : entradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $EquipamentoModelCopyWith<$Res>? get equipamento {
    if (_value.equipamento == null) {
      return null;
    }

    return $EquipamentoModelCopyWith<$Res>(_value.equipamento!, (value) {
      return _then(_value.copyWith(equipamento: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProcessoRespostaEPCEPIModelImplCopyWith<$Res>
    implements $ProcessoRespostaEPCEPIModelCopyWith<$Res> {
  factory _$$ProcessoRespostaEPCEPIModelImplCopyWith(
          _$ProcessoRespostaEPCEPIModelImpl value,
          $Res Function(_$ProcessoRespostaEPCEPIModelImpl) then) =
      __$$ProcessoRespostaEPCEPIModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codInstituicao,
      InstituicaoModel? instituicao,
      int? codUsuario,
      int? codUsuarioLiberacao,
      DateTime? dataHora,
      int? resposta,
      int? codEquipamento,
      int? codEstoque,
      EquipamentoModel? equipamento,
      String? entradaSaida,
      @JsonKey(name: 'tStamp') String? tstamp});

  @override
  $InstituicaoModelCopyWith<$Res>? get instituicao;
  @override
  $EquipamentoModelCopyWith<$Res>? get equipamento;
}

/// @nodoc
class __$$ProcessoRespostaEPCEPIModelImplCopyWithImpl<$Res>
    extends _$ProcessoRespostaEPCEPIModelCopyWithImpl<$Res,
        _$ProcessoRespostaEPCEPIModelImpl>
    implements _$$ProcessoRespostaEPCEPIModelImplCopyWith<$Res> {
  __$$ProcessoRespostaEPCEPIModelImplCopyWithImpl(
      _$ProcessoRespostaEPCEPIModelImpl _value,
      $Res Function(_$ProcessoRespostaEPCEPIModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInstituicao = freezed,
    Object? instituicao = freezed,
    Object? codUsuario = freezed,
    Object? codUsuarioLiberacao = freezed,
    Object? dataHora = freezed,
    Object? resposta = freezed,
    Object? codEquipamento = freezed,
    Object? codEstoque = freezed,
    Object? equipamento = freezed,
    Object? entradaSaida = freezed,
    Object? tstamp = freezed,
  }) {
    return _then(_$ProcessoRespostaEPCEPIModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      instituicao: freezed == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as InstituicaoModel?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resposta: freezed == resposta
          ? _value.resposta
          : resposta // ignore: cast_nullable_to_non_nullable
              as int?,
      codEquipamento: freezed == codEquipamento
          ? _value.codEquipamento
          : codEquipamento // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      entradaSaida: freezed == entradaSaida
          ? _value.entradaSaida
          : entradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoRespostaEPCEPIModelImpl extends _ProcessoRespostaEPCEPIModel
    with DiagnosticableTreeMixin {
  _$ProcessoRespostaEPCEPIModelImpl(
      {required this.cod,
      required this.codInstituicao,
      required this.instituicao,
      required this.codUsuario,
      required this.codUsuarioLiberacao,
      required this.dataHora,
      required this.resposta,
      required this.codEquipamento,
      required this.codEstoque,
      required this.equipamento,
      required this.entradaSaida,
      @JsonKey(name: 'tStamp') required this.tstamp})
      : super._();

  factory _$ProcessoRespostaEPCEPIModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoRespostaEPCEPIModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codInstituicao;
  @override
  InstituicaoModel? instituicao;
  @override
  int? codUsuario;
  @override
  int? codUsuarioLiberacao;
  @override
  DateTime? dataHora;
  @override
  int? resposta;
  @override
  int? codEquipamento;
  @override
  int? codEstoque;
  @override
  EquipamentoModel? equipamento;
  @override
  String? entradaSaida;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoRespostaEPCEPIModel(cod: $cod, codInstituicao: $codInstituicao, instituicao: $instituicao, codUsuario: $codUsuario, codUsuarioLiberacao: $codUsuarioLiberacao, dataHora: $dataHora, resposta: $resposta, codEquipamento: $codEquipamento, codEstoque: $codEstoque, equipamento: $equipamento, entradaSaida: $entradaSaida, tstamp: $tstamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoRespostaEPCEPIModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('instituicao', instituicao))
      ..add(DiagnosticsProperty('codUsuario', codUsuario))
      ..add(DiagnosticsProperty('codUsuarioLiberacao', codUsuarioLiberacao))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('resposta', resposta))
      ..add(DiagnosticsProperty('codEquipamento', codEquipamento))
      ..add(DiagnosticsProperty('codEstoque', codEstoque))
      ..add(DiagnosticsProperty('equipamento', equipamento))
      ..add(DiagnosticsProperty('entradaSaida', entradaSaida))
      ..add(DiagnosticsProperty('tstamp', tstamp));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoRespostaEPCEPIModelImplCopyWith<_$ProcessoRespostaEPCEPIModelImpl>
      get copyWith => __$$ProcessoRespostaEPCEPIModelImplCopyWithImpl<
          _$ProcessoRespostaEPCEPIModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoRespostaEPCEPIModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoRespostaEPCEPIModel
    extends ProcessoRespostaEPCEPIModel {
  factory _ProcessoRespostaEPCEPIModel(
          {required int? cod,
          required int? codInstituicao,
          required InstituicaoModel? instituicao,
          required int? codUsuario,
          required int? codUsuarioLiberacao,
          required DateTime? dataHora,
          required int? resposta,
          required int? codEquipamento,
          required int? codEstoque,
          required EquipamentoModel? equipamento,
          required String? entradaSaida,
          @JsonKey(name: 'tStamp') required String? tstamp}) =
      _$ProcessoRespostaEPCEPIModelImpl;
  _ProcessoRespostaEPCEPIModel._() : super._();

  factory _ProcessoRespostaEPCEPIModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoRespostaEPCEPIModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  InstituicaoModel? get instituicao;
  set instituicao(InstituicaoModel? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  int? get codUsuarioLiberacao;
  set codUsuarioLiberacao(int? value);
  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  int? get resposta;
  set resposta(int? value);
  @override
  int? get codEquipamento;
  set codEquipamento(int? value);
  @override
  int? get codEstoque;
  set codEstoque(int? value);
  @override
  EquipamentoModel? get equipamento;
  set equipamento(EquipamentoModel? value);
  @override
  String? get entradaSaida;
  set entradaSaida(String? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoRespostaEPCEPIModelImplCopyWith<_$ProcessoRespostaEPCEPIModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
