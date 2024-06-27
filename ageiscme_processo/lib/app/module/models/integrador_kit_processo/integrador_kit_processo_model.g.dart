// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrador_kit_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntegradorKitProcessoModelImpl _$$IntegradorKitProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IntegradorKitProcessoModelImpl(
      solicitouIntegradorKit: json['solicitouIntegradorKit'] as bool?,
      utilizouIntegradorKit: json['utilizouIntegradorKit'] as bool?,
      codKit: (json['codKit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$IntegradorKitProcessoModelImplToJson(
        _$IntegradorKitProcessoModelImpl instance) =>
    <String, dynamic>{
      'solicitouIntegradorKit': instance.solicitouIntegradorKit,
      'utilizouIntegradorKit': instance.utilizouIntegradorKit,
      'codKit': instance.codKit,
    };
