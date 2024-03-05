// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_registro_servico_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaRegistroServicoFilterImpl
    _$$ConsultaRegistroServicoFilterImplFromJson(Map json) =>
        _$ConsultaRegistroServicoFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codBarraItem: json['codBarraItem'] as String?,
          codEquipamento: json['codEquipamento'] as int?,
          codServicoTipo: json['codServicoTipo'] as int?,
        );

Map<String, dynamic> _$$ConsultaRegistroServicoFilterImplToJson(
        _$ConsultaRegistroServicoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codBarraItem': instance.codBarraItem,
      'codEquipamento': instance.codEquipamento,
      'codServicoTipo': instance.codServicoTipo,
    };
