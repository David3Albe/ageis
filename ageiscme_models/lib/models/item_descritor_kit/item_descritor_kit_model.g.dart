// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorKitModelImpl _$$ItemDescritorKitModelImplFromJson(Map json) =>
    _$ItemDescritorKitModelImpl(
      cod: json['cod'] as int?,
      codDescritorKit: json['codDescritorKit'] as int?,
      codDescritorItem: json['codDescritorItem'] as int?,
      quantidade: json['quantidade'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      kitDescritor: json['kitDescritor'] == null
          ? null
          : KitDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['kitDescritor'] as Map)),
      itemDescritor: json['itemDescritor'] == null
          ? null
          : ItemDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['itemDescritor'] as Map)),
    );

Map<String, dynamic> _$$ItemDescritorKitModelImplToJson(
        _$ItemDescritorKitModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codDescritorKit': instance.codDescritorKit,
      'codDescritorItem': instance.codDescritorItem,
      'quantidade': instance.quantidade,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'kitDescritor': instance.kitDescritor?.toJson(),
      'itemDescritor': instance.itemDescritor?.toJson(),
    };
