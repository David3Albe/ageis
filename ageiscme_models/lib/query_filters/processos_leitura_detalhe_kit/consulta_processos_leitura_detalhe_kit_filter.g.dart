// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_detalhe_kit_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDetalheKitFilterImpl
    _$$ConsultaProcessosLeituraDetalheKitFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDetalheKitFilterImpl(
          codKit: (json['codKit'] as num?)?.toInt(),
          codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
          faltantes: (json['faltantes'] as num?)?.toInt(),
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDetalheKitFilterImplToJson(
        _$ConsultaProcessosLeituraDetalheKitFilterImpl instance) =>
    <String, dynamic>{
      'codKit': instance.codKit,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'faltantes': instance.faltantes,
      'dataHora': instance.dataHora?.toIso8601String(),
    };
