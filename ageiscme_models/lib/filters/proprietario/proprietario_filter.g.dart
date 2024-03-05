// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProprietarioFilterImpl _$$ProprietarioFilterImplFromJson(Map json) =>
    _$ProprietarioFilterImpl(
      cod: json['cod'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      comecaCom: json['comecaCom'] as String?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProprietarioFilterImplToJson(
        _$ProprietarioFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'comecaCom': instance.comecaCom,
      'tStamp': instance.tStamp,
    };
