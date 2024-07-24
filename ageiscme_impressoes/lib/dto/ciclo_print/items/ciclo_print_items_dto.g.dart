// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ciclo_print_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CicloPrintItemsDTOImpl _$$CicloPrintItemsDTOImplFromJson(Map json) =>
    _$CicloPrintItemsDTOImpl(
      instituicao: json['instituicao'] as String,
      dataHora: DateTime.parse(json['dataHora'] as String),
      equipamento: json['equipamento'] as String,
      processo: json['processo'] as String,
      indicador: json['indicador'] as String,
      lote: json['lote'] as String,
      usuario: json['usuario'] as String,
      codKit: json['codKit'] as String?,
      nomeKit: json['nomeKit'] as String?,
      idEtiqueta: json['idEtiqueta'] as String?,
      nomeItem: json['nomeItem'] as String?,
      proprietario: json['proprietario'] as String?,
      loteEquipamento: json['loteEquipamento'] as String?,
    );

Map<String, dynamic> _$$CicloPrintItemsDTOImplToJson(
        _$CicloPrintItemsDTOImpl instance) =>
    <String, dynamic>{
      'instituicao': instance.instituicao,
      'dataHora': instance.dataHora.toIso8601String(),
      'equipamento': instance.equipamento,
      'processo': instance.processo,
      'indicador': instance.indicador,
      'lote': instance.lote,
      'usuario': instance.usuario,
      'codKit': instance.codKit,
      'nomeKit': instance.nomeKit,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'proprietario': instance.proprietario,
      'loteEquipamento': instance.loteEquipamento,
    };
