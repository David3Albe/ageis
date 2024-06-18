// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_manutencao_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaManutencaoFilterImpl _$$ConsultaManutencaoFilterImplFromJson(
        Map json) =>
    _$ConsultaManutencaoFilterImpl(
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
      codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
      codServicosTipo: (json['codServicosTipo'] as num?)?.toInt(),
      codPeca: (json['codPeca'] as num?)?.toInt(),
      numNF: json['numNF'] as String?,
      numSerie: json['numSerie'] as String?,
      codResultado: json['codResultado'] as String?,
      apenasSemTermino: json['apenasSemTermino'] as bool?,
    );

Map<String, dynamic> _$$ConsultaManutencaoFilterImplToJson(
        _$ConsultaManutencaoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codEquipamento': instance.codEquipamento,
      'codServicosTipo': instance.codServicosTipo,
      'codPeca': instance.codPeca,
      'numNF': instance.numNF,
      'numSerie': instance.numSerie,
      'codResultado': instance.codResultado,
      'apenasSemTermino': instance.apenasSemTermino,
    };
