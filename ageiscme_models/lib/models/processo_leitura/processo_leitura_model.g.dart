// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraModelImpl _$$ProcessoLeituraModelImplFromJson(Map json) =>
    _$ProcessoLeituraModelImpl(
      cod: json['cod'] as int?,
      codRegistroProcesso: json['codRegistroProcesso'] as int?,
      codItem: json['codItem'] as int?,
      codKit: json['codKit'] as int?,
      entradaSaida: json['entradaSaida'] as String?,
      codUsuario: json['codUsuario'] as int?,
      nroItensFaltantes: json['nroItensFaltantes'] as int?,
      kitLiberadoIncompleto: json['kitLiberadoIncompleto'] as bool?,
      codUsuarioLiberacao: json['codUsuarioLiberacao'] as int?,
      conferidoVisualmente: json['conferidoVisualmente'] as bool?,
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      codUsuarioQuebraSeq: json['codUsuarioQuebraSeq'] as int?,
      codEmbalagem: json['codEmbalagem'] as int?,
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      codEtapaProcesso: json['codEtapaProcesso'] as int?,
      codMotivo: json['codMotivo'] as int?,
      codMotivoQuebraFluxo: json['codMotivoQuebraFluxo'] as int?,
      codMotivoReporRemoverItem: json['codMotivoReporRemoverItem'] as int?,
      codAcaoOcorrencia: json['codAcaoOcorrencia'] as int?,
      entradaAutomatica: json['entradaAutomatica'] as int?,
      loteEquipamento: json['loteEquipamento'] as String?,
      codUsuarioResponsavelLocal: json['codUsuarioResponsavelLocal'] as int?,
      integradorKit: json['integradorKit'] as bool?,
      statusKit: json['statusKit'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
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
    };
