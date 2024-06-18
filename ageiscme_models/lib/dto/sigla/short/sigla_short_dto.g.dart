// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaShortDTOImpl _$$SiglaShortDTOImplFromJson(Map json) =>
    _$SiglaShortDTOImpl(
      termoPesquisa: json['termoPesquisa'] as String?,
      numeroRegistros: (json['numeroRegistros'] as num).toInt(),
      ativosApenas: json['ativosApenas'] as bool?,
    );

Map<String, dynamic> _$$SiglaShortDTOImplToJson(_$SiglaShortDTOImpl instance) =>
    <String, dynamic>{
      'termoPesquisa': instance.termoPesquisa,
      'numeroRegistros': instance.numeroRegistros,
      'ativosApenas': instance.ativosApenas,
    };
