// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_cor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitCorModelImpl _$$KitCorModelImplFromJson(Map json) => _$KitCorModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      red: (json['red'] as num?)?.toInt(),
      green: (json['green'] as num?)?.toInt(),
      blue: (json['blue'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$KitCorModelImplToJson(_$KitCorModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
