// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_consignado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConsignadoModelImpl _$$ItemConsignadoModelImplFromJson(Map json) =>
    _$ItemConsignadoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      quantidade: (json['quantidade'] as num?)?.toInt(),
      conferenciaCadastro: (json['conferenciaCadastro'] as num?)?.toInt(),
      conferenciaRecepcao: (json['conferenciaRecepcao'] as num?)?.toInt(),
      codRegistroProcessoRecepcao:
          (json['codRegistroProcessoRecepcao'] as num?)?.toInt(),
      conferenciaPreparo: (json['conferenciaPreparo'] as num?)?.toInt(),
      codRegistroProcessoPreparo:
          (json['codRegistroProcessoPreparo'] as num?)?.toInt(),
      conferenciaExpurgo: (json['conferenciaExpurgo'] as num?)?.toInt(),
      codRegistroProcessoExpurgo:
          (json['codRegistroProcessoExpurgo'] as num?)?.toInt(),
      codInsituicao: (json['codInsituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      TStamp: json['tStamp'] as String?,
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      processoRegistro: json['processoRegistro'] == null
          ? null
          : ProcessoRegistroModel.fromJson(
              Map<String, Object?>.from(json['processoRegistro'] as Map)),
    );

Map<String, dynamic> _$$ItemConsignadoModelImplToJson(
        _$ItemConsignadoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codItem': instance.codItem,
      'descricao': instance.descricao,
      'quantidade': instance.quantidade,
      'conferenciaCadastro': instance.conferenciaCadastro,
      'conferenciaRecepcao': instance.conferenciaRecepcao,
      'codRegistroProcessoRecepcao': instance.codRegistroProcessoRecepcao,
      'conferenciaPreparo': instance.conferenciaPreparo,
      'codRegistroProcessoPreparo': instance.codRegistroProcessoPreparo,
      'conferenciaExpurgo': instance.conferenciaExpurgo,
      'codRegistroProcessoExpurgo': instance.codRegistroProcessoExpurgo,
      'codInsituicao': instance.codInsituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.TStamp,
      'item': instance.item?.toJson(),
      'processoRegistro': instance.processoRegistro?.toJson(),
    };
