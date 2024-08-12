// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemProcessoModelImpl _$$ItemProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemProcessoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      idEtiqueta: json['idEtiqueta'] as String?,
      descricao: json['descricao'] as String?,
      status: json['status'] as String?,
      informacoesResponsavelPendenteKit:
          json['informacoesResponsavelPendenteKit'] as String?,
      restricao: json['restricao'] as String?,
      codDescritor: (json['codDescritor'] as num?)?.toInt(),
      codProprietario: (json['codProprietario'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      codProcessoLeitura: (json['codProcessoLeitura'] as num?)?.toInt(),
      codEmbalagem: (json['codEmbalagem'] as num?)?.toInt(),
      codEtiqueta: (json['codEtiqueta'] as num?)?.toInt(),
      pendenteRecepcao: (json['pendenteRecepcao'] as num?)?.toInt(),
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      rmsValidade: json['rmsValidade'] == null
          ? null
          : DateTime.parse(json['rmsValidade'] as String),
      etiqueta: json['etiqueta'] == null
          ? null
          : EtiquetaModel.fromJson(json['etiqueta'] as Map<String, dynamic>),
      tstamp: json['tStamp'] as String?,
      codMotivoNaoConforme: (json['codMotivoNaoConforme'] as num?)?.toInt(),
      dataValidadeRetornoArsenal: json['dataValidadeRetornoArsenal'] == null
          ? null
          : DateTime.parse(json['dataValidadeRetornoArsenal'] as String),
      codEtapa: (json['codEtapa'] as num?)?.toInt(),
      validacoesCompletas: (json['validacoesCompletas'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      codMotivoRetornoArsenal:
          (json['codMotivoRetornoArsenal'] as num?)?.toInt(),
      codUsuarioQuebraFluxo: (json['codUsuarioQuebraFluxo'] as num?)?.toInt(),
      codMotivoQuebraFluxo: (json['codMotivoQuebraFluxo'] as num?)?.toInt(),
      codMotivoRemocaoItemKitArsenal:
          (json['codMotivoRemocaoItemKitArsenal'] as num?)?.toInt(),
      codMotivoRemocaoItemArsenal:
          (json['codMotivoRemocaoItemArsenal'] as num?)?.toInt(),
      calculadora: json['calculadora'] == null
          ? null
          : CalculadoraItemModel.fromJson(
              json['calculadora'] as Map<String, dynamic>),
      prioridade: (json['prioridade'] as num?)?.toInt(),
      itensConsignados: (json['itensConsignados'] as List<dynamic>?)
          ?.map((e) => ItemConsignadoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sequenciaValida: json['sequenciaValida'] as bool?,
      consignadosJaConferidos: json['consignadosJaConferidos'] as bool?,
      lido: json['lido'] as bool?,
      selecionado: json['selecionado'] as bool?,
      implantavel: json['implantavel'] as bool?,
      refFornecedor: json['refFornecedor'] as String?,
      responsavelPendenteKit: (json['responsavelPendenteKit'] as num?)?.toInt(),
      dataHoraPendenteKit: json['dataHoraPendenteKit'] == null
          ? null
          : DateTime.parse(json['dataHoraPendenteKit'] as String),
      impressaoPreparoRealizada: json['impressaoPreparoRealizada'] as bool?,
      qtdeProcessos: (json['qtdeProcessos'] as num?)?.toInt(),
      dataMatrixDanificado: json['dataMatrixDanificado'] == null
          ? null
          : DataMatrixDanificadoProcessoModel.fromJson(
              json['dataMatrixDanificado'] as Map<String, dynamic>),
      ordemLeitura: (json['ordemLeitura'] as num?)?.toInt(),
      impressaoEtiquetaLoteRealizada:
          json['impressaoEtiquetaLoteRealizada'] as bool?,
      impressaoRelatorioRetiradaRealizada:
          json['impressaoRelatorioRetiradaRealizada'] as bool?,
      codUsuarioAcaoOcorrencia:
          (json['codUsuarioAcaoOcorrencia'] as num?)?.toInt(),
      codAcaoOcorrencia: (json['codAcaoOcorrencia'] as num?)?.toInt(),
      codLocalizacaoEstoque: (json['codLocalizacaoEstoque'] as num?)?.toInt(),
      confirmouLocalNaoCompativel: json['confirmouLocalNaoCompativel'] as bool?,
    );

Map<String, dynamic> _$$ItemProcessoModelImplToJson(
        _$ItemProcessoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
      'status': instance.status,
      'informacoesResponsavelPendenteKit':
          instance.informacoesResponsavelPendenteKit,
      'restricao': instance.restricao,
      'codDescritor': instance.codDescritor,
      'codProprietario': instance.codProprietario,
      'codKit': instance.codKit,
      'codInstituicao': instance.codInstituicao,
      'codProcessoLeitura': instance.codProcessoLeitura,
      'codEmbalagem': instance.codEmbalagem,
      'codEtiqueta': instance.codEtiqueta,
      'pendenteRecepcao': instance.pendenteRecepcao,
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'rmsValidade': instance.rmsValidade?.toIso8601String(),
      'etiqueta': instance.etiqueta,
      'tStamp': instance.tstamp,
      'codMotivoNaoConforme': instance.codMotivoNaoConforme,
      'dataValidadeRetornoArsenal':
          instance.dataValidadeRetornoArsenal?.toIso8601String(),
      'codEtapa': instance.codEtapa,
      'validacoesCompletas': instance.validacoesCompletas,
      'codMotivoRetornoArsenal': instance.codMotivoRetornoArsenal,
      'codUsuarioQuebraFluxo': instance.codUsuarioQuebraFluxo,
      'codMotivoQuebraFluxo': instance.codMotivoQuebraFluxo,
      'codMotivoRemocaoItemKitArsenal': instance.codMotivoRemocaoItemKitArsenal,
      'codMotivoRemocaoItemArsenal': instance.codMotivoRemocaoItemArsenal,
      'calculadora': instance.calculadora,
      'prioridade': instance.prioridade,
      'itensConsignados': instance.itensConsignados,
      'sequenciaValida': instance.sequenciaValida,
      'consignadosJaConferidos': instance.consignadosJaConferidos,
      'lido': instance.lido,
      'selecionado': instance.selecionado,
      'implantavel': instance.implantavel,
      'refFornecedor': instance.refFornecedor,
      'responsavelPendenteKit': instance.responsavelPendenteKit,
      'dataHoraPendenteKit': instance.dataHoraPendenteKit?.toIso8601String(),
      'impressaoPreparoRealizada': instance.impressaoPreparoRealizada,
      'qtdeProcessos': instance.qtdeProcessos,
      'dataMatrixDanificado': instance.dataMatrixDanificado,
      'ordemLeitura': instance.ordemLeitura,
      'impressaoEtiquetaLoteRealizada': instance.impressaoEtiquetaLoteRealizada,
      'impressaoRelatorioRetiradaRealizada':
          instance.impressaoRelatorioRetiradaRealizada,
      'codUsuarioAcaoOcorrencia': instance.codUsuarioAcaoOcorrencia,
      'codAcaoOcorrencia': instance.codAcaoOcorrencia,
      'codLocalizacaoEstoque': instance.codLocalizacaoEstoque,
      'confirmouLocalNaoCompativel': instance.confirmouLocalNaoCompativel,
    };
