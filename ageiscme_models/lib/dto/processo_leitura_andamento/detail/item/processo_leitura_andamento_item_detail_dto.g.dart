// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_item_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoItemDetailDTOImpl
    _$$ProcessoLeituraAndamentoItemDetailDTOImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoItemDetailDTOImpl(
          cod: (json['cod'] as num).toInt(),
          idEtiqueta: json['idEtiqueta'] as String,
          descricao: json['descricao'] as String,
          codKit: (json['codKit'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoItemDetailDTOImplToJson(
        _$ProcessoLeituraAndamentoItemDetailDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
      'codKit': instance.codKit,
    };
