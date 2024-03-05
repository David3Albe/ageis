// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaKitModelImpl _$$ConsultaKitModelImplFromJson(Map json) =>
    _$ConsultaKitModelImpl(
      cod: json['cod'] as int?,
      codBarra: json['codBarra'] as String?,
      nomeKitDescritor: json['nomeKitDescritor'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      tamanhoKit: json['tamanhoKit'] as String?,
      grupo: json['grupo'] as String?,
      qtdeItensFisico: json['qtdeItensFisico'] as int?,
      nomeCor1: json['nomeCor1'] as String?,
      nomeCor2: json['nomeCor2'] as String?,
      nomeCor3: json['nomeCor3'] as String?,
      nomeCor4: json['nomeCor4'] as String?,
      nomeConjunto: json['nomeConjunto'] as String?,
      situacao: json['situacao'] as String?,
      restricao: json['restricao'] as String?,
      entradaSaida: json['entradaSaida'] as String?,
      localEntrega: json['localEntrega'] as String?,
      localRetirada: json['localRetirada'] as String?,
      ultimaEtapa: json['ultimaEtapa'] as String?,
      ultimaRevisao: json['ultimaRevisao'] == null
          ? null
          : DateTime.parse(json['ultimaRevisao'] as String),
    );

Map<String, dynamic> _$$ConsultaKitModelImplToJson(
        _$ConsultaKitModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'nomeKitDescritor': instance.nomeKitDescritor,
      'nomeProprietario': instance.nomeProprietario,
      'tamanhoKit': instance.tamanhoKit,
      'grupo': instance.grupo,
      'qtdeItensFisico': instance.qtdeItensFisico,
      'nomeCor1': instance.nomeCor1,
      'nomeCor2': instance.nomeCor2,
      'nomeCor3': instance.nomeCor3,
      'nomeCor4': instance.nomeCor4,
      'nomeConjunto': instance.nomeConjunto,
      'situacao': instance.situacao,
      'restricao': instance.restricao,
      'entradaSaida': instance.entradaSaida,
      'localEntrega': instance.localEntrega,
      'localRetirada': instance.localRetirada,
      'ultimaEtapa': instance.ultimaEtapa,
      'ultimaRevisao': instance.ultimaRevisao?.toIso8601String(),
    };
