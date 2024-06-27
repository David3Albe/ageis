// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selecao_kit_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelecaoKitItemModelImpl _$$SelecaoKitItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelecaoKitItemModelImpl(
      cod: (json['cod'] as num).toInt(),
      tipoSelecao: (json['tipoSelecao'] as num).toInt(),
      decisao: (json['decisao'] as num?)?.toInt(),
      mensagem: json['mensagem'] as String?,
    );

Map<String, dynamic> _$$SelecaoKitItemModelImplToJson(
        _$SelecaoKitItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'tipoSelecao': instance.tipoSelecao,
      'decisao': instance.decisao,
      'mensagem': instance.mensagem,
    };
