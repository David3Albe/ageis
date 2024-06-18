// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_acao_ocorrencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraAcaoOcorrenciaModelImpl
    _$$ConsultaProcessosLeituraAcaoOcorrenciaModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraAcaoOcorrenciaModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codBarraKit: json['codBarraKit'] as String?,
          nomeKit: json['nomeKit'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          nomeEquipamento: json['nomeEquipamento'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          nomeTipoProcesso: json['nomeTipoProcesso'] as String?,
          prioridade: json['prioridade'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          nomeUsuarioLiberacao: json['nomeUsuarioLiberacao'] as String?,
          prontuario: json['prontuario'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          confVisual: json['confVisual'] as String?,
          nomeRespKitIncomp: json['nomeRespKitIncomp'] as String?,
          nomeRespQuebFluxo: json['nomeRespQuebFluxo'] as String?,
          indicador: json['indicador'] as String?,
          lote: json['lote'] as String?,
          embalagem: json['embalagem'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          codKit: (json['codKit'] as num?)?.toInt(),
          codEtapaProcesso: (json['codEtapaProcesso'] as num?)?.toInt(),
          codLeitura: (json['codLeitura'] as num?)?.toInt(),
          motivo: json['motivo'] as String?,
          motivoQuebraFluxo: json['motivoQuebraFluxo'] as String?,
          acaoOcorrencia: json['acaoOcorrencia'] as String?,
          tipoAcaoOcorrencia: json['tipoAcaoOcorrencia'] as String?,
          observacao: json['observacao'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraAcaoOcorrenciaModelImplToJson(
        _$ConsultaProcessosLeituraAcaoOcorrenciaModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codBarraKit': instance.codBarraKit,
      'nomeKit': instance.nomeKit,
      'idEtiqueta': instance.idEtiqueta,
      'descricaoItem': instance.descricaoItem,
      'nomeProprietario': instance.nomeProprietario,
      'entradaSaida': instance.entradaSaida,
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeEtapaProcesso': instance.nomeEtapaProcesso,
      'nomeTipoProcesso': instance.nomeTipoProcesso,
      'prioridade': instance.prioridade,
      'nomeUsuario': instance.nomeUsuario,
      'nomeUsuarioLiberacao': instance.nomeUsuarioLiberacao,
      'prontuario': instance.prontuario,
      'origem': instance.origem,
      'destino': instance.destino,
      'circulante': instance.circulante,
      'confVisual': instance.confVisual,
      'nomeRespKitIncomp': instance.nomeRespKitIncomp,
      'nomeRespQuebFluxo': instance.nomeRespQuebFluxo,
      'indicador': instance.indicador,
      'lote': instance.lote,
      'embalagem': instance.embalagem,
      'codItem': instance.codItem,
      'codKit': instance.codKit,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'codLeitura': instance.codLeitura,
      'motivo': instance.motivo,
      'motivoQuebraFluxo': instance.motivoQuebraFluxo,
      'acaoOcorrencia': instance.acaoOcorrencia,
      'tipoAcaoOcorrencia': instance.tipoAcaoOcorrencia,
      'observacao': instance.observacao,
    };
