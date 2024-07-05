// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atestado_saude_ocupacional_exame_query_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl
    _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplFromJson(Map json) =>
        _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl(
          itens: (json['itens'] as List<dynamic>)
              .map((e) =>
                  AtestadoSaudeOcupacionalExameQueryItemResponseDTO.fromJson(
                      Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplToJson(
        _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl instance) =>
    <String, dynamic>{
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };
