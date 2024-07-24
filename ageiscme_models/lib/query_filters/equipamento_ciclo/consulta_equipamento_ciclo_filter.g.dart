// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_equipamento_ciclo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEquipamentoCicloFilterImpl
    _$$ConsultaEquipamentoCicloFilterImplFromJson(Map json) =>
        _$ConsultaEquipamentoCicloFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          indicador: json['indicador'] as String?,
          detalhar: json['detalhar'] as bool?,
          codProcessos: (json['codProcessos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          codEquipamentos: (json['codEquipamentos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$$ConsultaEquipamentoCicloFilterImplToJson(
        _$ConsultaEquipamentoCicloFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'indicador': instance.indicador,
      'detalhar': instance.detalhar,
      'codProcessos': instance.codProcessos,
      'codEquipamentos': instance.codEquipamentos,
    };
