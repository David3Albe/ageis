// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direito_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DireitoModelImpl _$$DireitoModelImplFromJson(Map json) => _$DireitoModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      tipo: json['tipo'] as String?,
      codEtapaProcesso: json['codEtapaProcesso'] as int?,
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$DireitoModelImplToJson(_$DireitoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'tStamp': instance.tstamp,
    };
