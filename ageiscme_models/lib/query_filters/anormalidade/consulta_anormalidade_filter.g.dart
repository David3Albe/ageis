// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_anormalidade_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaAnormalidadeFilterImpl _$$ConsultaAnormalidadeFilterImplFromJson(
        Map json) =>
    _$ConsultaAnormalidadeFilterImpl(
      codAnormalidadeTipo: json['codAnormalidadeTipo'] as int?,
      anormalidadeTipo: json['anormalidadeTipo'] == null
          ? null
          : AnormalidadeTipoShortResponseDTO.fromJson(
              Map<String, Object?>.from(json['anormalidadeTipo'] as Map)),
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
      idEtiquetaContem: json['idEtiquetaContem'] as String?,
      codEtapaProcesso: json['codEtapaProcesso'] as int?,
      etapa: json['etapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapa'] as Map)),
      gridModel: json['gridModel'] == null
          ? null
          : PlutoGridApiModel.fromJson(
              Map<String, Object?>.from(json['gridModel'] as Map)),
    );

Map<String, dynamic> _$$ConsultaAnormalidadeFilterImplToJson(
        _$ConsultaAnormalidadeFilterImpl instance) =>
    <String, dynamic>{
      'codAnormalidadeTipo': instance.codAnormalidadeTipo,
      'anormalidadeTipo': instance.anormalidadeTipo?.toJson(),
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'etapa': instance.etapa?.toJson(),
      'gridModel': instance.gridModel?.toJson(),
    };
