// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_instituicao_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalInstituicaoFilterImpl _$$LocalInstituicaoFilterImplFromJson(Map json) =>
    _$LocalInstituicaoFilterImpl(
      cod: json['cod'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$LocalInstituicaoFilterImplToJson(
        _$LocalInstituicaoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInstituicao': instance.codInstituicao,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'tStamp': instance.tStamp,
    };
