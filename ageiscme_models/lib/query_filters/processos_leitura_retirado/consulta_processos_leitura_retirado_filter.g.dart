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
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codItem: json['codItem'] as int?,
          codKit: json['codKit'] as int?,
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
      'finalDate': instance.finalDate?.toIso8601String(),
      'codItem': instance.codItem,
      'codKit': instance.codKit,
      'codLocal': instance.codLocal,
      'rotulado': instance.rotulado,
      'item': instance.item?.toJson(),
    };
