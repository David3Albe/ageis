// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_search_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialSearchItemResponseDTOImpl
    _$$SolicitacaoMaterialSearchItemResponseDTOImplFromJson(Map json) =>
        _$SolicitacaoMaterialSearchItemResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          itensSolicitados: (json['itensSolicitados'] as num).toInt(),
          itensEntregues: (json['itensEntregues'] as num).toInt(),
          dataSolicitacao: DateTime.parse(json['dataSolicitacao'] as String),
          codUsuarioSolicitacao: (json['codUsuarioSolicitacao'] as num).toInt(),
          codUsuarioRecebimento:
              (json['codUsuarioRecebimento'] as num?)?.toInt(),
          codUsuarioEntrega: (json['codUsuarioEntrega'] as num?)?.toInt(),
          dataEntrega: json['dataEntrega'] == null
              ? null
              : DateTime.parse(json['dataEntrega'] as String),
          codUsuarioAutorizacao:
              (json['codUsuarioAutorizacao'] as num?)?.toInt(),
          dataAutorizacao: json['dataAutorizacao'] == null
              ? null
              : DateTime.parse(json['dataAutorizacao'] as String),
        );

Map<String, dynamic> _$$SolicitacaoMaterialSearchItemResponseDTOImplToJson(
        _$SolicitacaoMaterialSearchItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'itensSolicitados': instance.itensSolicitados,
      'itensEntregues': instance.itensEntregues,
      'dataSolicitacao': instance.dataSolicitacao.toIso8601String(),
      'codUsuarioSolicitacao': instance.codUsuarioSolicitacao,
      'codUsuarioRecebimento': instance.codUsuarioRecebimento,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
      'dataEntrega': instance.dataEntrega?.toIso8601String(),
      'codUsuarioAutorizacao': instance.codUsuarioAutorizacao,
      'dataAutorizacao': instance.dataAutorizacao?.toIso8601String(),
    };
