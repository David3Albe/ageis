// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno_short_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnoShortDTOImpl _$$TurnoShortDTOImplFromJson(Map json) =>
    _$TurnoShortDTOImpl(
      termoPesquisa: json['termoPesquisa'] as String?,
      numeroRegistros: (json['numeroRegistros'] as num).toInt(),
      ativosApenas: json['ativosApenas'] as bool?,
    );

Map<String, dynamic> _$$TurnoShortDTOImplToJson(_$TurnoShortDTOImpl instance) =>
    <String, dynamic>{
      'termoPesquisa': instance.termoPesquisa,
      'numeroRegistros': instance.numeroRegistros,
      'ativosApenas': instance.ativosApenas,
    };
