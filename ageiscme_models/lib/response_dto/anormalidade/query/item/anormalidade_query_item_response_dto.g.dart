// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_query_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeQueryItemResponseDTOImpl
    _$$AnormalidadeQueryItemResponseDTOImplFromJson(Map json) =>
        _$AnormalidadeQueryItemResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          dataHora: DateTime.parse(json['dataHora'] as String),
          descricao: json['descricao'] as String,
          tstamp: json['tstamp'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          nomeItem: json['nomeItem'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          nomeAnormalidadeTipo: json['nomeAnormalidadeTipo'] as String?,
          nomeUsuarioLiberacao: json['nomeUsuarioLiberacao'] as String?,
          dataLiberacao: json['dataLiberacao'] == null
              ? null
              : DateTime.parse(json['dataLiberacao'] as String),
          nomeProcessoEtapa: json['nomeProcessoEtapa'] as String?,
        );

Map<String, dynamic> _$$AnormalidadeQueryItemResponseDTOImplToJson(
        _$AnormalidadeQueryItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataHora': instance.dataHora.toIso8601String(),
      'descricao': instance.descricao,
      'tstamp': instance.tstamp,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'nomeUsuario': instance.nomeUsuario,
      'nomeAnormalidadeTipo': instance.nomeAnormalidadeTipo,
      'nomeUsuarioLiberacao': instance.nomeUsuarioLiberacao,
      'dataLiberacao': instance.dataLiberacao?.toIso8601String(),
      'nomeProcessoEtapa': instance.nomeProcessoEtapa,
    };
