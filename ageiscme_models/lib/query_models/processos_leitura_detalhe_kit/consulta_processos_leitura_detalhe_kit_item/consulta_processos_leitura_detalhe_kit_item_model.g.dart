// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_detalhe_kit_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDetalheKitItemModelImpl
    _$$ConsultaProcessosLeituraDetalheKitItemModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDetalheKitItemModelImpl(
          idEtiqueta: json['idEtiqueta'] as String?,
          descricaoCurta: json['descricaoCurta'] as String?,
          descritor: json['descritor'] as String?,
          situacao: json['situacao'] as String?,
          responsavel: json['responsavel'] as String?,
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          tamanho: json['tamanho'] as String?,
          grupo: json['grupo'] as String?,
          proprietario: json['proprietario'] as String?,
          implantavel: json['implantavel'] as String?,
          dataDescarte: json['dataDescarte'] == null
              ? null
              : DateTime.parse(json['dataDescarte'] as String),
          restricao: json['restricao'] as String?,
          statusCod: json['statusCod'] as String?,
          cod: (json['cod'] as num?)?.toInt(),
          codKit: (json['codKit'] as num?)?.toInt(),
          codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDetalheKitItemModelImplToJson(
        _$ConsultaProcessosLeituraDetalheKitItemModelImpl instance) =>
    <String, dynamic>{
      'idEtiqueta': instance.idEtiqueta,
      'descricaoCurta': instance.descricaoCurta,
      'descritor': instance.descritor,
      'situacao': instance.situacao,
      'responsavel': instance.responsavel,
      'dataHora': instance.dataHora?.toIso8601String(),
      'tamanho': instance.tamanho,
      'grupo': instance.grupo,
      'proprietario': instance.proprietario,
      'implantavel': instance.implantavel,
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'restricao': instance.restricao,
      'statusCod': instance.statusCod,
      'cod': instance.cod,
      'codKit': instance.codKit,
      'codRegistroProcesso': instance.codRegistroProcesso,
    };
