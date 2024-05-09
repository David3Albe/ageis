// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_movimento_drop_down_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoMovimentoDropDownSearchResponseDTOImpl
    _$$InsumoMovimentoDropDownSearchResponseDTOImplFromJson(Map json) =>
        _$InsumoMovimentoDropDownSearchResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          flagEntradaSaida: json['flagEntradaSaida'] as String?,
          nomeInsumo: json['nomeInsumo'] as String?,
          lote: json['lote'] as String?,
          data: json['data'] == null
              ? null
              : DateTime.parse(json['data'] as String),
        );

Map<String, dynamic> _$$InsumoMovimentoDropDownSearchResponseDTOImplToJson(
        _$InsumoMovimentoDropDownSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'flagEntradaSaida': instance.flagEntradaSaida,
      'nomeInsumo': instance.nomeInsumo,
      'lote': instance.lote,
      'data': instance.data?.toIso8601String(),
    };
