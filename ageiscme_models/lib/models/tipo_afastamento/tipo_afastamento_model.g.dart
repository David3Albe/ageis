// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_afastamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TipoAfastamentoModelImpl _$$TipoAfastamentoModelImplFromJson(Map json) =>
    _$TipoAfastamentoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      motivo: json['motivo'] as String?,
      diasConcedido: (json['diasConcedido'] as num?)?.toInt(),
      cat: json['cat'] as bool?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$TipoAfastamentoModelImplToJson(
        _$TipoAfastamentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'motivo': instance.motivo,
      'diasConcedido': instance.diasConcedido,
      'cat': instance.cat,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
