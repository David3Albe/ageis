// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_short_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaShortResponseDTOImpl _$$SiglaShortResponseDTOImplFromJson(Map json) =>
    _$SiglaShortResponseDTOImpl(
      cod: json['cod'] as int,
      descricao: json['descricao'] as String,
      sigla: json['sigla'] as String,
      corRGB: json['corRGB'] as int?,
    );

Map<String, dynamic> _$$SiglaShortResponseDTOImplToJson(
        _$SiglaShortResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'sigla': instance.sigla,
      'corRGB': instance.corRGB,
    };
