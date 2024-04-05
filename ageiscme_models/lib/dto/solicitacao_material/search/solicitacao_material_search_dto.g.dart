// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialSearchDTOImpl _$$SolicitacaoMaterialSearchDTOImplFromJson(
        Map json) =>
    _$SolicitacaoMaterialSearchDTOImpl(
      cod: json['cod'] as int?,
      apenasPendentes: json['apenasPendentes'] as bool?,
      apenasAutorizados: json['apenasAutorizados'] as bool?,
      apenasEntregues: json['apenasEntregues'] as bool?,
      apenasNaoAutorizados: json['apenasNaoAutorizados'] as bool?,
      numeroRegistros: json['numeroRegistros'] as int?,
      ordenarPeloCodigoDecrescente:
          json['ordenarPeloCodigoDecrescente'] as bool?,
    );

Map<String, dynamic> _$$SolicitacaoMaterialSearchDTOImplToJson(
        _$SolicitacaoMaterialSearchDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasPendentes': instance.apenasPendentes,
      'apenasAutorizados': instance.apenasAutorizados,
      'apenasEntregues': instance.apenasEntregues,
      'apenasNaoAutorizados': instance.apenasNaoAutorizados,
      'numeroRegistros': instance.numeroRegistros,
      'ordenarPeloCodigoDecrescente': instance.ordenarPeloCodigoDecrescente,
    };
