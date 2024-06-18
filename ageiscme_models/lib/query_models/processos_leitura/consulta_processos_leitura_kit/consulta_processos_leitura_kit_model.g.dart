// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraKitModelImpl
    _$$ConsultaProcessosLeituraKitModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraKitModelImpl(
          cod: (json['cod'] as num).toInt(),
          codBarra: json['codBarra'] as String,
          nome: json['nome'] as String?,
          restricao: json['restricao'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraKitModelImplToJson(
        _$ConsultaProcessosLeituraKitModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'nome': instance.nome,
      'restricao': instance.restricao,
    };
