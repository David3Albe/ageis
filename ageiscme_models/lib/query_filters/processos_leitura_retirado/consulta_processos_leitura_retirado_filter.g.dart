// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_retirado_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraRetiradoFilterImpl
    _$$ConsultaProcessosLeituraRetiradoFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraRetiradoFilterImpl(
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
          codItem: json['codItem'] as int?,
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codKit: json['codKit'] as int?,
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codLocal: json['codLocal'] as int?,
          rotulado: json['rotulado'] as bool?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraRetiradoFilterImplToJson(
        _$ConsultaProcessosLeituraRetiradoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codKit': instance.codKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'codLocal': instance.codLocal,
      'rotulado': instance.rotulado,
      'item': instance.item?.toJson(),
    };
