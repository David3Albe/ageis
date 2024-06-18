// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_movimentacao_estoque_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaMovimentacaoEstoqueModelImpl
    _$$ConsultaMovimentacaoEstoqueModelImplFromJson(Map json) =>
        _$ConsultaMovimentacaoEstoqueModelImpl(
          cod: (json['cod'] as num?)?.toInt(),
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          lote: json['lote'] as String?,
          quantidade: (json['quantidade'] as num?)?.toDouble(),
          precoCusto3Albe: (json['precoCusto3Albe'] as num?)?.toDouble(),
          flagEntradaSaida: json['flagEntradaSaida'] as String?,
          insumo: json['insumo'] == null
              ? null
              : InsumoModel.fromJson(
                  Map<String, Object?>.from(json['insumo'] as Map)),
          equipamento: json['equipamento'] == null
              ? null
              : EquipamentoModel.fromJson(
                  Map<String, Object?>.from(json['equipamento'] as Map)),
          destinoResiduo: json['destinoResiduo'] == null
              ? null
              : DestinoResiduoModel.fromJson(
                  Map<String, Object?>.from(json['destinoResiduo'] as Map)),
        );

Map<String, dynamic> _$$ConsultaMovimentacaoEstoqueModelImplToJson(
        _$ConsultaMovimentacaoEstoqueModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataHora': instance.dataHora?.toIso8601String(),
      'lote': instance.lote,
      'quantidade': instance.quantidade,
      'precoCusto3Albe': instance.precoCusto3Albe,
      'flagEntradaSaida': instance.flagEntradaSaida,
      'insumo': instance.insumo?.toJson(),
      'equipamento': instance.equipamento?.toJson(),
      'destinoResiduo': instance.destinoResiduo?.toJson(),
    };
