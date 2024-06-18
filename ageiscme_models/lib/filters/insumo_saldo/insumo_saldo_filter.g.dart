// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_saldo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoSaldoFilterImpl _$$InsumoSaldoFilterImplFromJson(Map json) =>
    _$InsumoSaldoFilterImpl(
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      lote: json['lote'] as String?,
      codDeposito: (json['codDeposito'] as num?)?.toInt(),
      qtdeMaiorQueZero: json['qtdeMaiorQueZero'] as bool?,
      dataVaidadeMaiorQueAtual: json['dataVaidadeMaiorQueAtual'] as bool?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      ordenarPorDataValidadeAscendente:
          json['ordenarPorDataValidadeAscendente'] as bool?,
    );

Map<String, dynamic> _$$InsumoSaldoFilterImplToJson(
        _$InsumoSaldoFilterImpl instance) =>
    <String, dynamic>{
      'codInsumo': instance.codInsumo,
      'lote': instance.lote,
      'codDeposito': instance.codDeposito,
      'qtdeMaiorQueZero': instance.qtdeMaiorQueZero,
      'dataVaidadeMaiorQueAtual': instance.dataVaidadeMaiorQueAtual,
      'numeroRegistros': instance.numeroRegistros,
      'ordenarPorDataValidadeAscendente':
          instance.ordenarPorDataValidadeAscendente,
    };
