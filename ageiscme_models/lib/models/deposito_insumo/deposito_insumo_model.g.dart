// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposito_insumo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositoInsumoModelImpl _$$DepositoInsumoModelImplFromJson(Map json) =>
    _$DepositoInsumoModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      status: json['status'] as String?,
      codLocal: json['codLocal'] as int?,
      codBarra: json['codBarra'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      local: json['local'] == null
          ? null
          : LocalInstituicaoModel.fromJson(
              Map<String, Object?>.from(json['local'] as Map)),
    );

Map<String, dynamic> _$$DepositoInsumoModelImplToJson(
        _$DepositoInsumoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'status': instance.status,
      'codLocal': instance.codLocal,
      'codBarra': instance.codBarra,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'local': instance.local?.toJson(),
    };
