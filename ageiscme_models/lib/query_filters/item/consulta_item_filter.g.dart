// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemFilterImpl _$$ConsultaItemFilterImplFromJson(Map json) =>
    _$ConsultaItemFilterImpl(
      codItemDescritor: (json['codItemDescritor'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      idEtiquetaContem: json['idEtiquetaContem'] as String?,
      codSituacao: json['codSituacao'] as String?,
      codGrupo: (json['codGrupo'] as num?)?.toInt(),
      codBarraKitContem: json['codBarraKitContem'] as String?,
      codKit: (json['codKit'] as num?)?.toInt(),
      codProprietario: (json['codProprietario'] as num?)?.toInt(),
      numeroPatrimonio: (json['numeroPatrimonio'] as num?)?.toInt(),
      descricaoCurtaItem: json['descricaoCurtaItem'] as String?,
      cmInicio: (json['cmInicio'] as num?)?.toDouble(),
      cmTermino: (json['cmTermino'] as num?)?.toDouble(),
      repositorio: json['repositorio'] as bool?,
      considerarRepositorio: json['considerarRepositorio'] as bool?,
      descarte: json['descarte'] as bool?,
      rotulado: json['rotulado'] as bool?,
      implantavel: json['implantavel'] as bool?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      itemDescritor: json['itemDescritor'] == null
          ? null
          : ItemDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['itemDescritor'] as Map)),
    );

Map<String, dynamic> _$$ConsultaItemFilterImplToJson(
        _$ConsultaItemFilterImpl instance) =>
    <String, dynamic>{
      'codItemDescritor': instance.codItemDescritor,
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codSituacao': instance.codSituacao,
      'codGrupo': instance.codGrupo,
      'codBarraKitContem': instance.codBarraKitContem,
      'codKit': instance.codKit,
      'codProprietario': instance.codProprietario,
      'numeroPatrimonio': instance.numeroPatrimonio,
      'descricaoCurtaItem': instance.descricaoCurtaItem,
      'cmInicio': instance.cmInicio,
      'cmTermino': instance.cmTermino,
      'repositorio': instance.repositorio,
      'considerarRepositorio': instance.considerarRepositorio,
      'descarte': instance.descarte,
      'rotulado': instance.rotulado,
      'implantavel': instance.implantavel,
      'numeroRegistros': instance.numeroRegistros,
      'item': instance.item?.toJson(),
      'itemDescritor': instance.itemDescritor?.toJson(),
    };
