// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_cancelamento_preparo_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl
    _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplFromJson(
            Map json) =>
        _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl(
          leituras: (json['leituras'] as List<dynamic>)
              .map((e) =>
                  ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO
                      .fromJson(Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String,
    dynamic> _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplToJson(
        _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'leituras': instance.leituras.map((e) => e.toJson()).toList(),
    };
