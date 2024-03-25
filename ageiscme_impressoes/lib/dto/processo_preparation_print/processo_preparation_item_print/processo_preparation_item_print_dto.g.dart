// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'processo_preparation_item_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoPreparationItemPrintDTOImpl
    _$$ProcessoPreparationItemPrintDTOImplFromJson(Map json) =>
        _$ProcessoPreparationItemPrintDTOImpl(
          nome: json['nome'] as String,
          nomeProprietario: json['nomeProprietario'] as String,
          nomeProcesso: json['nomeProcesso'] as String,
          validadeEmbalagem: json['validadeEmbalagem'] as int,
          tagId: json['tagId'] as String,
          urgency: json['urgency'] as bool,
          ordemLeitura: json['ordemLeitura'] as int,
        );

Map<String, dynamic> _$$ProcessoPreparationItemPrintDTOImplToJson(
        _$ProcessoPreparationItemPrintDTOImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'nomeProprietario': instance.nomeProprietario,
      'nomeProcesso': instance.nomeProcesso,
      'validadeEmbalagem': instance.validadeEmbalagem,
      'tagId': instance.tagId,
      'urgency': instance.urgency,
      'ordemLeitura': instance.ordemLeitura,
    };
