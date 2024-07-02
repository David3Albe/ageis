// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'monitoring_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringPrintDTOImpl _$$MonitoringPrintDTOImplFromJson(Map json) =>
    _$MonitoringPrintDTOImpl(
      cod: (json['cod'] as num).toInt(),
      companyCod: (json['companyCod'] as num).toInt(),
      companyName: json['companyName'] as String,
      dataAtual: DateTime.parse(json['dataAtual'] as String),
      userName: json['userName'] as String,
      serviceTypeName: json['serviceTypeName'] as String,
      userDocClasse: json['userDocClasse'] as String?,
      equipamentCod: json['equipamentCod'] as String?,
      equipamentName: json['equipamentName'] as String?,
      itemCod: json['itemCod'] as String?,
      itemName: json['itemName'] as String?,
    );

Map<String, dynamic> _$$MonitoringPrintDTOImplToJson(
        _$MonitoringPrintDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'companyCod': instance.companyCod,
      'companyName': instance.companyName,
      'dataAtual': instance.dataAtual.toIso8601String(),
      'userName': instance.userName,
      'serviceTypeName': instance.serviceTypeName,
      'userDocClasse': instance.userDocClasse,
      'equipamentCod': instance.equipamentCod,
      'equipamentName': instance.equipamentName,
      'itemCod': instance.itemCod,
      'itemName': instance.itemName,
    };
