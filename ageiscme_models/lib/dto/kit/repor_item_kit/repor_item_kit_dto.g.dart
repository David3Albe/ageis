// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repor_item_kit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReporItemKitDTOImpl _$$ReporItemKitDTOImplFromJson(Map json) =>
    _$ReporItemKitDTOImpl(
      codKit: (json['codKit'] as num).toInt(),
      codBarraItem: json['codBarraItem'] as String?,
      codMotivo: (json['codMotivo'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReporItemKitDTOImplToJson(
        _$ReporItemKitDTOImpl instance) =>
    <String, dynamic>{
      'codKit': instance.codKit,
      'codBarraItem': instance.codBarraItem,
      'codMotivo': instance.codMotivo,
      'codUsuario': instance.codUsuario,
    };
