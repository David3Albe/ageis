// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_registro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoRegistroModelImpl _$$ProcessoRegistroModelImplFromJson(Map json) =>
    _$ProcessoRegistroModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codEtapaProcesso: (json['codEtapaProcesso'] as num?)?.toInt(),
      dataHoraInicio: json['dataHoraInicio'] == null
          ? null
          : DateTime.parse(json['dataHoraInicio'] as String),
      dataHoraTermino: json['dataHoraTermino'] == null
          ? null
          : DateTime.parse(json['dataHoraTermino'] as String),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      indicador: json['indicador'] as String?,
      biologico: json['biologico'] as String?,
      leitura: json['leitura'] == null
          ? null
          : ProcessoLeituraModel.fromJson(
              Map<String, Object?>.from(json['leitura'] as Map)),
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
      'leitura': instance.leitura?.toJson(),
      'tStamp': instance.tstamp,
    };
