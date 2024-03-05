// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parametro_sistema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParametroSistemaModelImpl _$$ParametroSistemaModelImplFromJson(Map json) =>
    _$ParametroSistemaModelImpl(
      cod: json['cod'] as int?,
      versaoSW: json['versaoSW'] as String?,
      dataVersaoSW: json['dataVersaoSW'] == null
          ? null
          : DateTime.parse(json['dataVersaoSW'] as String),
      qtdeMaxProcessosEtiqueta: json['qtdeMaxProcessosEtiqueta'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      indicador: json['indicador'] as int?,
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
      'qtdeMaxProcessosEtiqueta': instance.qtdeMaxProcessosEtiqueta,
      'codInstituicao': instance.codInstituicao,
      'indicador': instance.indicador,
      'letraConsignado': instance.letraConsignado,
      'licenca': instance.licenca,
      'zeraEtiquetaRotulado': instance.zeraEtiquetaRotulado,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };
