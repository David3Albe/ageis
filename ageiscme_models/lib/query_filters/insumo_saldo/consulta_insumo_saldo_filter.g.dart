// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_insumo_saldo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaInsumoSaldoFilterImpl _$$ConsultaInsumoSaldoFilterImplFromJson(
        Map json) =>
    _$ConsultaInsumoSaldoFilterImpl(
      codInsumo: json['codInsumo'] as int?,
      codDeposito: json['codDeposito'] as int?,
      semSaldo: json['semSaldo'] as bool?,
      situacao: json['situacao'] as String?,
    );

Map<String, dynamic> _$$ConsultaInsumoSaldoFilterImplToJson(
        _$ConsultaInsumoSaldoFilterImpl instance) =>
    <String, dynamic>{
      'codInsumo': instance.codInsumo,
      'codDeposito': instance.codDeposito,
      'semSaldo': instance.semSaldo,
      'situacao': instance.situacao,
    };
