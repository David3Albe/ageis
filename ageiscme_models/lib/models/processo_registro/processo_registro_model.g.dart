// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_registro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoRegistroModelImpl _$$ProcessoRegistroModelImplFromJson(Map json) =>
    _$ProcessoRegistroModelImpl(
      cod: json['cod'] as int?,
      codEtapaProcesso: json['codEtapaProcesso'] as int?,
      dataHoraInicio: json['dataHoraInicio'] == null
          ? null
          : DateTime.parse(json['dataHoraInicio'] as String),
      dataHoraTermino: json['dataHoraTermino'] == null
          ? null
          : DateTime.parse(json['dataHoraTermino'] as String),
      codUsuario: json['codUsuario'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      indicador: json['indicador'] as String?,
      biologico: json['biologico'] as String?,
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoRegistroModelImplToJson(
        _$ProcessoRegistroModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'dataHoraInicio': instance.dataHoraInicio?.toIso8601String(),
      'dataHoraTermino': instance.dataHoraTermino?.toIso8601String(),
      'codUsuario': instance.codUsuario,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'indicador': instance.indicador,
      'biologico': instance.biologico,
      'tStamp': instance.tstamp,
    };
