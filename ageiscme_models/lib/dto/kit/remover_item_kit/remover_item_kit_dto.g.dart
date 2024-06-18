// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remover_item_kit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoverItemKitDTOImpl _$$RemoverItemKitDTOImplFromJson(Map json) =>
    _$RemoverItemKitDTOImpl(
      codKit: (json['codKit'] as num).toInt(),
      codBarraItem: json['codBarraItem'] as String?,
      codMotivo: (json['codMotivo'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RemoverItemKitDTOImplToJson(
        _$RemoverItemKitDTOImpl instance) =>
    <String, dynamic>{
      'codKit': instance.codKit,
      'codBarraItem': instance.codBarraItem,
      'codMotivo': instance.codMotivo,
      'codUsuario': instance.codUsuario,
    };
