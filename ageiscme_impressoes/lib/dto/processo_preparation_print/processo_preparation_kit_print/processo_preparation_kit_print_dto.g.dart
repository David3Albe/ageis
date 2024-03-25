// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'processo_preparation_kit_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoPreparationKitPrintDTOImpl
    _$$ProcessoPreparationKitPrintDTOImplFromJson(Map json) =>
        _$ProcessoPreparationKitPrintDTOImpl(
          nomeDescritor: json['nomeDescritor'] as String,
          itensLidos: json['itensLidos'] as int,
          itensTotalKit: json['itensTotalKit'] as int,
          nomeProprietario: json['nomeProprietario'] as String,
          nomeProcesso: json['nomeProcesso'] as String,
          validadeEmbalagem: json['validadeEmbalagem'] as int,
          tagId: json['tagId'] as String,
          urgency: json['urgency'] as bool,
        );

Map<String, dynamic> _$$ProcessoPreparationKitPrintDTOImplToJson(
        _$ProcessoPreparationKitPrintDTOImpl instance) =>
    <String, dynamic>{
      'nomeDescritor': instance.nomeDescritor,
      'itensLidos': instance.itensLidos,
      'itensTotalKit': instance.itensTotalKit,
      'nomeProprietario': instance.nomeProprietario,
      'nomeProcesso': instance.nomeProcesso,
      'validadeEmbalagem': instance.validadeEmbalagem,
      'tagId': instance.tagId,
      'urgency': instance.urgency,
    };
