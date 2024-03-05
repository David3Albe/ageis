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
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codEquipamento: json['codEquipamento'] as int?,
      codServicosTipo: json['codServicosTipo'] as int?,
      codPeca: json['codPeca'] as int?,
      numNF: json['numNF'] as String?,
      numSerie: json['numSerie'] as String?,
      codResultado: json['codResultado'] as String?,
    );

Map<String, dynamic> _$$ConsultaManutencaoFilterImplToJson(
        _$ConsultaManutencaoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codEquipamento': instance.codEquipamento,
      'codServicosTipo': instance.codServicosTipo,
      'codPeca': instance.codPeca,
      'numNF': instance.numNF,
      'numSerie': instance.numSerie,
      'codResultado': instance.codResultado,
    };
