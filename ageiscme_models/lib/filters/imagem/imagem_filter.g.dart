// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagem_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImagemFilterImpl _$$ImagemFilterImplFromJson(Map json) => _$ImagemFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      identificadores: (json['identificadores'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      apenasAtivas: json['apenasAtivas'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ImagemFilterImplToJson(_$ImagemFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'identificadores': instance.identificadores,
      'apenasAtivas': instance.apenasAtivas,
      'tStamp': instance.tStamp,
    };
