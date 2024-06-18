// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_movimento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoMovimentoModelImpl _$$InsumoMovimentoModelImplFromJson(Map json) =>
    _$InsumoMovimentoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      codBarra: (json['codBarra'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      flagEntradaSaida: json['flagEntradaSaida'] as String?,
      codDeposito: (json['codDeposito'] as num?)?.toInt(),
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      quantidade: (json['quantidade'] as num?)?.toDouble(),
      lote: json['lote'] as String?,
      dataFabricacao: json['dataFabricacao'] == null
          ? null
          : DateTime.parse(json['dataFabricacao'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      nroTotalFiscal: json['nroTotalFiscal'] as String?,
      precoNotaFiscal: (json['precoNotaFiscal'] as num?)?.toDouble(),
      precoCusto3Albe: (json['precoCusto3Albe'] as num?)?.toDouble(),
      precoVenda3Albe: (json['precoVenda3Albe'] as num?)?.toDouble(),
      codEquipamentoInsumo: (json['codEquipamentoInsumo'] as num?)?.toInt(),
      codDestinoResiduos: (json['codDestinoResiduos'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      dataNotaFiscal: json['dataNotaFiscal'] == null
          ? null
          : DateTime.parse(json['dataNotaFiscal'] as String),
      tstamp: json['tStamp'] as String?,
      insumo: json['insumo'] == null
          ? null
          : InsumoModel.fromJson(
              Map<String, Object?>.from(json['insumo'] as Map)),
      destinoResiduo: json['destinoResiduo'] == null
          ? null
          : DestinoResiduoModel.fromJson(
              Map<String, Object?>.from(json['destinoResiduo'] as Map)),
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      deposito: json['deposito'] == null
          ? null
          : DepositoInsumoModel.fromJson(
              Map<String, Object?>.from(json['deposito'] as Map)),
    );

Map<String, dynamic> _$$InsumoMovimentoModelImplToJson(
        _$InsumoMovimentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInsumo': instance.codInsumo,
      'codBarra': instance.codBarra,
      'codUsuario': instance.codUsuario,
      'flagEntradaSaida': instance.flagEntradaSaida,
      'codDeposito': instance.codDeposito,
      'dataHora': instance.dataHora?.toIso8601String(),
      'quantidade': instance.quantidade,
      'lote': instance.lote,
      'dataFabricacao': instance.dataFabricacao?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'nroTotalFiscal': instance.nroTotalFiscal,
      'precoNotaFiscal': instance.precoNotaFiscal,
      'precoCusto3Albe': instance.precoCusto3Albe,
      'precoVenda3Albe': instance.precoVenda3Albe,
      'codEquipamentoInsumo': instance.codEquipamentoInsumo,
      'codDestinoResiduos': instance.codDestinoResiduos,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'dataNotaFiscal': instance.dataNotaFiscal?.toIso8601String(),
      'tStamp': instance.tstamp,
      'insumo': instance.insumo?.toJson(),
      'destinoResiduo': instance.destinoResiduo?.toJson(),
      'equipamento': instance.equipamento?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'deposito': instance.deposito?.toJson(),
    };
