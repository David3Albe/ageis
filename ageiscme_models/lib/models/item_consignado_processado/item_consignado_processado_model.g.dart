// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_consignado_processado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConsignadoProcessadoModelImpl
    _$$ItemConsignadoProcessadoModelImplFromJson(Map json) =>
        _$ItemConsignadoProcessadoModelImpl(
          codInstituicao: json['codInstituicao'] as int?,
          codRegistro: json['codRegistro'] as int?,
          medico: json['medico'] as int?,
          responsavelEntrega: json['responsavelEntrega'] as int?,
          responsavelRetirada: json['responsavelRetirada'] as int?,
          codUsuario: json['codUsuario'] as int?,
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
