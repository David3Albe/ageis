// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_consignado_processado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConsignadoProcessadoModelImpl
    _$$ItemConsignadoProcessadoModelImplFromJson(Map json) =>
        _$ItemConsignadoProcessadoModelImpl(
          codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
          codRegistro: (json['codRegistro'] as num?)?.toInt(),
          medico: (json['medico'] as num?)?.toInt(),
          responsavelEntrega: (json['responsavelEntrega'] as num?)?.toInt(),
          responsavelRetirada: (json['responsavelRetirada'] as num?)?.toInt(),
          codUsuario: (json['codUsuario'] as num?)?.toInt(),
          DataHora: json['DataHora'] == null
              ? null
              : DateTime.parse(json['DataHora'] as String),
        );

Map<String, dynamic> _$$ItemConsignadoProcessadoModelImplToJson(
        _$ItemConsignadoProcessadoModelImpl instance) =>
    <String, dynamic>{
      'codInstituicao': instance.codInstituicao,
      'codRegistro': instance.codRegistro,
      'medico': instance.medico,
      'responsavelEntrega': instance.responsavelEntrega,
      'responsavelRetirada': instance.responsavelRetirada,
      'codUsuario': instance.codUsuario,
      'DataHora': instance.DataHora?.toIso8601String(),
    };
