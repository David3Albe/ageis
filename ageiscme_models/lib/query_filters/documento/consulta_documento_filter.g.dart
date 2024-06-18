// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_documento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaDocumentoFilterImpl _$$ConsultaDocumentoFilterImplFromJson(
        Map json) =>
    _$ConsultaDocumentoFilterImpl(
      codTipo: (json['codTipo'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      validade: json['validade'] as bool?,
    );

Map<String, dynamic> _$$ConsultaDocumentoFilterImplToJson(
        _$ConsultaDocumentoFilterImpl instance) =>
    <String, dynamic>{
      'codTipo': instance.codTipo,
      'descricao': instance.descricao,
      'validade': instance.validade,
    };
