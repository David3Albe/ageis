// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorModelImpl _$$ItemDescritorModelImplFromJson(Map json) =>
    _$ItemDescritorModelImpl(
      cod: json['cod'] as int?,
      descricaoCurta: json['descricaoCurta'] as String?,
      descricaoCompleta: json['descricaoCompleta'] as String?,
      foto: json['foto'] as String?,
      tamanhoSigla: json['tamanhoSigla'] as String?,
      codTipoProcessoNormal: json['codTipoProcessoNormal'] as int?,
      codTipoProcessoUrgencia: json['codTipoProcessoUrgencia'] as int?,
      codTipoProcessoEmergencia: json['codTipoProcessoEmergencia'] as int?,
      codGrupoItem: json['codGrupoItem'] as int?,
      codEmbalagem: json['codEmbalagem'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      limiteProcessos: json['limiteProcessos'] as int?,
      codCusto: json['codCusto'] as int?,
      cm: (json['cm'] as num?)?.toDouble(),
      peso: (json['peso'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      ativo: json['ativo'] as bool?,
      consignado: json['consignado'] as bool?,
      complementar: json['complementar'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      grupoMaterial: json['grupoMaterial'] == null
          ? null
          : GrupoMaterialModel.fromJson(
              Map<String, Object?>.from(json['grupoMaterial'] as Map)),
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(
              Map<String, Object?>.from(json['embalagem'] as Map)),
      centroCusto: json['centroCusto'] == null
          ? null
          : CentroCustoModel.fromJson(
              Map<String, Object?>.from(json['centroCusto'] as Map)),
      tipoProcesso: json['tipoProcesso'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcesso'] as Map)),
      tipoProcessoUrgencia: json['tipoProcessoUrgencia'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcessoUrgencia'] as Map)),
      tipoProcessoEmergencia: json['tipoProcessoEmergencia'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcessoEmergencia'] as Map)),
      tamanho: json['tamanho'] == null
          ? null
          : TamanhoModel.fromJson(
              Map<String, Object?>.from(json['tamanho'] as Map)),
      itensDescritoresConsignados:
          (json['itensDescritoresConsignados'] as List<dynamic>?)
              ?.map((e) => ItemDescritorConsignadoModel.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
    );

Map<String, dynamic> _$$ItemDescritorModelImplToJson(
        _$ItemDescritorModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricaoCurta': instance.descricaoCurta,
      'descricaoCompleta': instance.descricaoCompleta,
      'foto': instance.foto,
      'tamanhoSigla': instance.tamanhoSigla,
      'codTipoProcessoNormal': instance.codTipoProcessoNormal,
      'codTipoProcessoUrgencia': instance.codTipoProcessoUrgencia,
      'codTipoProcessoEmergencia': instance.codTipoProcessoEmergencia,
      'codGrupoItem': instance.codGrupoItem,
      'codEmbalagem': instance.codEmbalagem,
      'codInstituicao': instance.codInstituicao,
      'limiteProcessos': instance.limiteProcessos,
      'codCusto': instance.codCusto,
      'cm': instance.cm,
      'peso': instance.peso,
      'volume': instance.volume,
      'ativo': instance.ativo,
      'consignado': instance.consignado,
      'complementar': instance.complementar,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'grupoMaterial': instance.grupoMaterial?.toJson(),
      'embalagem': instance.embalagem?.toJson(),
      'centroCusto': instance.centroCusto?.toJson(),
      'tipoProcesso': instance.tipoProcesso?.toJson(),
      'tipoProcessoUrgencia': instance.tipoProcessoUrgencia?.toJson(),
      'tipoProcessoEmergencia': instance.tipoProcessoEmergencia?.toJson(),
      'tamanho': instance.tamanho?.toJson(),
      'itensDescritoresConsignados':
          instance.itensDescritoresConsignados?.map((e) => e.toJson()).toList(),
    };
