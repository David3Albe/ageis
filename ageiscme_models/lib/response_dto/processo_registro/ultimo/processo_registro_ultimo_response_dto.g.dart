// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_registro_ultimo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoRegistroUltimoResponseDTOImpl
    _$$ProcessoRegistroUltimoResponseDTOImplFromJson(Map json) =>
        _$ProcessoRegistroUltimoResponseDTOImpl(
          cod: json['cod'] as int?,
          dataHoraInicio: json['dataHoraInicio'] == null
              ? null
              : DateTime.parse(json['dataHoraInicio'] as String),
          dataHoraTermino: json['dataHoraTermino'] == null
              ? null
              : DateTime.parse(json['dataHoraTermino'] as String),
          nomeEtapa: json['nomeEtapa'] as String?,
        );

Map<String, dynamic> _$$ProcessoRegistroUltimoResponseDTOImplToJson(
        _$ProcessoRegistroUltimoResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataHoraInicio': instance.dataHoraInicio?.toIso8601String(),
      'dataHoraTermino': instance.dataHoraTermino?.toIso8601String(),
      'nomeEtapa': instance.nomeEtapa,
    };
