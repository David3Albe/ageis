// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atestado_saude_ocupacional_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtestadoSaudeOcupacionalFilterImpl
    _$$AtestadoSaudeOcupacionalFilterImplFromJson(Map json) =>
        _$AtestadoSaudeOcupacionalFilterImpl(
          cod: (json['cod'] as num?)?.toInt(),
          carregarUsuario: json['carregarUsuario'] as bool?,
          tStamp: json['tStamp'] as String?,
        );

Map<String, dynamic> _$$AtestadoSaudeOcupacionalFilterImplToJson(
        _$AtestadoSaudeOcupacionalFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'carregarUsuario': instance.carregarUsuario,
      'tStamp': instance.tStamp,
    };
