// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'processo_preparation_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoPreparationPrintDTOImpl _$$ProcessoPreparationPrintDTOImplFromJson(
        Map json) =>
    _$ProcessoPreparationPrintDTOImpl(
      companyName: json['companyName'] as String,
      actualTime: DateTime.parse(json['actualTime'] as String),
      userName: json['userName'] as String,
      userDoc: json['userDoc'] as String?,
      kits: (json['kits'] as List<dynamic>)
          .map((e) => ProcessoPreparationKitPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ProcessoPreparationItemPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ProcessoPreparationPrintDTOImplToJson(
        _$ProcessoPreparationPrintDTOImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'actualTime': instance.actualTime.toIso8601String(),
      'userName': instance.userName,
      'userDoc': instance.userDoc,
      'kits': instance.kits.map((e) => e.toJson()).toList(),
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };
