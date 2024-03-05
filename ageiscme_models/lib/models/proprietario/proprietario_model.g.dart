// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProprietarioModelImpl _$$ProprietarioModelImplFromJson(Map json) =>
    _$ProprietarioModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      contato: json['contato'] as String?,
      codBarra: json['codBarra'] as int?,
      manutencaoLiberada: json['manutencaoLiberada'] as bool?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      proprietariosLocais: (json['proprietariosLocais'] as List<dynamic>?)
          ?.map((e) => ProprietarioLocalModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      proprietariosArsenais: (json['proprietariosArsenais'] as List<dynamic>?)
          ?.map((e) => ProprietarioArsenalModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ProprietarioModelImplToJson(
        _$ProprietarioModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'contato': instance.contato,
      'codBarra': instance.codBarra,
      'manutencaoLiberada': instance.manutencaoLiberada,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'proprietariosLocais':
          instance.proprietariosLocais?.map((e) => e.toJson()).toList(),
      'proprietariosArsenais':
          instance.proprietariosArsenais?.map((e) => e.toJson()).toList(),
    };
