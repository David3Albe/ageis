// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentoModelImpl _$$DocumentoModelImplFromJson(Map json) =>
    _$DocumentoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      observacao: json['observacao'] as String?,
      usuario: json['usuario'] as String?,
      documento: json['documento'] as String?,
      nomeDocumento: json['nomeDocumento'] as String?,
      codTipo: (json['codTipo'] as num?)?.toInt(),
      validade: json['validade'] == null
          ? null
          : DateTime.parse(json['validade'] as String),
      controlarValidade: json['controlarValidade'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tipoDocumento: json['tipoDocumento'] == null
          ? null
          : TipoDocumentoModel.fromJson(
              Map<String, Object?>.from(json['tipoDocumento'] as Map)),
    );

Map<String, dynamic> _$$DocumentoModelImplToJson(
        _$DocumentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'usuario': instance.usuario,
      'documento': instance.documento,
      'nomeDocumento': instance.nomeDocumento,
      'codTipo': instance.codTipo,
      'validade': instance.validade?.toIso8601String(),
      'controlarValidade': instance.controlarValidade,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tipoDocumento': instance.tipoDocumento?.toJson(),
    };
