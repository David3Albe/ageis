// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraModelImpl _$$ProcessoLeituraModelImplFromJson(Map json) =>
    _$ProcessoLeituraModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      entradaSaida: json['entradaSaida'] as String?,
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      nroItensFaltantes: (json['nroItensFaltantes'] as num?)?.toInt(),
      kitLiberadoIncompleto: json['kitLiberadoIncompleto'] as bool?,
      codUsuarioLiberacao: (json['codUsuarioLiberacao'] as num?)?.toInt(),
      conferidoVisualmente: json['conferidoVisualmente'] as bool?,
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      codUsuarioQuebraSeq: (json['codUsuarioQuebraSeq'] as num?)?.toInt(),
      codEmbalagem: (json['codEmbalagem'] as num?)?.toInt(),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      codEtapaProcesso: (json['codEtapaProcesso'] as num?)?.toInt(),
      codMotivo: (json['codMotivo'] as num?)?.toInt(),
      codMotivoQuebraFluxo: (json['codMotivoQuebraFluxo'] as num?)?.toInt(),
      codMotivoReporRemoverItem:
          (json['codMotivoReporRemoverItem'] as num?)?.toInt(),
      codAcaoOcorrencia: (json['codAcaoOcorrencia'] as num?)?.toInt(),
      entradaAutomatica: (json['entradaAutomatica'] as num?)?.toInt(),
      loteEquipamento: json['loteEquipamento'] as String?,
      codUsuarioResponsavelLocal:
          (json['codUsuarioResponsavelLocal'] as num?)?.toInt(),
      integradorKit: json['integradorKit'] as bool?,
      statusKit: (json['statusKit'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      processoEtapa: json['processoEtapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['processoEtapa'] as Map)),
    );

Map<String, dynamic> _$$ProcessoLeituraModelImplToJson(
        _$ProcessoLeituraModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'codItem': instance.codItem,
      'codKit': instance.codKit,
      'entradaSaida': instance.entradaSaida,
      'codUsuario': instance.codUsuario,
      'nroItensFaltantes': instance.nroItensFaltantes,
      'kitLiberadoIncompleto': instance.kitLiberadoIncompleto,
      'codUsuarioLiberacao': instance.codUsuarioLiberacao,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'dataHora': instance.dataHora?.toIso8601String(),
      'codUsuarioQuebraSeq': instance.codUsuarioQuebraSeq,
      'codEmbalagem': instance.codEmbalagem,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'codEtapaProcesso': instance.codEtapaProcesso,
      'codMotivo': instance.codMotivo,
      'codMotivoQuebraFluxo': instance.codMotivoQuebraFluxo,
      'codMotivoReporRemoverItem': instance.codMotivoReporRemoverItem,
      'codAcaoOcorrencia': instance.codAcaoOcorrencia,
      'entradaAutomatica': instance.entradaAutomatica,
      'loteEquipamento': instance.loteEquipamento,
      'codUsuarioResponsavelLocal': instance.codUsuarioResponsavelLocal,
      'integradorKit': instance.integradorKit,
      'statusKit': instance.statusKit,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'processoEtapa': instance.processoEtapa?.toJson(),
    };
