// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_saldo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoSaldoModelImpl _$$InsumoSaldoModelImplFromJson(Map json) =>
    _$InsumoSaldoModelImpl(
      cod: json['cod'] as int?,
      codInsumo: json['codInsumo'] as int?,
      codDeposito: json['codDeposito'] as int?,
      qtdeDisponivel: (json['qtdeDisponivel'] as num?)?.toDouble(),
      lote: json['lote'] as String?,
      codBarra: json['codBarra'] as int?,
      dataFabricacao: json['dataFabricacao'] == null
          ? null
          : DateTime.parse(json['dataFabricacao'] as String),
      dataValidadePosAtividade: json['dataValidadePosAtividade'] == null
          ? null
          : DateTime.parse(json['dataValidadePosAtividade'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      status: json['status'] as String?,
      precoUnVendaMedio: (json['precoUnVendaMedio'] as num?)?.toDouble(),
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      depositoInsumo: json['depositoInsumo'] == null
          ? null
          : DepositoInsumoModel.fromJson(
              Map<String, Object?>.from(json['depositoInsumo'] as Map)),
      insumo: json['insumo'] == null
          ? null
          : InsumoModel.fromJson(
              Map<String, Object?>.from(json['insumo'] as Map)),
    );

Map<String, dynamic> _$$InsumoSaldoModelImplToJson(
        _$InsumoSaldoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInsumo': instance.codInsumo,
      'codDeposito': instance.codDeposito,
      'qtdeDisponivel': instance.qtdeDisponivel,
      'lote': instance.lote,
      'codBarra': instance.codBarra,
      'dataFabricacao': instance.dataFabricacao?.toIso8601String(),
      'dataValidadePosAtividade':
          instance.dataValidadePosAtividade?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'status': instance.status,
      'precoUnVendaMedio': instance.precoUnVendaMedio,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'depositoInsumo': instance.depositoInsumo?.toJson(),
      'insumo': instance.insumo?.toJson(),
    };
