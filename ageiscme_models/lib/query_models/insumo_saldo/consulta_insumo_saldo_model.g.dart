// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_insumo_saldo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaInsumoSaldoModelImpl _$$ConsultaInsumoSaldoModelImplFromJson(
        Map json) =>
    _$ConsultaInsumoSaldoModelImpl(
      codDeposito: (json['codDeposito'] as num?)?.toInt(),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      lote: json['lote'] as String?,
      qtdeDisponivel: (json['qtdeDisponivel'] as num?)?.toDouble(),
      status: json['status'] as String?,
      dataFabricacao: json['dataFabricacao'] == null
          ? null
          : DateTime.parse(json['dataFabricacao'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      dataValidadePosAtivacao: json['dataValidadePosAtivacao'] == null
          ? null
          : DateTime.parse(json['dataValidadePosAtivacao'] as String),
      depositoInsumo: json['depositoInsumo'] == null
          ? null
          : DepositoInsumoModel.fromJson(
              Map<String, Object?>.from(json['depositoInsumo'] as Map)),
      insumo: json['insumo'] == null
          ? null
          : InsumoModel.fromJson(
              Map<String, Object?>.from(json['insumo'] as Map)),
    );

Map<String, dynamic> _$$ConsultaInsumoSaldoModelImplToJson(
        _$ConsultaInsumoSaldoModelImpl instance) =>
    <String, dynamic>{
      'codDeposito': instance.codDeposito,
      'codInsumo': instance.codInsumo,
      'lote': instance.lote,
      'qtdeDisponivel': instance.qtdeDisponivel,
      'status': instance.status,
      'dataFabricacao': instance.dataFabricacao?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'dataValidadePosAtivacao':
          instance.dataValidadePosAtivacao?.toIso8601String(),
      'depositoInsumo': instance.depositoInsumo?.toJson(),
      'insumo': instance.insumo?.toJson(),
    };
