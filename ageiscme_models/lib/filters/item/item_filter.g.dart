// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemFilterImpl _$$ItemFilterImplFromJson(Map json) => _$ItemFilterImpl(
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      cod: json['cod'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      carregarKit: json['carregarKit'] as bool?,
      carregarDescritor: json['carregarDescritor'] as bool?,
      carregarDescritorResumido: json['carregarDescritorResumido'] as bool?,
      carregarUsuarios: json['carregarUsuarios'] as bool?,
      carregarProprietario: json['carregarProprietario'] as bool?,
      apenasItensConsignados: json['apenasItensConsignados'] as bool?,
      apenasItensNaoConsignados: json['apenasItensNaoConsignados'] as bool?,
      carregarItensConsignado: json['carregarItensConsignado'] as bool?,
      numeroRegistros: json['numeroRegistros'] as int?,
      termoPesquisa: json['termoPesquisa'] as String?,
      idEtiquetaComecaCom: json['idEtiquetaComecaCom'] as String?,
      tStamp: json['tStamp'] as String?,
      itemFilter: json['itemFilter'] == null
          ? null
          : ItemModel.fromJson(
              Map<String, Object?>.from(json['itemFilter'] as Map)),
      kitFilter: json['kitFilter'] == null
          ? null
          : KitModel.fromJson(
              Map<String, Object?>.from(json['kitFilter'] as Map)),
      codKit: json['codKit'] as int?,
      iDEtiqueta: json['iDEtiqueta'] as String?,
    );

Map<String, dynamic> _$$ItemFilterImplToJson(_$ItemFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'carregarKit': instance.carregarKit,
      'carregarDescritor': instance.carregarDescritor,
      'carregarDescritorResumido': instance.carregarDescritorResumido,
      'carregarUsuarios': instance.carregarUsuarios,
      'carregarProprietario': instance.carregarProprietario,
      'apenasItensConsignados': instance.apenasItensConsignados,
      'apenasItensNaoConsignados': instance.apenasItensNaoConsignados,
      'carregarItensConsignado': instance.carregarItensConsignado,
      'numeroRegistros': instance.numeroRegistros,
      'termoPesquisa': instance.termoPesquisa,
      'idEtiquetaComecaCom': instance.idEtiquetaComecaCom,
      'tStamp': instance.tStamp,
      'itemFilter': instance.itemFilter?.toJson(),
      'kitFilter': instance.kitFilter?.toJson(),
      'codKit': instance.codKit,
      'iDEtiqueta': instance.iDEtiqueta,
    };
