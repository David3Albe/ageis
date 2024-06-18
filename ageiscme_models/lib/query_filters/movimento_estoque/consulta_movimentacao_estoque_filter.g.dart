// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_movimentacao_estoque_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaMovimentacaoEstoqueFilterImpl
    _$$ConsultaMovimentacaoEstoqueFilterImplFromJson(Map json) =>
        _$ConsultaMovimentacaoEstoqueFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          codDeposito: (json['codDeposito'] as num?)?.toInt(),
          codInsumo: (json['codInsumo'] as num?)?.toInt(),
          lote: json['lote'] as String?,
          nroNotaFiscal: json['nroNotaFiscal'] as String?,
        );

Map<String, dynamic> _$$ConsultaMovimentacaoEstoqueFilterImplToJson(
        _$ConsultaMovimentacaoEstoqueFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codDeposito': instance.codDeposito,
      'codInsumo': instance.codInsumo,
      'lote': instance.lote,
      'nroNotaFiscal': instance.nroNotaFiscal,
    };
