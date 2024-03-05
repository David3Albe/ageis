// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_consignado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemConsignadoModelImpl _$$ItemConsignadoModelImplFromJson(Map json) =>
    _$ItemConsignadoModelImpl(
      cod: json['cod'] as int?,
      codItem: json['codItem'] as int?,
      descricao: json['descricao'] as String?,
      quantidade: json['quantidade'] as int?,
      conferenciaCadastro: json['conferenciaCadastro'] as int?,
      conferenciaRecepcao: json['conferenciaRecepcao'] as int?,
      codRegistroProcessoRecepcao: json['codRegistroProcessoRecepcao'] as int?,
      conferenciaPreparo: json['conferenciaPreparo'] as int?,
      codRegistroProcessoPreparo: json['codRegistroProcessoPreparo'] as int?,
      conferenciaExpurgo: json['conferenciaExpurgo'] as int?,
      codRegistroProcessoExpurgo: json['codRegistroProcessoExpurgo'] as int?,
      codInsituicao: json['codInsituicao'] as int?,
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
