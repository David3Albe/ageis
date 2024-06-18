// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_descritor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitDescritorModel _$KitDescritorModelFromJson(Map<String, dynamic> json) {
  return _KitDescritorModel.fromJson(json);
}

/// @nodoc
mixin _$KitDescritorModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;
  String? get tamanhoSigla => throw _privateConstructorUsedError;
  set tamanhoSigla(String? value) => throw _privateConstructorUsedError;
  int? get codEmbalagem => throw _privateConstructorUsedError;
  set codEmbalagem(int? value) => throw _privateConstructorUsedError;
  int get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int value) => throw _privateConstructorUsedError;
  int? get codTipoProcessoNormal => throw _privateConstructorUsedError;
  set codTipoProcessoNormal(int? value) => throw _privateConstructorUsedError;
  int? get codTipoProcessoUrgencia => throw _privateConstructorUsedError;
  set codTipoProcessoUrgencia(int? value) => throw _privateConstructorUsedError;
  int? get codTipoProcessoEmergencia => throw _privateConstructorUsedError;
  set codTipoProcessoEmergencia(int? value) =>
      throw _privateConstructorUsedError;
  int? get codCusto => throw _privateConstructorUsedError;
  set codCusto(int? value) => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  set ativo(bool value) => throw _privateConstructorUsedError;
  bool? get exigeProntuario => throw _privateConstructorUsedError;
  set exigeProntuario(bool? value) => throw _privateConstructorUsedError;
  String? get imagem => throw _privateConstructorUsedError;
  set imagem(String? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  List<ItemDescritorKitModel>? get itensDescritorKits =>
      throw _privateConstructorUsedError;
  set itensDescritorKits(List<ItemDescritorKitModel>? value) =>
      throw _privateConstructorUsedError;
  TamanhoModel? get tamanho => throw _privateConstructorUsedError;
  set tamanho(TamanhoModel? value) => throw _privateConstructorUsedError;
  EmbalagemModel? get embalagem => throw _privateConstructorUsedError;
  set embalagem(EmbalagemModel? value) => throw _privateConstructorUsedError;
  ProcessoTipoModel? get tipoProcesso => throw _privateConstructorUsedError;
  set tipoProcesso(ProcessoTipoModel? value) =>
      throw _privateConstructorUsedError;
  ProcessoTipoModel? get tipoProcessoEmergencia =>
      throw _privateConstructorUsedError;
  set tipoProcessoEmergencia(ProcessoTipoModel? value) =>
      throw _privateConstructorUsedError;
  ProcessoTipoModel? get tipoProcessoUrgencia =>
      throw _privateConstructorUsedError;
  set tipoProcessoUrgencia(ProcessoTipoModel? value) =>
      throw _privateConstructorUsedError;
  CentroCustoModel? get centroCusto => throw _privateConstructorUsedError;
  set centroCusto(CentroCustoModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitDescritorModelCopyWith<KitDescritorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitDescritorModelCopyWith<$Res> {
  factory $KitDescritorModelCopyWith(
          KitDescritorModel value, $Res Function(KitDescritorModel) then) =
      _$KitDescritorModelCopyWithImpl<$Res, KitDescritorModel>;
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? descricao,
      String? tamanhoSigla,
      int? codEmbalagem,
      int codInstituicao,
      int? codTipoProcessoNormal,
      int? codTipoProcessoUrgencia,
      int? codTipoProcessoEmergencia,
      int? codCusto,
      bool ativo,
      bool? exigeProntuario,
      String? imagem,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<ItemDescritorKitModel>? itensDescritorKits,
      TamanhoModel? tamanho,
      EmbalagemModel? embalagem,
      ProcessoTipoModel? tipoProcesso,
      ProcessoTipoModel? tipoProcessoEmergencia,
      ProcessoTipoModel? tipoProcessoUrgencia,
      CentroCustoModel? centroCusto});

  $TamanhoModelCopyWith<$Res>? get tamanho;
  $EmbalagemModelCopyWith<$Res>? get embalagem;
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcesso;
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoEmergencia;
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoUrgencia;
  $CentroCustoModelCopyWith<$Res>? get centroCusto;
}

