// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atestado_saude_ocupacional_exame_query_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtestadoSaudeOcupacionalExameQueryItemResponseDTOImpl
    _$$AtestadoSaudeOcupacionalExameQueryItemResponseDTOImplFromJson(
            Map json) =>
        _$AtestadoSaudeOcupacionalExameQueryItemResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          tstamp: json['tstamp'] as String,
          exame: json['exame'] as String,
          dataRealizacao: DateTime.parse(json['dataRealizacao'] as String),
        );

Map<String, dynamic>
    _$$AtestadoSaudeOcupacionalExameQueryItemResponseDTOImplToJson(
            _$AtestadoSaudeOcupacionalExameQueryItemResponseDTOImpl instance) =>
        <String, dynamic>{
          'cod': instance.cod,
          'tstamp': instance.tstamp,
          'exame': instance.exame,
          'dataRealizacao': instance.dataRealizacao.toIso8601String(),
        };
