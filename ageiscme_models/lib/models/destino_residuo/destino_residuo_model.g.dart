// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destino_residuo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DestinoResiduoModelImpl _$$DestinoResiduoModelImplFromJson(Map json) =>
    _$DestinoResiduoModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$DestinoResiduoModelImplToJson(
        _$DestinoResiduoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
