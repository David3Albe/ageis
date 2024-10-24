// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemSaveDTOImpl _$$ItemSaveDTOImplFromJson(Map json) => _$ItemSaveDTOImpl(
      atualizarTodosItensZ: json['atualizarTodosItensZ'] as bool?,
      item: ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
    );

Map<String, dynamic> _$$ItemSaveDTOImplToJson(_$ItemSaveDTOImpl instance) =>
    <String, dynamic>{
      'atualizarTodosItensZ': instance.atualizarTodosItensZ,
      'item': instance.item.toJson(),
    };
