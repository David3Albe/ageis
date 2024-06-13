// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeModelImpl _$$AnormalidadeModelImplFromJson(Map json) =>
    _$AnormalidadeModelImpl(
      cod: json['cod'] as int,
      descricao: json['descricao'] as String,
      codUsuario: json['codUsuario'] as int,
      codAnormalidadeTipo: json['codAnormalidadeTipo'] as int,
      dataHora: DateTime.parse(json['dataHora'] as String),
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codItem: json['codItem'] as int?,
      codRegistroProcesso: json['codRegistroProcesso'] as int?,
      codUsuarioLiberacao: json['codUsuarioLiberacao'] as int?,
      observacaoLiberacao: json['observacaoLiberacao'] as String?,
      dataLiberacao: json['dataLiberacao'] == null
          ? null
          : DateTime.parse(json['dataLiberacao'] as String),
      codProcessoEtapa: json['codProcessoEtapa'] as int?,
      processoRegistro: json['processoRegistro'] == null
          ? null
          : ProcessoRegistroModel.fromJson(
              Map<String, Object?>.from(json['processoRegistro'] as Map)),
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      etapa: json['etapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapa'] as Map)),
      anormalidadeTipo: json['anormalidadeTipo'] == null
          ? null
          : AnormalidadeTipoModel.fromJson(
              Map<String, Object?>.from(json['anormalidadeTipo'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      usuarioLiberacao: json['usuarioLiberacao'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuarioLiberacao'] as Map)),
    );

Map<String, dynamic> _$$AnormalidadeModelImplToJson(
        _$AnormalidadeModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codUsuario': instance.codUsuario,
      'codAnormalidadeTipo': instance.codAnormalidadeTipo,
      'dataHora': instance.dataHora.toIso8601String(),
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'codItem': instance.codItem,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'codUsuarioLiberacao': instance.codUsuarioLiberacao,
      'observacaoLiberacao': instance.observacaoLiberacao,
      'dataLiberacao': instance.dataLiberacao?.toIso8601String(),
      'codProcessoEtapa': instance.codProcessoEtapa,
      'processoRegistro': instance.processoRegistro?.toJson(),
      'item': instance.item?.toJson(),
      'etapa': instance.etapa?.toJson(),
      'anormalidadeTipo': instance.anormalidadeTipo?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'usuarioLiberacao': instance.usuarioLiberacao?.toJson(),
    };
