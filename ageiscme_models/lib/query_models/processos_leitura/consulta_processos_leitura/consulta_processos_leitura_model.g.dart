// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraModelImpl
    _$$ConsultaProcessosLeituraModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          data: json['data'] == null
              ? null
              : DateTime.parse(json['data'] as String),
          hora: json['hora'] as String?,
          nroItensFaltante: json['nroItensFaltante'] as int?,
          codProprietario: json['codProprietario'] as int?,
          entradaSaida: json['entradaSaida'] as String?,
          codPrioridade: json['codPrioridade'] as String?,
          codUsuario: json['codUsuario'] as int?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          codLocalOrigem: json['codLocalOrigem'] as int?,
          codLocalDestino: json['codLocalDestino'] as int?,
          codCirculante: json['codCirculante'] as int?,
          conferidoVisualmente: json['conferidoVisualmente'] as String?,
          codRespKitIncomp: json['codRespKitIncomp'] as int?,
          codRespQuebFluxo: json['codRespQuebFluxo'] as int?,
          codRespDestinoNaoCompativel:
              json['codRespDestinoNaoCompativel'] as int?,
          indicador: json['indicador'] as String?,
          biologico: json['biologico'] as String?,
          implantavel: json['implantavel'] as String?,
          integradorKit: json['integradorKit'] as String?,
          codEmbalagem: json['codEmbalagem'] as int?,
          codItem: json['codItem'] as int?,
          codKit: json['codKit'] as int?,
          codEtapaProcesso: json['codEtapaProcesso'] as int?,
          codLeitura: json['codLeitura'] as int?,
          codMotivo: json['codMotivo'] as int?,
          codMotivoQuebraFluxo: json['codMotivoQuebraFluxo'] as int?,
          statusKit: json['statusKit'] as int?,
          observacao: json['observacao'] as String?,
          kitLiberadoIncompleto: json['kitLiberadoIncompleto'] as String?,
          lote: json['lote'] as int?,
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
          dataHoraInicio: json['dataHoraInicio'] == null
              ? null
              : DateTime.parse(json['dataHoraInicio'] as String),
          cancelada: json['cancelada'] as bool?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraModelImplToJson(
        _$ConsultaProcessosLeituraModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'data': instance.data?.toIso8601String(),
      'hora': instance.hora,
      'nroItensFaltante': instance.nroItensFaltante,
      'codProprietario': instance.codProprietario,
      'entradaSaida': instance.entradaSaida,
      'codPrioridade': instance.codPrioridade,
      'codUsuario': instance.codUsuario,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'codLocalOrigem': instance.codLocalOrigem,
      'codLocalDestino': instance.codLocalDestino,
      'codCirculante': instance.codCirculante,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'codRespKitIncomp': instance.codRespKitIncomp,
      'codRespQuebFluxo': instance.codRespQuebFluxo,
      'codRespDestinoNaoCompativel': instance.codRespDestinoNaoCompativel,
      'indicador': instance.indicador,
      'biologico': instance.biologico,
      'implantavel': instance.implantavel,
      'integradorKit': instance.integradorKit,
      'codEmbalagem': instance.codEmbalagem,
      'codItem': instance.codItem,
      'codKit': instance.codKit,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'codLeitura': instance.codLeitura,
      'codMotivo': instance.codMotivo,
      'codMotivoQuebraFluxo': instance.codMotivoQuebraFluxo,
      'statusKit': instance.statusKit,
      'observacao': instance.observacao,
      'kitLiberadoIncompleto': instance.kitLiberadoIncompleto,
      'lote': instance.lote,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'dataHoraInicio': instance.dataHoraInicio?.toIso8601String(),
      'cancelada': instance.cancelada,
    };
