// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_etapa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoEtapaModelImpl _$$ProcessoEtapaModelImplFromJson(Map json) =>
    _$ProcessoEtapaModelImpl(
      cod: json['cod'] as int?,
      codProcessoTipo: json['codProcessoTipo'] as int?,
      codEquipamento: json['codEquipamento'] as int?,
      codEstoque: json['codEstoque'] as int?,
      tempoCicloProcesso: json['tempoCicloProcesso'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      codServicoTipo: json['codServicoTipo'] as int?,
      codEstoqueAut: json['codEstoqueAut'] as int?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      descricaoEtiquetaPreparo: json['descricaoEtiquetaPreparo'] as String?,
      localizacaoX: (json['localizacaoX'] as num?)?.toDouble(),
      localizacaoY: (json['localizacaoY'] as num?)?.toDouble(),
      liberaKitIncompleto: json['liberaKitIncompleto'] as bool?,
      exigeLeituraEntrada: json['exigeLeituraEntrada'] as bool?,
      exigeLeituraSaida: json['exigeLeituraSaida'] as bool?,
      usuarioColocaNaoRetira: json['usuarioColocaNaoRetira'] as bool?,
      conferenciaVisualPermitida: json['conferenciaVisualPermitida'] as bool?,
      imprimirEtiquetaLote: json['imprimirEtiquetaLote'] as bool?,
      ativo: json['ativo'] as bool?,
      autorizaQuebraFluxo: json['autorizaQuebraFluxo'] as bool?,
      exigeTesteIndicador: json['exigeTesteIndicador'] as bool?,
      preparo: json['preparo'] as bool?,
      areaEsteril: json['areaEsteril'] as bool?,
      exigeEpcEntrada: json['exigeEpcEntrada'] as bool?,
      exigeEpcSaida: json['exigeEpcSaida'] as bool?,
      flag1: json['flag1'] as bool?,
      flag2: json['flag2'] as bool?,
      transfere: json['transfere'] as bool?,
      recebe: json['recebe'] as bool?,
      testeIndicadorEntrada: json['testeIndicadorEntrada'] as bool?,
      etiquetaSaida: json['etiquetaSaida'] as bool?,
      etiquetaEntrada: json['etiquetaEntrada'] as bool?,
      testeIndicadorSaida: json['testeIndicadorSaida'] as bool?,
      exigeLoteEquipamento: json['exigeLoteEquipamento'] as bool?,
      responsavelLocalNaoCompativel:
          json['responsavelLocalNaoCompativel'] as bool?,
      exigeTesteBiologico: json['exigeTesteBiologico'] as bool?,
      biologicoEntrada: json['biologicoEntrada'] as bool?,
      biologicoSaida: json['biologicoSaida'] as bool?,
      testeBiologicoEntrada: json['testeBiologicoEntrada'] as bool?,
      testeBiologicoSaida: json['testeBiologicoSaida'] as bool?,
      pacote: json['pacote'] as bool?,
      relatorioRetiradaMateriais: json['relatorioRetiradaMateriais'] as bool?,
      naoAlterarStatusItemPendente:
          json['naoAlterarStatusItemPendente'] as bool?,
      integradorKit: json['integradorKit'] as bool?,
      solicitacaoCirculante: json['solicitacaoCirculante'] as bool?,
      permiteLiberacaoDataMatrixComCrachaPreparo:
          json['permiteLiberacaoDataMatrixComCrachaPreparo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      tipoProcesso: json['tipoProcesso'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              Map<String, Object?>.from(json['tipoProcesso'] as Map)),
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      arsenal: json['arsenal'] == null
          ? null
          : ArsenalEstoqueModel.fromJson(
              Map<String, Object?>.from(json['arsenal'] as Map)),
      servicoTipo: json['servicoTipo'] == null
          ? null
          : ServicoTipoModel.fromJson(
              Map<String, Object?>.from(json['servicoTipo'] as Map)),
      sequencias: (json['sequencias'] as List<dynamic>?)
          ?.map((e) => ProcessoSequenciaModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ProcessoEtapaModelImplToJson(
        _$ProcessoEtapaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codProcessoTipo': instance.codProcessoTipo,
      'codEquipamento': instance.codEquipamento,
      'codEstoque': instance.codEstoque,
      'tempoCicloProcesso': instance.tempoCicloProcesso,
      'codInstituicao': instance.codInstituicao,
      'codServicoTipo': instance.codServicoTipo,
      'codEstoqueAut': instance.codEstoqueAut,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'descricaoEtiquetaPreparo': instance.descricaoEtiquetaPreparo,
      'localizacaoX': instance.localizacaoX,
      'localizacaoY': instance.localizacaoY,
      'liberaKitIncompleto': instance.liberaKitIncompleto,
      'exigeLeituraEntrada': instance.exigeLeituraEntrada,
      'exigeLeituraSaida': instance.exigeLeituraSaida,
      'usuarioColocaNaoRetira': instance.usuarioColocaNaoRetira,
      'conferenciaVisualPermitida': instance.conferenciaVisualPermitida,
      'imprimirEtiquetaLote': instance.imprimirEtiquetaLote,
      'ativo': instance.ativo,
      'autorizaQuebraFluxo': instance.autorizaQuebraFluxo,
      'exigeTesteIndicador': instance.exigeTesteIndicador,
      'preparo': instance.preparo,
      'areaEsteril': instance.areaEsteril,
      'exigeEpcEntrada': instance.exigeEpcEntrada,
      'exigeEpcSaida': instance.exigeEpcSaida,
      'flag1': instance.flag1,
      'flag2': instance.flag2,
      'transfere': instance.transfere,
      'recebe': instance.recebe,
      'testeIndicadorEntrada': instance.testeIndicadorEntrada,
      'etiquetaSaida': instance.etiquetaSaida,
      'etiquetaEntrada': instance.etiquetaEntrada,
      'testeIndicadorSaida': instance.testeIndicadorSaida,
      'exigeLoteEquipamento': instance.exigeLoteEquipamento,
      'responsavelLocalNaoCompativel': instance.responsavelLocalNaoCompativel,
      'exigeTesteBiologico': instance.exigeTesteBiologico,
      'biologicoEntrada': instance.biologicoEntrada,
      'biologicoSaida': instance.biologicoSaida,
      'testeBiologicoEntrada': instance.testeBiologicoEntrada,
      'testeBiologicoSaida': instance.testeBiologicoSaida,
      'pacote': instance.pacote,
      'relatorioRetiradaMateriais': instance.relatorioRetiradaMateriais,
      'naoAlterarStatusItemPendente': instance.naoAlterarStatusItemPendente,
      'integradorKit': instance.integradorKit,
      'solicitacaoCirculante': instance.solicitacaoCirculante,
      'permiteLiberacaoDataMatrixComCrachaPreparo':
          instance.permiteLiberacaoDataMatrixComCrachaPreparo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'tipoProcesso': instance.tipoProcesso?.toJson(),
      'equipamento': instance.equipamento?.toJson(),
      'arsenal': instance.arsenal?.toJson(),
      'servicoTipo': instance.servicoTipo?.toJson(),
      'sequencias': instance.sequencias?.map((e) => e.toJson()).toList(),
    };
