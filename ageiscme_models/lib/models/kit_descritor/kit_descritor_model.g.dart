// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_descritor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitDescritorModelImpl _$$KitDescritorModelImplFromJson(Map json) =>
    _$KitDescritorModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      tamanhoSigla: json['tamanhoSigla'] as String?,
      codEmbalagem: json['codEmbalagem'] as int?,
      codInstituicao: json['codInstituicao'] as int,
      codTipoProcessoNormal: json['codTipoProcessoNormal'] as int?,
      codTipoProcessoUrgencia: json['codTipoProcessoUrgencia'] as int?,
      codTipoProcessoEmergencia: json['codTipoProcessoEmergencia'] as int?,
      codCusto: json['codCusto'] as int?,
      ativo: json['ativo'] as bool,
      exigeProntuario: json['exigeProntuario'] as bool?,
      imagem: json['imagem'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      itensDescritorKits: (json['itensDescritorKits'] as List<dynamic>?)
          ?.map((e) => ItemDescritorKitModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      tamanho: json['tamanho'] == null
          ? null
          : TamanhoModel.fromJson(
              Map<String, Object?>.from(json['tamanho'] as Map)),
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(
              Map<String, Object?>.from(json['embalagem'] as Map)),
      tipoProcesso: json['tipoProcesso'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcesso'] as Map)),
      tipoProcessoEmergencia: json['tipoProcessoEmergencia'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcessoEmergencia'] as Map)),
      tipoProcessoUrgencia: json['tipoProcessoUrgencia'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcessoUrgencia'] as Map)),
      centroCusto: json['centroCusto'] == null
          ? null
          : CentroCustoModel.fromJson(
              Map<String, Object?>.from(json['centroCusto'] as Map)),
    );

Map<String, dynamic> _$$KitDescritorModelImplToJson(
        _$KitDescritorModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tamanhoSigla': instance.tamanhoSigla,
      'codEmbalagem': instance.codEmbalagem,
      'codInstituicao': instance.codInstituicao,
      'codTipoProcessoNormal': instance.codTipoProcessoNormal,
      'codTipoProcessoUrgencia': instance.codTipoProcessoUrgencia,
      'codTipoProcessoEmergencia': instance.codTipoProcessoEmergencia,
      'codCusto': instance.codCusto,
      'ativo': instance.ativo,
      'exigeProntuario': instance.exigeProntuario,
      'imagem': instance.imagem,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'itensDescritorKits':
          instance.itensDescritorKits?.map((e) => e.toJson()).toList(),
      'tamanho': instance.tamanho?.toJson(),
      'embalagem': instance.embalagem?.toJson(),
      'tipoProcesso': instance.tipoProcesso?.toJson(),
      'tipoProcessoEmergencia': instance.tipoProcessoEmergencia?.toJson(),
      'tipoProcessoUrgencia': instance.tipoProcessoUrgencia?.toJson(),
      'centroCusto': instance.centroCusto?.toJson(),
    };
