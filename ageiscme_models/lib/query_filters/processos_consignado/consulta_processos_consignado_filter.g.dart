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
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codItemDescritor: json['codItemDescritor'] as int?,
          codItemConsignado: json['codItemConsignado'] as int?,
          codProprietario: json['codProprietario'] as int?,
          consignado: json['consignado'] as bool?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosConsignadoFilterImplToJson(
        _$ConsultaProcessosConsignadoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codItemDescritor': instance.codItemDescritor,
      'codItemConsignado': instance.codItemConsignado,
      'codProprietario': instance.codProprietario,
      'consignado': instance.consignado,
      'item': instance.item?.toJson(),
    };
