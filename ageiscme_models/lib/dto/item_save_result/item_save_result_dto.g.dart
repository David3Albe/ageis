// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_save_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemSaveResultDTOImpl _$$ItemSaveResultDTOImplFromJson(Map json) =>
    _$ItemSaveResultDTOImpl(
      item: ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      impressaoConsignado: json['impressaoConsignado'] as String?,
    );

Map<String, dynamic> _$$ItemSaveResultDTOImplToJson(
        _$ItemSaveResultDTOImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'impressaoConsignado': instance.impressaoConsignado,
    };
