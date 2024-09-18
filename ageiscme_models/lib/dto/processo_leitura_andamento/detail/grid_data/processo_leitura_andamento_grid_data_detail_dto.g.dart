// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_grid_data_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoGridDataDetailDTOImpl
    _$$ProcessoLeituraAndamentoGridDataDetailDTOImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoGridDataDetailDTOImpl(
          codKit: (json['codKit'] as num?)?.toInt(),
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiquetaItem: json['idEtiquetaItem'] as String?,
          codBarraKit: json['codBarraKit'] as String?,
          descricaoKit: json['descricaoKit'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoGridDataDetailDTOImplToJson(
        _$ProcessoLeituraAndamentoGridDataDetailDTOImpl instance) =>
    <String, dynamic>{
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'idEtiquetaItem': instance.idEtiquetaItem,
      'codBarraKit': instance.codBarraKit,
      'descricaoKit': instance.descricaoKit,
      'descricaoItem': instance.descricaoItem,
    };
