// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_anormalidade_materiais_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaAnormalidadeMateriaisFilterImpl
    _$$ConsultaAnormalidadeMateriaisFilterImplFromJson(Map json) =>
        _$ConsultaAnormalidadeMateriaisFilterImpl(
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
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
          gridModel: json['gridModel'] == null
              ? null
              : PlutoGridApiModel.fromJson(
                  Map<String, Object?>.from(json['gridModel'] as Map)),
        );

Map<String, dynamic> _$$ConsultaAnormalidadeMateriaisFilterImplToJson(
        _$ConsultaAnormalidadeMateriaisFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codBarraKitContem': instance.codBarraKitContem,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'gridModel': instance.gridModel?.toJson(),
    };
