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
      codProprietario: (json['codProprietario'] as num?)?.toInt(),
      codItemDescritor: (json['codItemDescritor'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      idEtiqueta: json['idEtiqueta'] as String?,
      descartar: json['descartar'] as bool?,
      codBarraKitContem: json['codBarraKitContem'] as String?,
      itemDescritor: json['itemDescritor'] == null
          ? null
          : ItemDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['itemDescritor'] as Map)),
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
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
      'codBarraKitContem': instance.codBarraKitContem,
      'itemDescritor': instance.itemDescritor?.toJson(),
      'numeroRegistros': instance.numeroRegistros,
    };
