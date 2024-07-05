// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atestado_saude_ocupacional_exame_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtestadoSaudeOcupacionalExameSaveDTOImpl
    _$$AtestadoSaudeOcupacionalExameSaveDTOImplFromJson(Map json) =>
        _$AtestadoSaudeOcupacionalExameSaveDTOImpl(
          cod: (json['cod'] as num).toInt(),
          codAsoUsuario: (json['codAsoUsuario'] as num).toInt(),
          dataRealizacao: json['dataRealizacao'] == null
              ? null
              : DateTime.parse(json['dataRealizacao'] as String),
          exame: json['exame'] as String?,
          doc: json['doc'] as String?,
          docNome: json['docNome'] as String?,
          imagemExame: json['imagemExame'] as String?,
          observacoes: json['observacoes'] as String?,
          tStamp: json['tStamp'] as String?,
          ultimaAlteracao: json['ultimaAlteracao'] == null
              ? null
              : DateTime.parse(json['ultimaAlteracao'] as String),
          codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
          dataAso: json['dataAso'] == null
              ? null
              : DateTime.parse(json['dataAso'] as String),
          nomeUsuarioAso: json['nomeUsuarioAso'] as String?,
        );

Map<String, dynamic> _$$AtestadoSaudeOcupacionalExameSaveDTOImplToJson(
        _$AtestadoSaudeOcupacionalExameSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codAsoUsuario': instance.codAsoUsuario,
      'dataRealizacao': instance.dataRealizacao?.toIso8601String(),
      'exame': instance.exame,
      'doc': instance.doc,
      'docNome': instance.docNome,
      'imagemExame': instance.imagemExame,
      'observacoes': instance.observacoes,
      'tStamp': instance.tStamp,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'codInstituicao': instance.codInstituicao,
      'dataAso': instance.dataAso?.toIso8601String(),
      'nomeUsuarioAso': instance.nomeUsuarioAso,
    };