/// @nodoc
class _$KitDescritorModelCopyWithImpl<$Res, $Val extends KitDescritorModel>
    implements $KitDescritorModelCopyWith<$Res> {
  _$KitDescritorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? tamanhoSigla = freezed,
    Object? codEmbalagem = freezed,
    Object? codInstituicao = null,
    Object? codTipoProcessoNormal = freezed,
    Object? codTipoProcessoUrgencia = freezed,
    Object? codTipoProcessoEmergencia = freezed,
    Object? codCusto = freezed,
    Object? ativo = null,
    Object? exigeProntuario = freezed,
    Object? imagem = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? itensDescritorKits = freezed,
    Object? tamanho = freezed,
    Object? embalagem = freezed,
    Object? tipoProcesso = freezed,
    Object? tipoProcessoEmergencia = freezed,
    Object? tipoProcessoUrgencia = freezed,
    Object? centroCusto = freezed,
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
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      tamanhoSigla: freezed == tamanhoSigla
          ? _value.tamanhoSigla
          : tamanhoSigla // ignore: cast_nullable_to_non_nullable
              as String?,
      codEmbalagem: freezed == codEmbalagem
          ? _value.codEmbalagem
          : codEmbalagem // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: null == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int,
      codTipoProcessoNormal: freezed == codTipoProcessoNormal
          ? _value.codTipoProcessoNormal
          : codTipoProcessoNormal // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoProcessoUrgencia: freezed == codTipoProcessoUrgencia
          ? _value.codTipoProcessoUrgencia
          : codTipoProcessoUrgencia // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoProcessoEmergencia: freezed == codTipoProcessoEmergencia
          ? _value.codTipoProcessoEmergencia
          : codTipoProcessoEmergencia // ignore: cast_nullable_to_non_nullable
              as int?,
      codCusto: freezed == codCusto
          ? _value.codCusto
          : codCusto // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      exigeProntuario: freezed == exigeProntuario
          ? _value.exigeProntuario
          : exigeProntuario // ignore: cast_nullable_to_non_nullable
              as bool?,
      imagem: freezed == imagem
          ? _value.imagem
          : imagem // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      itensDescritorKits: freezed == itensDescritorKits
          ? _value.itensDescritorKits
          : itensDescritorKits // ignore: cast_nullable_to_non_nullable
              as List<ItemDescritorKitModel>?,
      tamanho: freezed == tamanho
          ? _value.tamanho
          : tamanho // ignore: cast_nullable_to_non_nullable
              as TamanhoModel?,
      embalagem: freezed == embalagem
          ? _value.embalagem
          : embalagem // ignore: cast_nullable_to_non_nullable
              as EmbalagemModel?,
      tipoProcesso: freezed == tipoProcesso
          ? _value.tipoProcesso
          : tipoProcesso // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      tipoProcessoEmergencia: freezed == tipoProcessoEmergencia
          ? _value.tipoProcessoEmergencia
          : tipoProcessoEmergencia // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      tipoProcessoUrgencia: freezed == tipoProcessoUrgencia
          ? _value.tipoProcessoUrgencia
          : tipoProcessoUrgencia // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      centroCusto: freezed == centroCusto
          ? _value.centroCusto
          : centroCusto // ignore: cast_nullable_to_non_nullable
              as CentroCustoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TamanhoModelCopyWith<$Res>? get tamanho {
    if (_value.tamanho == null) {
      return null;
    }

    return $TamanhoModelCopyWith<$Res>(_value.tamanho!, (value) {
      return _then(_value.copyWith(tamanho: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmbalagemModelCopyWith<$Res>? get embalagem {
    if (_value.embalagem == null) {
      return null;
    }

    return $EmbalagemModelCopyWith<$Res>(_value.embalagem!, (value) {
      return _then(_value.copyWith(embalagem: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcesso {
    if (_value.tipoProcesso == null) {
      return null;
    }

    return $ProcessoTipoModelCopyWith<$Res>(_value.tipoProcesso!, (value) {
      return _then(_value.copyWith(tipoProcesso: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoEmergencia {
    if (_value.tipoProcessoEmergencia == null) {
      return null;
    }

    return $ProcessoTipoModelCopyWith<$Res>(_value.tipoProcessoEmergencia!,
        (value) {
      return _then(_value.copyWith(tipoProcessoEmergencia: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoUrgencia {
    if (_value.tipoProcessoUrgencia == null) {
      return null;
    }

    return $ProcessoTipoModelCopyWith<$Res>(_value.tipoProcessoUrgencia!,
        (value) {
      return _then(_value.copyWith(tipoProcessoUrgencia: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CentroCustoModelCopyWith<$Res>? get centroCusto {
    if (_value.centroCusto == null) {
      return null;
    }

    return $CentroCustoModelCopyWith<$Res>(_value.centroCusto!, (value) {
      return _then(_value.copyWith(centroCusto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KitDescritorModelImplCopyWith<$Res>
    implements $KitDescritorModelCopyWith<$Res> {
  factory _$$KitDescritorModelImplCopyWith(_$KitDescritorModelImpl value,
          $Res Function(_$KitDescritorModelImpl) then) =
      __$$KitDescritorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      String? nome,
      String? descricao,
      String? tamanhoSigla,
      int? codEmbalagem,
      int codInstituicao,
      int? codTipoProcessoNormal,
      int? codTipoProcessoUrgencia,
      int? codTipoProcessoEmergencia,
      int? codCusto,
      bool ativo,
      bool? exigeProntuario,
      String? imagem,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      List<ItemDescritorKitModel>? itensDescritorKits,
      TamanhoModel? tamanho,
      EmbalagemModel? embalagem,
      ProcessoTipoModel? tipoProcesso,
      ProcessoTipoModel? tipoProcessoEmergencia,
      ProcessoTipoModel? tipoProcessoUrgencia,
      CentroCustoModel? centroCusto});

  @override
  $TamanhoModelCopyWith<$Res>? get tamanho;
  @override
  $EmbalagemModelCopyWith<$Res>? get embalagem;
  @override
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcesso;
  @override
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoEmergencia;
  @override
  $ProcessoTipoModelCopyWith<$Res>? get tipoProcessoUrgencia;
  @override
  $CentroCustoModelCopyWith<$Res>? get centroCusto;
}

/// @nodoc
class __$$KitDescritorModelImplCopyWithImpl<$Res>
    extends _$KitDescritorModelCopyWithImpl<$Res, _$KitDescritorModelImpl>
    implements _$$KitDescritorModelImplCopyWith<$Res> {
  __$$KitDescritorModelImplCopyWithImpl(_$KitDescritorModelImpl _value,
      $Res Function(_$KitDescritorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? tamanhoSigla = freezed,
    Object? codEmbalagem = freezed,
    Object? codInstituicao = null,
    Object? codTipoProcessoNormal = freezed,
    Object? codTipoProcessoUrgencia = freezed,
    Object? codTipoProcessoEmergencia = freezed,
    Object? codCusto = freezed,
    Object? ativo = null,
    Object? exigeProntuario = freezed,
    Object? imagem = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? itensDescritorKits = freezed,
    Object? tamanho = freezed,
    Object? embalagem = freezed,
    Object? tipoProcesso = freezed,
    Object? tipoProcessoEmergencia = freezed,
    Object? tipoProcessoUrgencia = freezed,
    Object? centroCusto = freezed,
  }) {
    return _then(_$KitDescritorModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      tamanhoSigla: freezed == tamanhoSigla
          ? _value.tamanhoSigla
          : tamanhoSigla // ignore: cast_nullable_to_non_nullable
              as String?,
      codEmbalagem: freezed == codEmbalagem
          ? _value.codEmbalagem
          : codEmbalagem // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: null == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int,
      codTipoProcessoNormal: freezed == codTipoProcessoNormal
          ? _value.codTipoProcessoNormal
          : codTipoProcessoNormal // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoProcessoUrgencia: freezed == codTipoProcessoUrgencia
          ? _value.codTipoProcessoUrgencia
          : codTipoProcessoUrgencia // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipoProcessoEmergencia: freezed == codTipoProcessoEmergencia
          ? _value.codTipoProcessoEmergencia
          : codTipoProcessoEmergencia // ignore: cast_nullable_to_non_nullable
              as int?,
      codCusto: freezed == codCusto
          ? _value.codCusto
          : codCusto // ignore: cast_nullable_to_non_nullable
              as int?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      exigeProntuario: freezed == exigeProntuario
          ? _value.exigeProntuario
          : exigeProntuario // ignore: cast_nullable_to_non_nullable
              as bool?,
      imagem: freezed == imagem
          ? _value.imagem
          : imagem // ignore: cast_nullable_to_non_nullable
              as String?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      itensDescritorKits: freezed == itensDescritorKits
          ? _value.itensDescritorKits
          : itensDescritorKits // ignore: cast_nullable_to_non_nullable
              as List<ItemDescritorKitModel>?,
      tamanho: freezed == tamanho
          ? _value.tamanho
          : tamanho // ignore: cast_nullable_to_non_nullable
              as TamanhoModel?,
      embalagem: freezed == embalagem
          ? _value.embalagem
          : embalagem // ignore: cast_nullable_to_non_nullable
              as EmbalagemModel?,
      tipoProcesso: freezed == tipoProcesso
          ? _value.tipoProcesso
          : tipoProcesso // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      tipoProcessoEmergencia: freezed == tipoProcessoEmergencia
          ? _value.tipoProcessoEmergencia
          : tipoProcessoEmergencia // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      tipoProcessoUrgencia: freezed == tipoProcessoUrgencia
          ? _value.tipoProcessoUrgencia
          : tipoProcessoUrgencia // ignore: cast_nullable_to_non_nullable
              as ProcessoTipoModel?,
      centroCusto: freezed == centroCusto
          ? _value.centroCusto
          : centroCusto // ignore: cast_nullable_to_non_nullable
              as CentroCustoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitDescritorModelImpl extends _KitDescritorModel
    with DiagnosticableTreeMixin {
  _$KitDescritorModelImpl(
      {required this.cod,
      required this.nome,
      required this.descricao,
      required this.tamanhoSigla,
      required this.codEmbalagem,
      required this.codInstituicao,
      required this.codTipoProcessoNormal,
      required this.codTipoProcessoUrgencia,
      required this.codTipoProcessoEmergencia,
      required this.codCusto,
      required this.ativo,
      required this.exigeProntuario,
      required this.imagem,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      this.itensDescritorKits,
      required this.tamanho,
      required this.embalagem,
      required this.tipoProcesso,
      required this.tipoProcessoEmergencia,
      required this.tipoProcessoUrgencia,
      required this.centroCusto})
      : super._();

  factory _$KitDescritorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitDescritorModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? nome;
  @override
  String? descricao;
  @override
  String? tamanhoSigla;
  @override
  int? codEmbalagem;
  @override
  int codInstituicao;
  @override
  int? codTipoProcessoNormal;
  @override
  int? codTipoProcessoUrgencia;
  @override
  int? codTipoProcessoEmergencia;
  @override
  int? codCusto;
  @override
  bool ativo;
  @override
  bool? exigeProntuario;
  @override
  String? imagem;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  List<ItemDescritorKitModel>? itensDescritorKits;
  @override
  TamanhoModel? tamanho;
  @override
  EmbalagemModel? embalagem;
  @override
  ProcessoTipoModel? tipoProcesso;
  @override
  ProcessoTipoModel? tipoProcessoEmergencia;
  @override
  ProcessoTipoModel? tipoProcessoUrgencia;
  @override
  CentroCustoModel? centroCusto;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitDescritorModel(cod: $cod, nome: $nome, descricao: $descricao, tamanhoSigla: $tamanhoSigla, codEmbalagem: $codEmbalagem, codInstituicao: $codInstituicao, codTipoProcessoNormal: $codTipoProcessoNormal, codTipoProcessoUrgencia: $codTipoProcessoUrgencia, codTipoProcessoEmergencia: $codTipoProcessoEmergencia, codCusto: $codCusto, ativo: $ativo, exigeProntuario: $exigeProntuario, imagem: $imagem, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, itensDescritorKits: $itensDescritorKits, tamanho: $tamanho, embalagem: $embalagem, tipoProcesso: $tipoProcesso, tipoProcessoEmergencia: $tipoProcessoEmergencia, tipoProcessoUrgencia: $tipoProcessoUrgencia, centroCusto: $centroCusto)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitDescritorModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('tamanhoSigla', tamanhoSigla))
      ..add(DiagnosticsProperty('codEmbalagem', codEmbalagem))
      ..add(DiagnosticsProperty('codInstituicao', codInstituicao))
      ..add(DiagnosticsProperty('codTipoProcessoNormal', codTipoProcessoNormal))
      ..add(DiagnosticsProperty(
          'codTipoProcessoUrgencia', codTipoProcessoUrgencia))
      ..add(DiagnosticsProperty(
          'codTipoProcessoEmergencia', codTipoProcessoEmergencia))
      ..add(DiagnosticsProperty('codCusto', codCusto))
      ..add(DiagnosticsProperty('ativo', ativo))
      ..add(DiagnosticsProperty('exigeProntuario', exigeProntuario))
      ..add(DiagnosticsProperty('imagem', imagem))
      ..add(DiagnosticsProperty('ultimaAlteracao', ultimaAlteracao))
      ..add(DiagnosticsProperty('tstamp', tstamp))
      ..add(DiagnosticsProperty('itensDescritorKits', itensDescritorKits))
      ..add(DiagnosticsProperty('tamanho', tamanho))
      ..add(DiagnosticsProperty('embalagem', embalagem))
      ..add(DiagnosticsProperty('tipoProcesso', tipoProcesso))
      ..add(
          DiagnosticsProperty('tipoProcessoEmergencia', tipoProcessoEmergencia))
      ..add(DiagnosticsProperty('tipoProcessoUrgencia', tipoProcessoUrgencia))
      ..add(DiagnosticsProperty('centroCusto', centroCusto));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitDescritorModelImplCopyWith<_$KitDescritorModelImpl> get copyWith =>
      __$$KitDescritorModelImplCopyWithImpl<_$KitDescritorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitDescritorModelImplToJson(
      this,
    );
  }
}

abstract class _KitDescritorModel extends KitDescritorModel {
  factory _KitDescritorModel(
      {required int? cod,
      required String? nome,
      required String? descricao,
      required String? tamanhoSigla,
      required int? codEmbalagem,
      required int codInstituicao,
      required int? codTipoProcessoNormal,
      required int? codTipoProcessoUrgencia,
      required int? codTipoProcessoEmergencia,
      required int? codCusto,
      required bool ativo,
      required bool? exigeProntuario,
      required String? imagem,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      List<ItemDescritorKitModel>? itensDescritorKits,
      required TamanhoModel? tamanho,
      required EmbalagemModel? embalagem,
      required ProcessoTipoModel? tipoProcesso,
      required ProcessoTipoModel? tipoProcessoEmergencia,
      required ProcessoTipoModel? tipoProcessoUrgencia,
      required CentroCustoModel? centroCusto}) = _$KitDescritorModelImpl;
  _KitDescritorModel._() : super._();

  factory _KitDescritorModel.fromJson(Map<String, dynamic> json) =
      _$KitDescritorModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  String? get tamanhoSigla;
  set tamanhoSigla(String? value);
  @override
  int? get codEmbalagem;
  set codEmbalagem(int? value);
  @override
  int get codInstituicao;
  set codInstituicao(int value);
  @override
  int? get codTipoProcessoNormal;
  set codTipoProcessoNormal(int? value);
  @override
  int? get codTipoProcessoUrgencia;
  set codTipoProcessoUrgencia(int? value);
  @override
  int? get codTipoProcessoEmergencia;
  set codTipoProcessoEmergencia(int? value);
  @override
  int? get codCusto;
  set codCusto(int? value);
  @override
  bool get ativo;
  set ativo(bool value);
  @override
  bool? get exigeProntuario;
  set exigeProntuario(bool? value);
  @override
  String? get imagem;
  set imagem(String? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  List<ItemDescritorKitModel>? get itensDescritorKits;
  set itensDescritorKits(List<ItemDescritorKitModel>? value);
  @override
  TamanhoModel? get tamanho;
  set tamanho(TamanhoModel? value);
  @override
  EmbalagemModel? get embalagem;
  set embalagem(EmbalagemModel? value);
  @override
  ProcessoTipoModel? get tipoProcesso;
  set tipoProcesso(ProcessoTipoModel? value);
  @override
  ProcessoTipoModel? get tipoProcessoEmergencia;
  set tipoProcessoEmergencia(ProcessoTipoModel? value);
  @override
  ProcessoTipoModel? get tipoProcessoUrgencia;
  set tipoProcessoUrgencia(ProcessoTipoModel? value);
  @override
  CentroCustoModel? get centroCusto;
  set centroCusto(CentroCustoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$KitDescritorModelImplCopyWith<_$KitDescritorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
