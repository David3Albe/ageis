// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_vencido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueVencidoModelImpl _$$ConsultaEstoqueVencidoModelImplFromJson(
        Map json) =>
    _$ConsultaEstoqueVencidoModelImpl(
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      dataEntrada: json['dataEntrada'] == null
          ? null
          : DateTime.parse(json['dataEntrada'] as String),
      codKit: json['codKit'] as int?,
      codItem: json['codItem'] as int?,
      nomeArsenalEstoque: json['nomeArsenalEstoque'] as String?,
      nomeLocalEstoque: json['nomeLocalEstoque'] as String?,
      nomeKit: json['nomeKit'] as String?,
      nomeItem: json['nomeItem'] as String?,
      idEtiqueta: json['idEtiqueta'] as String?,
      codBarra: json['codBarra'] as String?,
    );

Map<String, dynamic> _$$ConsultaEstoqueVencidoModelImplToJson(
        _$ConsultaEstoqueVencidoModelImpl instance) =>
    <String, dynamic>{
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'dataEntrada': instance.dataEntrada?.toIso8601String(),
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'nomeArsenalEstoque': instance.nomeArsenalEstoque,
      'nomeLocalEstoque': instance.nomeLocalEstoque,
      'nomeKit': instance.nomeKit,
      'nomeItem': instance.nomeItem,
      'idEtiqueta': instance.idEtiqueta,
      'codBarra': instance.codBarra,
    };
