// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'moviment_input_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovimentInputPrintDTOImpl _$$MovimentInputPrintDTOImplFromJson(Map json) =>
    _$MovimentInputPrintDTOImpl(
      dataHora: DateTime.parse(json['dataHora'] as String),
      companyName: json['companyName'] as String,
      inputName: json['inputName'] as String,
      entryOut: json['entryOut'] as String,
      validity: json['validity'] == null
          ? null
          : DateTime.parse(json['validity'] as String),
      nroNotaFiscal: json['nroNotaFiscal'] as String?,
      equipamentName: json['equipamentName'] as String?,
      batch: json['batch'] as String?,
    );

Map<String, dynamic> _$$MovimentInputPrintDTOImplToJson(
        _$MovimentInputPrintDTOImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora.toIso8601String(),
      'companyName': instance.companyName,
      'inputName': instance.inputName,
      'entryOut': instance.entryOut,
      'validity': instance.validity?.toIso8601String(),
      'nroNotaFiscal': instance.nroNotaFiscal,
      'equipamentName': instance.equipamentName,
      'batch': instance.batch,
    };
