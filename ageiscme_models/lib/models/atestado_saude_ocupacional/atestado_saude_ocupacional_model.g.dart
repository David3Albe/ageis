// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atestado_saude_ocupacional_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtestadoSaudeOcupacionalModelImpl
    _$$AtestadoSaudeOcupacionalModelImplFromJson(Map json) =>
        _$AtestadoSaudeOcupacionalModelImpl(
          cod: json['cod'] as int?,
          nomeMedico: json['nomeMedico'] as String?,
          crmMedico: json['crmMedico'] as int?,
          codUsuario: json['codUsuario'] as int?,
          tipo: json['tipo'] as int?,
          conclusao: json['conclusao'] as int?,
          data: json['data'] == null
              ? null
              : DateTime.parse(json['data'] as String),
          validade: json['validade'] == null
              ? null
              : DateTime.parse(json['validade'] as String),
          codInstituicao: json['codInstituicao'] as int?,
          doc: json['doc'] as String?,
          anexo: json['anexo'] as String?,
          docNome: json['docNome'] as String?,
          controlarValidade: json['controlarValidade'] as bool?,
          ultimaAlteracao: json['ultimaAlteracao'] == null
              ? null
              : DateTime.parse(json['ultimaAlteracao'] as String),
          tstamp: json['tStamp'] as String?,
          usuario: json['usuario'] == null
              ? null
              : UsuarioModel.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
        );

Map<String, dynamic> _$$AtestadoSaudeOcupacionalModelImplToJson(
        _$AtestadoSaudeOcupacionalModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nomeMedico': instance.nomeMedico,
      'crmMedico': instance.crmMedico,
      'codUsuario': instance.codUsuario,
      'tipo': instance.tipo,
      'conclusao': instance.conclusao,
      'data': instance.data?.toIso8601String(),
      'validade': instance.validade?.toIso8601String(),
      'codInstituicao': instance.codInstituicao,
      'doc': instance.doc,
      'anexo': instance.anexo,
      'docNome': instance.docNome,
      'controlarValidade': instance.controlarValidade,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'usuario': instance.usuario?.toJson(),
    };
