// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_devolvido_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDevolvidoFilterImpl
    _$$ConsultaProcessosLeituraDevolvidoFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDevolvidoFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codLocal: json['codLocal'] as int?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDevolvidoFilterImplToJson(
        _$ConsultaProcessosLeituraDevolvidoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codLocal': instance.codLocal,
    };
