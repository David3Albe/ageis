// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_liberar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeLiberarDTOImpl _$$AnormalidadeLiberarDTOImplFromJson(Map json) =>
    _$AnormalidadeLiberarDTOImpl(
      cod: (json['cod'] as num).toInt(),
      tstamp: json['tstamp'] as String,
      observacaoLiberacao: json['observacaoLiberacao'] as String,
    );

Map<String, dynamic> _$$AnormalidadeLiberarDTOImplToJson(
        _$AnormalidadeLiberarDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'tstamp': instance.tstamp,
      'observacaoLiberacao': instance.observacaoLiberacao,
    };
