// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitModelImpl _$$KitModelImplFromJson(Map json) => _$KitModelImpl(
      cod: json['cod'] as int?,
      codBarra: json['codBarra'] as String?,
      codCor1: json['codCor1'] as int?,
      codCor2: json['codCor2'] as int?,
      codCor3: json['codCor3'] as int?,
      codCor4: json['codCor4'] as int?,
      status: json['status'] as String?,
      restricao: json['restricao'] as String?,
      codDescritorKit: json['codDescritorKit'] as int?,
      codConjunto: json['codConjunto'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      preparo: json['preparo'] as String?,
      codProcessoLeitura: json['codProcessoLeitura'] as int?,
      codEmbalagem: json['codEmbalagem'] as int?,
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(
              Map<String, Object?>.from(json['embalagem'] as Map)),
      imagem: json['imagem'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tStamp: json['tStamp'] as String?,
      descritor: json['descritor'] == null
          ? null
          : KitDescritorModel.fromJson(
              Map<String, Object?>.from(json['descritor'] as Map)),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      cor1: json['cor1'] == null
          ? null
          : KitCorModel.fromJson(
              Map<String, Object?>.from(json['cor1'] as Map)),
      cor2: json['cor2'] == null
          ? null
          : KitCorModel.fromJson(
              Map<String, Object?>.from(json['cor2'] as Map)),
      cor3: json['cor3'] == null
          ? null
          : KitCorModel.fromJson(
              Map<String, Object?>.from(json['cor3'] as Map)),
      cor4: json['cor4'] == null
          ? null
          : KitCorModel.fromJson(
              Map<String, Object?>.from(json['cor4'] as Map)),
    );

Map<String, dynamic> _$$KitModelImplToJson(_$KitModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'codCor1': instance.codCor1,
      'codCor2': instance.codCor2,
      'codCor3': instance.codCor3,
      'codCor4': instance.codCor4,
      'status': instance.status,
      'restricao': instance.restricao,
      'codDescritorKit': instance.codDescritorKit,
      'codConjunto': instance.codConjunto,
      'codInstituicao': instance.codInstituicao,
      'preparo': instance.preparo,
      'codProcessoLeitura': instance.codProcessoLeitura,
      'codEmbalagem': instance.codEmbalagem,
      'embalagem': instance.embalagem?.toJson(),
      'imagem': instance.imagem,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tStamp,
      'descritor': instance.descritor?.toJson(),
      'itens': instance.itens?.map((e) => e.toJson()).toList(),
      'cor1': instance.cor1?.toJson(),
      'cor2': instance.cor2?.toJson(),
      'cor3': instance.cor3?.toJson(),
      'cor4': instance.cor4?.toJson(),
    };
