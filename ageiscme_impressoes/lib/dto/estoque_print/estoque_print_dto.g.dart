// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'estoque_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstoquePrintDTOImpl _$$EstoquePrintDTOImplFromJson(Map json) =>
    _$EstoquePrintDTOImpl(
      companyName: json['companyName'] as String,
      actualTime: DateTime.parse(json['actualTime'] as String),
      nomeLocal: json['nomeLocal'] as String,
      prontuario: json['prontuario'] as String?,
      userName: json['userName'] as String,
      userDoc: json['userDoc'] as String?,
      circulante: json['circulante'] as String,
      circulanteDoc: json['circulanteDoc'] as String?,
      kits: (json['kits'] as List<dynamic>)
          .map((e) =>
              EstoqueKitPrintDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      itens: (json['itens'] as List<dynamic>)
          .map((e) =>
              EstoqueItemPrintDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EstoquePrintDTOImplToJson(
        _$EstoquePrintDTOImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'actualTime': instance.actualTime.toIso8601String(),
      'nomeLocal': instance.nomeLocal,
      'prontuario': instance.prontuario,
      'userName': instance.userName,
      'userDoc': instance.userDoc,
      'circulante': instance.circulante,
      'circulanteDoc': instance.circulanteDoc,
      'kits': instance.kits.map((e) => e.toJson()).toList(),
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };
