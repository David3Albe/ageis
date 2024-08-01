// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_tamanho_sub_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraTamanhoSubFilterImpl
    _$$ConsultaProcessosLeituraTamanhoSubFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraTamanhoSubFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codLocal: (json['codLocal'] as num?)?.toInt(),
          codCentroCusto: (json['codCentroCusto'] as num?)?.toInt(),
          tamanho: json['tamanho'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraTamanhoSubFilterImplToJson(
        _$ConsultaProcessosLeituraTamanhoSubFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codLocal': instance.codLocal,
      'codCentroCusto': instance.codCentroCusto,
      'tamanho': instance.tamanho,
    };
