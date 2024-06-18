// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'centro_custo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CentroCustoModelImpl _$$CentroCustoModelImplFromJson(Map json) =>
    _$CentroCustoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      centroCusto: json['centroCusto'] as String?,
      descricao: json['descricao'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$CentroCustoModelImplToJson(
        _$CentroCustoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'centroCusto': instance.centroCusto,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
