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
          codBarraKit: json['codBarraKit'] as String?,
          nomeKit: json['nomeKit'] as String?,
          nroItensFaltante: json['nroItensFaltante'] as int?,
          idEtiqueta: json['idEtiqueta'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          nomeEquipamento: json['nomeEquipamento'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          nomeTipoProcesso: json['nomeTipoProcesso'] as String?,
          prioridade: json['prioridade'] as String?,
          qtdeProcessos: json['qtdeProcessos'] as int?,
          nomeUsuario: json['nomeUsuario'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          conferidoVisualmente: json['conferidoVisualmente'] as String?,
          nomeRespKitIncomp: json['nomeRespKitIncomp'] as String?,
          nomeRespQuebFluxo: json['nomeRespQuebFluxo'] as String?,
          nomeRepDestinoNaoCompativel:
              json['nomeRepDestinoNaoCompativel'] as String?,
          indicador: json['indicador'] as String?,
          biologico: json['biologico'] as String?,
          implantavel: json['implantavel'] as String?,
          lote: json['lote'] as String?,
          integradorKit: json['integradorKit'] as String?,
          embalagem: json['embalagem'] as String?,
          codItem: json['codItem'] as int?,
          codKit2: json['codKit2'] as int?,
          codEtapaProcesso: json['codEtapaProcesso'] as int?,
          codLeitura: json['codLeitura'] as int?,
          motivo: json['motivo'] as String?,
          motivoQuebraFluxo: json['motivoQuebraFluxo'] as String?,
          observacao: json['observacao'] as String?,
          statusKit: json['statusKit'] as int?,
          restricaoKit: json['restricaoKit'] as String?,
          kitLiberadoIncompleto: json['kitLiberadoIncompleto'] as String?,
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
          cancelada: json['cancelada'] as bool?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraModelImplToJson(
        _$ConsultaProcessosLeituraModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'data': instance.data?.toIso8601String(),
      'hora': instance.hora,
      'codBarraKit': instance.codBarraKit,
      'nomeKit': instance.nomeKit,
      'nroItensFaltante': instance.nroItensFaltante,
      'idEtiqueta': instance.idEtiqueta,
      'descricaoItem': instance.descricaoItem,
      'nomeProprietario': instance.nomeProprietario,
      'entradaSaida': instance.entradaSaida,
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeEtapaProcesso': instance.nomeEtapaProcesso,
      'nomeTipoProcesso': instance.nomeTipoProcesso,
      'prioridade': instance.prioridade,
      'qtdeProcessos': instance.qtdeProcessos,
      'nomeUsuario': instance.nomeUsuario,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'origem': instance.origem,
      'destino': instance.destino,
      'circulante': instance.circulante,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'nomeRespKitIncomp': instance.nomeRespKitIncomp,
      'nomeRespQuebFluxo': instance.nomeRespQuebFluxo,
      'nomeRepDestinoNaoCompativel': instance.nomeRepDestinoNaoCompativel,
      'indicador': instance.indicador,
      'biologico': instance.biologico,
      'implantavel': instance.implantavel,
      'lote': instance.lote,
      'integradorKit': instance.integradorKit,
      'embalagem': instance.embalagem,
      'codItem': instance.codItem,
      'codKit2': instance.codKit2,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'codLeitura': instance.codLeitura,
      'motivo': instance.motivo,
      'motivoQuebraFluxo': instance.motivoQuebraFluxo,
      'observacao': instance.observacao,
      'statusKit': instance.statusKit,
      'restricaoKit': instance.restricaoKit,
      'kitLiberadoIncompleto': instance.kitLiberadoIncompleto,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'cancelada': instance.cancelada,
    };
