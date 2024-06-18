// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_consignado_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosConsignadoFilterImpl
    _$$ConsultaProcessosConsignadoFilterImplFromJson(Map json) =>
        _$ConsultaProcessosConsignadoFilterImpl(
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
          codItemDescritor: (json['codItemDescritor'] as num?)?.toInt(),
          codItemConsignado: (json['codItemConsignado'] as num?)?.toInt(),
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codProprietario: (json['codProprietario'] as num?)?.toInt(),
          consignado: json['consignado'] as bool?,
          itemDescritor: json['itemDescritor'] == null
              ? null
              : ItemDescritorDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['itemDescritor'] as Map)),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosConsignadoFilterImplToJson(
        _$ConsultaProcessosConsignadoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codItemDescritor': instance.codItemDescritor,
      'codItemConsignado': instance.codItemConsignado,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codProprietario': instance.codProprietario,
      'consignado': instance.consignado,
      'itemDescritor': instance.itemDescritor?.toJson(),
      'item': instance.item?.toJson(),
    };
