// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_consignado_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConsignadoBaseModelImpl _$$ItemConsignadoBaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemConsignadoBaseModelImpl(
      tipoAcesso: (json['tipoAcesso'] as num).toInt(),
      preparo: json['preparo'] as bool? ?? false,
    );

Map<String, dynamic> _$$ItemConsignadoBaseModelImplToJson(
        _$ItemConsignadoBaseModelImpl instance) =>
    <String, dynamic>{
      'tipoAcesso': instance.tipoAcesso,
      'preparo': instance.preparo,
    };
