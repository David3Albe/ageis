// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estoque_disponivel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstoqueDisponivelModelImpl _$$EstoqueDisponivelModelImplFromJson(Map json) =>
    _$EstoqueDisponivelModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      codLocalEstoque: (json['codLocalEstoque'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      removido: json['removido'] as bool?,
      dataEntrada: json['dataEntrada'] == null
          ? null
          : DateTime.parse(json['dataEntrada'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      arsenalEstoque: json['arsenalEstoque'] == null
          ? null
          : ArsenalEstoqueModel.fromJson(
              Map<String, Object?>.from(json['arsenalEstoque'] as Map)),
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      kit: json['kit'] == null
          ? null
          : KitModel.fromJson(Map<String, Object?>.from(json['kit'] as Map)),
      localizacaoArsenal: json['localizacaoArsenal'] == null
          ? null
          : LocalizacaoArsenalModel.fromJson(
              Map<String, Object?>.from(json['localizacaoArsenal'] as Map)),
    );

Map<String, dynamic> _$$EstoqueDisponivelModelImplToJson(
        _$EstoqueDisponivelModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEstoque': instance.codEstoque,
      'codLocalEstoque': instance.codLocalEstoque,
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'removido': instance.removido,
      'dataEntrada': instance.dataEntrada?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'arsenalEstoque': instance.arsenalEstoque?.toJson(),
      'item': instance.item?.toJson(),
      'kit': instance.kit?.toJson(),
      'localizacaoArsenal': instance.localizacaoArsenal?.toJson(),
    };
