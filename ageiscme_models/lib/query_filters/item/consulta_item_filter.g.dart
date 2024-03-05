// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemFilterImpl _$$ConsultaItemFilterImplFromJson(Map json) =>
    _$ConsultaItemFilterImpl(
      codItemDescritor: json['codItemDescritor'] as int?,
      codItem: json['codItem'] as int?,
      codSituacao: json['codSituacao'] as String?,
      codGrupo: json['codGrupo'] as int?,
      codKit: json['codKit'] as int?,
      codProprietario: json['codProprietario'] as int?,
      numeroPatrimonio: json['numeroPatrimonio'] as int?,
      descricaoCurtaItem: json['descricaoCurtaItem'] as String?,
      cmInicio: (json['cmInicio'] as num?)?.toDouble(),
      cmTermino: (json['cmTermino'] as num?)?.toDouble(),
      repositorio: json['repositorio'] as bool?,
      considerarRepositorio: json['considerarRepositorio'] as bool?,
      descarte: json['descarte'] as bool?,
      rotulado: json['rotulado'] as bool?,
      implantavel: json['implantavel'] as bool?,
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
    );

Map<String, dynamic> _$$ConsultaItemFilterImplToJson(
        _$ConsultaItemFilterImpl instance) =>
    <String, dynamic>{
      'codItemDescritor': instance.codItemDescritor,
      'codItem': instance.codItem,
      'codSituacao': instance.codSituacao,
      'codGrupo': instance.codGrupo,
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
      'item': instance.item?.toJson(),
    };
