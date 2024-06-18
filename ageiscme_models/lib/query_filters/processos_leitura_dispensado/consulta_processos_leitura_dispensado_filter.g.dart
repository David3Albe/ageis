// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_dispensado_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDispensadoFilterImpl
    _$$ConsultaProcessosLeituraDispensadoFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDispensadoFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codKit: (json['codKit'] as num?)?.toInt(),
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codLocal: (json['codLocal'] as num?)?.toInt(),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDispensadoFilterImplToJson(
        _$ConsultaProcessosLeituraDispensadoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codKit': instance.codKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'codLocal': instance.codLocal,
      'item': instance.item?.toJson(),
    };
