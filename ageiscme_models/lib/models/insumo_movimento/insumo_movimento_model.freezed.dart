// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_movimento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InsumoMovimentoModel _$InsumoMovimentoModelFromJson(Map<String, dynamic> json) {
  return _InsumoMovimentoModel.fromJson(json);
}

/// @nodoc
mixin _$InsumoMovimentoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  int? get codBarra => throw _privateConstructorUsedError;
  set codBarra(int? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;
  String? get flagEntradaSaida => throw _privateConstructorUsedError;
  set flagEntradaSaida(String? value) => throw _privateConstructorUsedError;
  int? get codDeposito => throw _privateConstructorUsedError;
  set codDeposito(int? value) => throw _privateConstructorUsedError;
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  double? get quantidade => throw _privateConstructorUsedError;
  set quantidade(double? value) => throw _privateConstructorUsedError;
  String? get lote => throw _privateConstructorUsedError;
  set lote(String? value) => throw _privateConstructorUsedError;
  DateTime? get dataFabricacao => throw _privateConstructorUsedError;
  set dataFabricacao(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataValidade => throw _privateConstructorUsedError;
  set dataValidade(DateTime? value) => throw _privateConstructorUsedError;
  String? get nroTotalFiscal => throw _privateConstructorUsedError;
  set nroTotalFiscal(String? value) => throw _privateConstructorUsedError;
  double? get precoNotaFiscal => throw _privateConstructorUsedError;
  set precoNotaFiscal(double? value) => throw _privateConstructorUsedError;
  double? get precoCusto3Albe => throw _privateConstructorUsedError;
  set precoCusto3Albe(double? value) => throw _privateConstructorUsedError;
  double? get precoVenda3Albe => throw _privateConstructorUsedError;
  set precoVenda3Albe(double? value) => throw _privateConstructorUsedError;
  int? get codEquipamentoInsumo => throw _privateConstructorUsedError;
  set codEquipamentoInsumo(int? value) => throw _privateConstructorUsedError;
  int? get codDestinoResiduos => throw _privateConstructorUsedError;
  set codDestinoResiduos(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataNotaFiscal => throw _privateConstructorUsedError;
  set dataNotaFiscal(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  InsumoModel? get insumo => throw _privateConstructorUsedError;
  set insumo(InsumoModel? value) => throw _privateConstructorUsedError;
  DestinoResiduoModel? get destinoResiduo => throw _privateConstructorUsedError;
  set destinoResiduo(DestinoResiduoModel? value) =>
      throw _privateConstructorUsedError;
  EquipamentoModel? get equipamento => throw _privateConstructorUsedError;
  set equipamento(EquipamentoModel? value) =>
      throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  DepositoInsumoModel? get deposito => throw _privateConstructorUsedError;
  set deposito(DepositoInsumoModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoMovimentoModelCopyWith<InsumoMovimentoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoMovimentoModelCopyWith<$Res> {
  factory $InsumoMovimentoModelCopyWith(InsumoMovimentoModel value,
          $Res Function(InsumoMovimentoModel) then) =
      _$InsumoMovimentoModelCopyWithImpl<$Res, InsumoMovimentoModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codInsumo,
      int? codBarra,
      int? codUsuario,
      String? flagEntradaSaida,
      int? codDeposito,
      DateTime? dataHora,
      double? quantidade,
      String? lote,
      DateTime? dataFabricacao,
      DateTime? dataValidade,
      String? nroTotalFiscal,
      double? precoNotaFiscal,
      double? precoCusto3Albe,
      double? precoVenda3Albe,
      int? codEquipamentoInsumo,
      int? codDestinoResiduos,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      DateTime? dataNotaFiscal,
      @JsonKey(name: 'tStamp') String? tstamp,
      InsumoModel? insumo,
      DestinoResiduoModel? destinoResiduo,
      EquipamentoModel? equipamento,
      UsuarioModel? usuario,
      DepositoInsumoModel? deposito});

  $InsumoModelCopyWith<$Res>? get insumo;
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo;
  $EquipamentoModelCopyWith<$Res>? get equipamento;
  $UsuarioModelCopyWith<$Res>? get usuario;
  $DepositoInsumoModelCopyWith<$Res>? get deposito;
}

/// @nodoc
class _$InsumoMovimentoModelCopyWithImpl<$Res,
        $Val extends InsumoMovimentoModel>
    implements $InsumoMovimentoModelCopyWith<$Res> {
  _$InsumoMovimentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInsumo = freezed,
    Object? codBarra = freezed,
    Object? codUsuario = freezed,
    Object? flagEntradaSaida = freezed,
    Object? codDeposito = freezed,
    Object? dataHora = freezed,
    Object? quantidade = freezed,
    Object? lote = freezed,
    Object? dataFabricacao = freezed,
    Object? dataValidade = freezed,
    Object? nroTotalFiscal = freezed,
    Object? precoNotaFiscal = freezed,
    Object? precoCusto3Albe = freezed,
    Object? precoVenda3Albe = freezed,
    Object? codEquipamentoInsumo = freezed,
    Object? codDestinoResiduos = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? dataNotaFiscal = freezed,
    Object? tstamp = freezed,
    Object? insumo = freezed,
    Object? destinoResiduo = freezed,
    Object? equipamento = freezed,
    Object? usuario = freezed,
    Object? deposito = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      flagEntradaSaida: freezed == flagEntradaSaida
          ? _value.flagEntradaSaida
          : flagEntradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      dataFabricacao: freezed == dataFabricacao
          ? _value.dataFabricacao
          : dataFabricacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nroTotalFiscal: freezed == nroTotalFiscal
          ? _value.nroTotalFiscal
          : nroTotalFiscal // ignore: cast_nullable_to_non_nullable
              as String?,
      precoNotaFiscal: freezed == precoNotaFiscal
          ? _value.precoNotaFiscal
          : precoNotaFiscal // ignore: cast_nullable_to_non_nullable
              as double?,
      precoCusto3Albe: freezed == precoCusto3Albe
          ? _value.precoCusto3Albe
          : precoCusto3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      precoVenda3Albe: freezed == precoVenda3Albe
          ? _value.precoVenda3Albe
          : precoVenda3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      codEquipamentoInsumo: freezed == codEquipamentoInsumo
          ? _value.codEquipamentoInsumo
          : codEquipamentoInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codDestinoResiduos: freezed == codDestinoResiduos
          ? _value.codDestinoResiduos
          : codDestinoResiduos // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataNotaFiscal: freezed == dataNotaFiscal
          ? _value.dataNotaFiscal
          : dataNotaFiscal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
      destinoResiduo: freezed == destinoResiduo
          ? _value.destinoResiduo
          : destinoResiduo // ignore: cast_nullable_to_non_nullable
              as DestinoResiduoModel?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      deposito: freezed == deposito
          ? _value.deposito
          : deposito // ignore: cast_nullable_to_non_nullable
              as DepositoInsumoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InsumoModelCopyWith<$Res>? get insumo {
    if (_value.insumo == null) {
      return null;
    }

    return $InsumoModelCopyWith<$Res>(_value.insumo!, (value) {
      return _then(_value.copyWith(insumo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo {
    if (_value.destinoResiduo == null) {
      return null;
    }

    return $DestinoResiduoModelCopyWith<$Res>(_value.destinoResiduo!, (value) {
      return _then(_value.copyWith(destinoResiduo: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $DepositoInsumoModelCopyWith<$Res>? get deposito {
    if (_value.deposito == null) {
      return null;
    }

    return $DepositoInsumoModelCopyWith<$Res>(_value.deposito!, (value) {
      return _then(_value.copyWith(deposito: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InsumoMovimentoModelImplCopyWith<$Res>
    implements $InsumoMovimentoModelCopyWith<$Res> {
  factory _$$InsumoMovimentoModelImplCopyWith(_$InsumoMovimentoModelImpl value,
          $Res Function(_$InsumoMovimentoModelImpl) then) =
      __$$InsumoMovimentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codInsumo,
      int? codBarra,
      int? codUsuario,
      String? flagEntradaSaida,
      int? codDeposito,
      DateTime? dataHora,
      double? quantidade,
      String? lote,
      DateTime? dataFabricacao,
      DateTime? dataValidade,
      String? nroTotalFiscal,
      double? precoNotaFiscal,
      double? precoCusto3Albe,
      double? precoVenda3Albe,
      int? codEquipamentoInsumo,
      int? codDestinoResiduos,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      DateTime? dataNotaFiscal,
      @JsonKey(name: 'tStamp') String? tstamp,
      InsumoModel? insumo,
      DestinoResiduoModel? destinoResiduo,
      EquipamentoModel? equipamento,
      UsuarioModel? usuario,
      DepositoInsumoModel? deposito});

  @override
  $InsumoModelCopyWith<$Res>? get insumo;
  @override
  $DestinoResiduoModelCopyWith<$Res>? get destinoResiduo;
  @override
  $EquipamentoModelCopyWith<$Res>? get equipamento;
  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
  @override
  $DepositoInsumoModelCopyWith<$Res>? get deposito;
}

/// @nodoc
class __$$InsumoMovimentoModelImplCopyWithImpl<$Res>
    extends _$InsumoMovimentoModelCopyWithImpl<$Res, _$InsumoMovimentoModelImpl>
    implements _$$InsumoMovimentoModelImplCopyWith<$Res> {
  __$$InsumoMovimentoModelImplCopyWithImpl(_$InsumoMovimentoModelImpl _value,
      $Res Function(_$InsumoMovimentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codInsumo = freezed,
    Object? codBarra = freezed,
    Object? codUsuario = freezed,
    Object? flagEntradaSaida = freezed,
    Object? codDeposito = freezed,
    Object? dataHora = freezed,
    Object? quantidade = freezed,
    Object? lote = freezed,
    Object? dataFabricacao = freezed,
    Object? dataValidade = freezed,
    Object? nroTotalFiscal = freezed,
    Object? precoNotaFiscal = freezed,
    Object? precoCusto3Albe = freezed,
    Object? precoVenda3Albe = freezed,
    Object? codEquipamentoInsumo = freezed,
    Object? codDestinoResiduos = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? dataNotaFiscal = freezed,
    Object? tstamp = freezed,
    Object? insumo = freezed,
    Object? destinoResiduo = freezed,
    Object? equipamento = freezed,
    Object? usuario = freezed,
    Object? deposito = freezed,
  }) {
    return _then(_$InsumoMovimentoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
      flagEntradaSaida: freezed == flagEntradaSaida
          ? _value.flagEntradaSaida
          : flagEntradaSaida // ignore: cast_nullable_to_non_nullable
              as String?,
      codDeposito: freezed == codDeposito
          ? _value.codDeposito
          : codDeposito // ignore: cast_nullable_to_non_nullable
              as int?,
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as double?,
      lote: freezed == lote
          ? _value.lote
          : lote // ignore: cast_nullable_to_non_nullable
              as String?,
      dataFabricacao: freezed == dataFabricacao
          ? _value.dataFabricacao
          : dataFabricacao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nroTotalFiscal: freezed == nroTotalFiscal
          ? _value.nroTotalFiscal
          : nroTotalFiscal // ignore: cast_nullable_to_non_nullable
              as String?,
      precoNotaFiscal: freezed == precoNotaFiscal
          ? _value.precoNotaFiscal
          : precoNotaFiscal // ignore: cast_nullable_to_non_nullable
              as double?,
      precoCusto3Albe: freezed == precoCusto3Albe
          ? _value.precoCusto3Albe
          : precoCusto3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      precoVenda3Albe: freezed == precoVenda3Albe
          ? _value.precoVenda3Albe
          : precoVenda3Albe // ignore: cast_nullable_to_non_nullable
              as double?,
      codEquipamentoInsumo: freezed == codEquipamentoInsumo
          ? _value.codEquipamentoInsumo
          : codEquipamentoInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      codDestinoResiduos: freezed == codDestinoResiduos
          ? _value.codDestinoResiduos
          : codDestinoResiduos // ignore: cast_nullable_to_non_nullable
              as int?,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataNotaFiscal: freezed == dataNotaFiscal
          ? _value.dataNotaFiscal
          : dataNotaFiscal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      insumo: freezed == insumo
          ? _value.insumo
          : insumo // ignore: cast_nullable_to_non_nullable
              as InsumoModel?,
      destinoResiduo: freezed == destinoResiduo
          ? _value.destinoResiduo
          : destinoResiduo // ignore: cast_nullable_to_non_nullable
              as DestinoResiduoModel?,
      equipamento: freezed == equipamento
          ? _value.equipamento
          : equipamento // ignore: cast_nullable_to_non_nullable
              as EquipamentoModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      deposito: freezed == deposito
          ? _value.deposito
          : deposito // ignore: cast_nullable_to_non_nullable
              as DepositoInsumoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoMovimentoModelImpl extends _InsumoMovimentoModel {
  _$InsumoMovimentoModelImpl(
      {this.cod,
      this.codInsumo,
      this.codBarra,
      this.codUsuario,
      this.flagEntradaSaida,
      this.codDeposito,
      this.dataHora,
      this.quantidade,
      this.lote,
      this.dataFabricacao,
      this.dataValidade,
      this.nroTotalFiscal,
      this.precoNotaFiscal,
      this.precoCusto3Albe,
      this.precoVenda3Albe,
      this.codEquipamentoInsumo,
      this.codDestinoResiduos,
      this.codInstituicao,
      this.ultimaAlteracao,
      this.dataNotaFiscal,
      @JsonKey(name: 'tStamp') this.tstamp,
      this.insumo,
      this.destinoResiduo,
      this.equipamento,
      this.usuario,
      this.deposito})
      : super._();

  factory _$InsumoMovimentoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsumoMovimentoModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codInsumo;
  @override
  int? codBarra;
  @override
  int? codUsuario;
  @override
  String? flagEntradaSaida;
  @override
  int? codDeposito;
  @override
  DateTime? dataHora;
  @override
  double? quantidade;
  @override
  String? lote;
  @override
  DateTime? dataFabricacao;
  @override
  DateTime? dataValidade;
  @override
  String? nroTotalFiscal;
  @override
  double? precoNotaFiscal;
  @override
  double? precoCusto3Albe;
  @override
  double? precoVenda3Albe;
  @override
  int? codEquipamentoInsumo;
  @override
  int? codDestinoResiduos;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  DateTime? dataNotaFiscal;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  InsumoModel? insumo;
  @override
  DestinoResiduoModel? destinoResiduo;
  @override
  EquipamentoModel? equipamento;
  @override
  UsuarioModel? usuario;
  @override
  DepositoInsumoModel? deposito;

  @override
  String toString() {
    return 'InsumoMovimentoModel(cod: $cod, codInsumo: $codInsumo, codBarra: $codBarra, codUsuario: $codUsuario, flagEntradaSaida: $flagEntradaSaida, codDeposito: $codDeposito, dataHora: $dataHora, quantidade: $quantidade, lote: $lote, dataFabricacao: $dataFabricacao, dataValidade: $dataValidade, nroTotalFiscal: $nroTotalFiscal, precoNotaFiscal: $precoNotaFiscal, precoCusto3Albe: $precoCusto3Albe, precoVenda3Albe: $precoVenda3Albe, codEquipamentoInsumo: $codEquipamentoInsumo, codDestinoResiduos: $codDestinoResiduos, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, dataNotaFiscal: $dataNotaFiscal, tstamp: $tstamp, insumo: $insumo, destinoResiduo: $destinoResiduo, equipamento: $equipamento, usuario: $usuario, deposito: $deposito)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoMovimentoModelImplCopyWith<_$InsumoMovimentoModelImpl>
      get copyWith =>
          __$$InsumoMovimentoModelImplCopyWithImpl<_$InsumoMovimentoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoMovimentoModelImplToJson(
      this,
    );
  }
}

abstract class _InsumoMovimentoModel extends InsumoMovimentoModel {
  factory _InsumoMovimentoModel(
      {int? cod,
      int? codInsumo,
      int? codBarra,
      int? codUsuario,
      String? flagEntradaSaida,
      int? codDeposito,
      DateTime? dataHora,
      double? quantidade,
      String? lote,
      DateTime? dataFabricacao,
      DateTime? dataValidade,
      String? nroTotalFiscal,
      double? precoNotaFiscal,
      double? precoCusto3Albe,
      double? precoVenda3Albe,
      int? codEquipamentoInsumo,
      int? codDestinoResiduos,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      DateTime? dataNotaFiscal,
      @JsonKey(name: 'tStamp') String? tstamp,
      InsumoModel? insumo,
      DestinoResiduoModel? destinoResiduo,
      EquipamentoModel? equipamento,
      UsuarioModel? usuario,
      DepositoInsumoModel? deposito}) = _$InsumoMovimentoModelImpl;
  _InsumoMovimentoModel._() : super._();

  factory _InsumoMovimentoModel.fromJson(Map<String, dynamic> json) =
      _$InsumoMovimentoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  int? get codBarra;
  set codBarra(int? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  String? get flagEntradaSaida;
  set flagEntradaSaida(String? value);
  @override
  int? get codDeposito;
  set codDeposito(int? value);
  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  double? get quantidade;
  set quantidade(double? value);
  @override
  String? get lote;
  set lote(String? value);
  @override
  DateTime? get dataFabricacao;
  set dataFabricacao(DateTime? value);
  @override
  DateTime? get dataValidade;
  set dataValidade(DateTime? value);
  @override
  String? get nroTotalFiscal;
  set nroTotalFiscal(String? value);
  @override
  double? get precoNotaFiscal;
  set precoNotaFiscal(double? value);
  @override
  double? get precoCusto3Albe;
  set precoCusto3Albe(double? value);
  @override
  double? get precoVenda3Albe;
  set precoVenda3Albe(double? value);
  @override
  int? get codEquipamentoInsumo;
  set codEquipamentoInsumo(int? value);
  @override
  int? get codDestinoResiduos;
  set codDestinoResiduos(int? value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  DateTime? get dataNotaFiscal;
  set dataNotaFiscal(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  InsumoModel? get insumo;
  set insumo(InsumoModel? value);
  @override
  DestinoResiduoModel? get destinoResiduo;
  set destinoResiduo(DestinoResiduoModel? value);
  @override
  EquipamentoModel? get equipamento;
  set equipamento(EquipamentoModel? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  DepositoInsumoModel? get deposito;
  set deposito(DepositoInsumoModel? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoMovimentoModelImplCopyWith<_$InsumoMovimentoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
