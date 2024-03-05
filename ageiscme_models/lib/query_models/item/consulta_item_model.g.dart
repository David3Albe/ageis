// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemModelImpl _$$ConsultaItemModelImplFromJson(Map json) =>
    _$ConsultaItemModelImpl(
      cod: json['cod'] as int?,
      idEtiqueta: json['idEtiqueta'] as String?,
      item: json['item'] as String?,
      descricaoCurta: json['descricaoCurta'] as String?,
      tamanhoSigla: json['tamanhoSigla'] as String?,
      nomeGrupo: json['nomeGrupo'] as String?,
      qtdeProcessos: json['qtdeProcessos'] as int?,
      nomeKit: json['nomeKit'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      rmsValidade: json['rmsValidade'] == null
          ? null
          : DateTime.parse(json['rmsValidade'] as String),
      implantavel: json['implantavel'] as String?,
      dataAquisicao: json['dataAquisicao'] == null
          ? null
          : DateTime.parse(json['dataAquisicao'] as String),
      vidaUtil: json['vidaUtil'] == null
          ? null
          : DateTime.parse(json['vidaUtil'] as String),
      loteProduto: json['loteProduto'] as String?,
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      situacao: json['situacao'] as String?,
      restricao: json['restricao'] as String?,
      valorItem: (json['valorItem'] as num?)?.toDouble(),
      pesoG: (json['pesoG'] as num?)?.toDouble(),
      fabricante: json['fabricante'] as String?,
      fornecedor: json['fornecedor'] as String?,
      regAnvisa: json['regAnvisa'] as String?,
      numeroPatrimonio: json['numeroPatrimonio'] as int?,
      numeroNota: json['numeroNota'] as int?,
      entradaSaida: json['entradaSaida'] as String?,
      localEntrega: json['localEntrega'] as String?,
      localRetirada: json['localRetirada'] as String?,
      ultimaEtapa: json['ultimaEtapa'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
    );

Map<String, dynamic> _$$ConsultaItemModelImplToJson(
        _$ConsultaItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'item': instance.item,
      'descricaoCurta': instance.descricaoCurta,
      'tamanhoSigla': instance.tamanhoSigla,
      'nomeGrupo': instance.nomeGrupo,
      'qtdeProcessos': instance.qtdeProcessos,
      'nomeKit': instance.nomeKit,
      'nomeProprietario': instance.nomeProprietario,
      'rmsValidade': instance.rmsValidade?.toIso8601String(),
      'implantavel': instance.implantavel,
      'dataAquisicao': instance.dataAquisicao?.toIso8601String(),
      'vidaUtil': instance.vidaUtil?.toIso8601String(),
      'loteProduto': instance.loteProduto,
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'situacao': instance.situacao,
      'restricao': instance.restricao,
      'valorItem': instance.valorItem,
      'pesoG': instance.pesoG,
      'fabricante': instance.fabricante,
      'fornecedor': instance.fornecedor,
      'regAnvisa': instance.regAnvisa,
      'numeroPatrimonio': instance.numeroPatrimonio,
      'numeroNota': instance.numeroNota,
      'entradaSaida': instance.entradaSaida,
      'localEntrega': instance.localEntrega,
      'localRetirada': instance.localRetirada,
      'ultimaEtapa': instance.ultimaEtapa,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
    };
