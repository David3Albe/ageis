// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parametro_sistema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParametroSistemaModelImpl _$$ParametroSistemaModelImplFromJson(Map json) =>
    _$ParametroSistemaModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      versaoSW: json['versaoSW'] as String?,
      dataVersaoSW: json['dataVersaoSW'] == null
          ? null
          : DateTime.parse(json['dataVersaoSW'] as String),
      versaoSistemaV2: json['versaoSistemaV2'] as String?,
      dataVersaoSistemaV2: json['dataVersaoSistemaV2'] == null
          ? null
          : DateTime.parse(json['dataVersaoSistemaV2'] as String),
      qtdeMaxProcessosEtiqueta:
          (json['qtdeMaxProcessosEtiqueta'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      indicador: (json['indicador'] as num?)?.toInt(),
      letraConsignado: json['letraConsignado'] as String?,
      licenca: json['licenca'] as String?,
      zeraEtiquetaRotulado: json['zeraEtiquetaRotulado'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ParametroSistemaModelImplToJson(
        _$ParametroSistemaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'versaoSW': instance.versaoSW,
      'dataVersaoSW': instance.dataVersaoSW?.toIso8601String(),
      'versaoSistemaV2': instance.versaoSistemaV2,
      'dataVersaoSistemaV2': instance.dataVersaoSistemaV2?.toIso8601String(),
      'qtdeMaxProcessosEtiqueta': instance.qtdeMaxProcessosEtiqueta,
      'codInstituicao': instance.codInstituicao,
      'indicador': instance.indicador,
      'letraConsignado': instance.letraConsignado,
      'licenca': instance.licenca,
      'zeraEtiquetaRotulado': instance.zeraEtiquetaRotulado,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
