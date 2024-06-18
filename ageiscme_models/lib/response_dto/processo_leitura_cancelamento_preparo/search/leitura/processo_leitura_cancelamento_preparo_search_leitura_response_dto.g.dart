// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOImpl
    _$$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOImplFromJson(
            Map json) =>
        _$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOImpl(
          codRegistroProcesso: (json['codRegistroProcesso'] as num).toInt(),
          codProcessoLeitura: (json['codProcessoLeitura'] as num).toInt(),
          preparo: json['preparo'] as bool,
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codItem: (json['codItem'] as num?)?.toInt(),
          nomeItem: json['nomeItem'] as String?,
          codBarraItem: json['codBarraItem'] as String?,
          codKit: (json['codKit'] as num?)?.toInt(),
          nomeKit: json['nomeKit'] as String?,
          codBarraKit: json['codBarraKit'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          nomeEmbalagem: json['nomeEmbalagem'] as String?,
          codEtapa: (json['codEtapa'] as num?)?.toInt(),
          nomeEtapa: json['nomeEtapa'] as String?,
        );

Map<String, dynamic>
    _$$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOImplToJson(
            _$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOImpl
                instance) =>
        <String, dynamic>{
          'codRegistroProcesso': instance.codRegistroProcesso,
          'codProcessoLeitura': instance.codProcessoLeitura,
          'preparo': instance.preparo,
          'dataHora': instance.dataHora?.toIso8601String(),
          'codItem': instance.codItem,
          'nomeItem': instance.nomeItem,
          'codBarraItem': instance.codBarraItem,
          'codKit': instance.codKit,
          'nomeKit': instance.nomeKit,
          'codBarraKit': instance.codBarraKit,
          'nomeUsuario': instance.nomeUsuario,
          'nomeEmbalagem': instance.nomeEmbalagem,
          'codEtapa': instance.codEtapa,
          'nomeEtapa': instance.nomeEtapa,
        };
