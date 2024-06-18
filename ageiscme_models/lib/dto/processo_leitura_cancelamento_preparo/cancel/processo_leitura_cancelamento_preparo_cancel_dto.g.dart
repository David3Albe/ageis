// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_cancelamento_preparo_cancel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraCancelamentoPreparoCancelDTOImpl
    _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplFromJson(Map json) =>
        _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl(
          codigos: (json['codigos'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
          codUsuarioCancelamento:
              (json['codUsuarioCancelamento'] as num).toInt(),
        );

Map<String, dynamic> _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplToJson(
        _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl instance) =>
    <String, dynamic>{
      'codigos': instance.codigos,
      'codUsuarioCancelamento': instance.codUsuarioCancelamento,
    };
