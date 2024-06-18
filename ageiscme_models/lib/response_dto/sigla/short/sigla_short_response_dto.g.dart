// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_short_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaShortResponseDTOImpl _$$SiglaShortResponseDTOImplFromJson(Map json) =>
    _$SiglaShortResponseDTOImpl(
      cod: (json['cod'] as num).toInt(),
      descricao: json['descricao'] as String,
      sigla: json['sigla'] as String,
      r: (json['r'] as num?)?.toInt(),
      g: (json['g'] as num?)?.toInt(),
      b: (json['b'] as num?)?.toInt(),
      o: (json['o'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SiglaShortResponseDTOImplToJson(
        _$SiglaShortResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'sigla': instance.sigla,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'o': instance.o,
    };
