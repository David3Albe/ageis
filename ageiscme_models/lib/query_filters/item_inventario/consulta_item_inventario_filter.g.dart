// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_inventario_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemInventarioFilterImpl _$$ConsultaItemInventarioFilterImplFromJson(
        Map json) =>
    _$ConsultaItemInventarioFilterImpl(
      codItemDescritor: json['codItemDescritor'] as int?,
      repositorio: json['repositorio'] as bool?,
      descartado: json['descartado'] as bool?,
      implantavel: json['implantavel'] as bool?,
      complementar: json['complementar'] as bool?,
      situacao: json['situacao'] as String?,
      codGrupoItem: json['codGrupoItem'] as int?,
      codProprietario: json['codProprietario'] as int?,
      cmInicio: (json['cmInicio'] as num?)?.toDouble(),
      cmFinal: (json['cmFinal'] as num?)?.toDouble(),
      itemDescritor: json['itemDescritor'] == null
          ? null
          : ItemDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['itemDescritor'] as Map)),
    );

Map<String, dynamic> _$$ConsultaItemInventarioFilterImplToJson(
        _$ConsultaItemInventarioFilterImpl instance) =>
    <String, dynamic>{
      'codItemDescritor': instance.codItemDescritor,
      'repositorio': instance.repositorio,
      'descartado': instance.descartado,
      'implantavel': instance.implantavel,
      'complementar': instance.complementar,
      'situacao': instance.situacao,
      'codGrupoItem': instance.codGrupoItem,
      'codProprietario': instance.codProprietario,
      'cmInicio': instance.cmInicio,
      'cmFinal': instance.cmFinal,
      'itemDescritor': instance.itemDescritor?.toJson(),
    };
