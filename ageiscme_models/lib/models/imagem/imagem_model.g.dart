// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImagemModelImpl _$$ImagemModelImplFromJson(Map json) => _$ImagemModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      identificadorImagem: json['identificadorImagem'] as String?,
      nomeFoto: json['nomeFoto'] as String?,
      foto: json['foto'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ImagemModelImplToJson(_$ImagemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'identificadorImagem': instance.identificadorImagem,
      'nomeFoto': instance.nomeFoto,
      'foto': instance.foto,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
