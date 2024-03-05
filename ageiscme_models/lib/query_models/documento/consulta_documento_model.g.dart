// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_documento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaDocumentoModelImpl _$$ConsultaDocumentoModelImplFromJson(Map json) =>
    _$ConsultaDocumentoModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      validade: json['validade'] == null
          ? null
          : DateTime.parse(json['validade'] as String),
      tipoDocumento: json['tipoDocumento'] as String?,
    );

Map<String, dynamic> _$$ConsultaDocumentoModelImplToJson(
        _$ConsultaDocumentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'validade': instance.validade?.toIso8601String(),
      'tipoDocumento': instance.tipoDocumento,
    };
