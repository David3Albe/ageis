// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_etiqueta_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemEtiquetaFilterImpl _$$ConsultaItemEtiquetaFilterImplFromJson(
        Map json) =>
    _$ConsultaItemEtiquetaFilterImpl(
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codProprietario: json['codProprietario'] as int?,
      codItemDescritor: json['codItemDescritor'] as int?,
      codKit: json['codKit'] as int?,
      idEtiqueta: json['idEtiqueta'] as String?,
      descartar: json['descartar'] as bool?,
    );

Map<String, dynamic> _$$ConsultaItemEtiquetaFilterImplToJson(
        _$ConsultaItemEtiquetaFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codProprietario': instance.codProprietario,
      'codItemDescritor': instance.codItemDescritor,
      'codKit': instance.codKit,
      'idEtiqueta': instance.idEtiqueta,
      'descartar': instance.descartar,
    };
