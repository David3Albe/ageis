// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeSaveDTOImpl _$$AnormalidadeSaveDTOImplFromJson(Map json) =>
    _$AnormalidadeSaveDTOImpl(
      cod: (json['cod'] as num).toInt(),
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      descricao: json['descricao'] as String?,
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codAnormalidadeTipo: (json['codAnormalidadeTipo'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codItem: (json['codItem'] as num?)?.toInt(),
      codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
      codUsuarioLiberacao: (json['codUsuarioLiberacao'] as num?)?.toInt(),
      observacaoLiberacao: json['observacaoLiberacao'] as String?,
      dataLiberacao: json['dataLiberacao'] == null
          ? null
          : DateTime.parse(json['dataLiberacao'] as String),
      codProcessoEtapa: (json['codProcessoEtapa'] as num?)?.toInt(),
      processoRegistro: json['processoRegistro'] == null
          ? null
          : ProcessoRegistroUltimoResponseDTO.fromJson(
              Map<String, Object?>.from(json['processoRegistro'] as Map)),
      item: json['item'] == null
          ? null
          : ItemDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['item'] as Map)),
      etapa: json['etapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapa'] as Map)),
      anormalidadeTipo: json['anormalidadeTipo'] == null
          ? null
          : AnormalidadeTipoShortResponseDTO.fromJson(
              Map<String, Object?>.from(json['anormalidadeTipo'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      usuarioLiberacao: json['usuarioLiberacao'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuarioLiberacao'] as Map)),
    );

Map<String, dynamic> _$$AnormalidadeSaveDTOImplToJson(
        _$AnormalidadeSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataHora': instance.dataHora?.toIso8601String(),
      'descricao': instance.descricao,
      'codUsuario': instance.codUsuario,
      'codAnormalidadeTipo': instance.codAnormalidadeTipo,
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
