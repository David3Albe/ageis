// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_atual_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAtualModelImpl _$$ProcessoLeituraAtualModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProcessoLeituraAtualModelImpl(
      cod: json['cod'] as int?,
      usuario: json['usuario'] == null
          ? null
          : UsuarioProcessoModel.fromJson(
              json['usuario'] as Map<String, dynamic>),
      instituicao: json['instituicao'] == null
          ? null
          : InstituicaoModel.fromJson(
              json['instituicao'] as Map<String, dynamic>),
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              json['equipamento'] as Map<String, dynamic>),
      acaoEmAndamento: json['acaoEmAndamento'] as int?,
      dataHoraInicioProcesso: json['dataHoraInicioProcesso'] == null
          ? null
          : DateTime.parse(json['dataHoraInicioProcesso'] as String),
      prioridade: json['prioridade'] as int?,
      decisao: json['decisao'] as int?,
      acao: json['acao'] as String?,
      respostaEPCEPI: json['respostaEPCEPI'] == null
          ? null
          : ProcessoRespostaEPCEPIModel.fromJson(
              json['respostaEPCEPI'] as Map<String, dynamic>),
      itemEmLeitura: json['itemEmLeitura'] == null
          ? null
          : ItemProcessoModel.fromJson(
              json['itemEmLeitura'] as Map<String, dynamic>),
      modoConsulta: json['modoConsulta'] as bool?,
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemProcessoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      kitEmLeitura: json['kitEmLeitura'] == null
          ? null
          : KitProcessoModel.fromJson(
              json['kitEmLeitura'] as Map<String, dynamic>),
      kits: (json['kits'] as List<dynamic>)
          .map((e) => KitProcessoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      circulante: json['circulante'] == null
          ? null
          : UsuarioModel.fromJson(json['circulante'] as Map<String, dynamic>),
      processoTipo: json['processoTipo'] == null
          ? null
          : ProcessoTipoModel.fromJson(
              json['processoTipo'] as Map<String, dynamic>),
      local: json['local'] == null
          ? null
          : LocalInstituicaoModel.fromJson(
              json['local'] as Map<String, dynamic>),
      configuracao: json['configuracao'] == null
          ? null
          : ParametroSistemaModel.fromJson(
              json['configuracao'] as Map<String, dynamic>),
      processoRegistro: json['processoRegistro'] == null
          ? null
          : ProcessoRegistroModel.fromJson(
              json['processoRegistro'] as Map<String, dynamic>),
      processoDetalheRegistro: json['processoDetalheRegistro'] == null
          ? null
          : ProcessoDetalheRegistroModel.fromJson(
              json['processoDetalheRegistro'] as Map<String, dynamic>),
      solicitaItemNaoConforme: json['solicitaItemNaoConforme'] as bool,
      solicitaKitNaoConforme: json['solicitaKitNaoConforme'] as bool,
      estoque: json['estoque'] == null
          ? null
          : ArsenalEstoqueModel.fromJson(
              json['estoque'] as Map<String, dynamic>),
      codMotivoRetornoArsenalItem: json['codMotivoRetornoArsenalItem'] as int?,
      motivoRetornoArsenalItem: json['motivoRetornoArsenalItem'] == null
          ? null
          : ProcessoMotivoModel.fromJson(
              json['motivoRetornoArsenalItem'] as Map<String, dynamic>),
      codMotivoRetornoArsenalKit: json['codMotivoRetornoArsenalKit'] as int?,
      motivoRetornoArsenalKit: json['motivoRetornoArsenalKit'] == null
          ? null
          : ProcessoMotivoModel.fromJson(
              json['motivoRetornoArsenalKit'] as Map<String, dynamic>),
      etapaFinalItem: json['etapaFinalItem'] as bool?,
      codUsuarioQuebraFluxo: json['codUsuarioQuebraFluxo'] as int?,
      usuarioQuebraFluxo: json['usuarioQuebraFluxo'] == null
          ? null
          : UsuarioProcessoModel.fromJson(
              json['usuarioQuebraFluxo'] as Map<String, dynamic>),
      codMotivoQuebraFluxo: json['codMotivoQuebraFluxo'] as int?,
      motivoQuebraFluxo: json['motivoQuebraFluxo'] == null
          ? null
          : MotivoQuebraFluxoModel.fromJson(
              json['motivoQuebraFluxo'] as Map<String, dynamic>),
      calculadora: json['calculadora'] == null
          ? null
          : CalculadoraBaseModel.fromJson(
              json['calculadora'] as Map<String, dynamic>),
      consignado: json['consignado'] == null
          ? null
          : ItemConsignadoBaseModel.fromJson(
              json['consignado'] as Map<String, dynamic>),
      conferidoVisualmente: json['conferidoVisualmente'] as bool?,
      impressaoPreparo: json['impressaoPreparo'] as String?,
      embalagemProcesso: EmbalagemProcessoModel.fromJson(
          json['embalagemProcesso'] as Map<String, dynamic>),
      integradorKitProcesso: IntegradorKitProcessoModel.fromJson(
          json['integradorKitProcesso'] as Map<String, dynamic>),
      conferenciaVisualProcesso: ConferenciaVisualProcessoModel.fromJson(
          json['conferenciaVisualProcesso'] as Map<String, dynamic>),
      liberaKitIncompletoProcesso: LiberaKitIncompletoProcessoModel.fromJson(
          json['liberaKitIncompletoProcesso'] as Map<String, dynamic>),
      etapas: (json['etapas'] as List<dynamic>?)
          ?.map((e) => ProcessoEtapaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      processoMotivos: (json['processoMotivos'] as List<dynamic>?)
          ?.map((e) => ProcessoMotivoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      processoMotivosQuebraFluxo: (json['processoMotivosQuebraFluxo']
              as List<dynamic>?)
          ?.map(
              (e) => MotivoQuebraFluxoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      usuarios: (json['usuarios'] as List<dynamic>?)
          ?.map((e) => UsuarioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      embalagens: (json['embalagens'] as List<dynamic>?)
          ?.map((e) => EmbalagemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      proprietarios: (json['proprietarios'] as List<dynamic>?)
          ?.map((e) => ProprietarioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      descritores: (json['descritores'] as List<dynamic>?)
          ?.map((e) => ItemDescritorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      indicadorProcesso: IndicadorProcessoModel.fromJson(
          json['indicadorProcesso'] as Map<String, dynamic>),
      indicadorBiologicoProcesso: IndicadorBiologicoProcessoModel.fromJson(
          json['indicadorBiologicoProcesso'] as Map<String, dynamic>),
      dataMatrixGeralLeitura: DataMatrixGeralLeituraModel.fromJson(
          json['dataMatrixGeralLeitura'] as Map<String, dynamic>),
      impressaoEtiquetaLote: json['impressaoEtiquetaLote'] as String?,
      impressaoRelatorioRetirada: json['impressaoRelatorioRetirada'] as String?,
      selecaoKitItem: json['selecaoKitItem'] == null
          ? null
          : SelecaoKitItemModel.fromJson(
              json['selecaoKitItem'] as Map<String, dynamic>),
      confirmaQuebraFluxoRemocaoArsenal:
          ConfirmaQuebraFluxoRemocaoArsenalModel.fromJson(
              json['confirmaQuebraFluxoRemocaoArsenal']
                  as Map<String, dynamic>),
      loteEquipamento: LoteEquipamentoModel.fromJson(
          json['loteEquipamento'] as Map<String, dynamic>),
      solicitaItemKitNaoConforme: json['solicitaItemKitNaoConforme'] as bool?,
      defineAcaoOcorrencia: json['defineAcaoOcorrencia'] == null
          ? null
          : DefineAcaoOcorrenciaModel.fromJson(
              json['defineAcaoOcorrencia'] as Map<String, dynamic>),
      acoesOcorrencia: (json['acoesOcorrencia'] as List<dynamic>)
          .map((e) => AcaoOcorrenciaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProcessoLeituraAtualModelImplToJson(
        _$ProcessoLeituraAtualModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'usuario': instance.usuario,
      'instituicao': instance.instituicao,
      'equipamento': instance.equipamento,
      'acaoEmAndamento': instance.acaoEmAndamento,
      'dataHoraInicioProcesso':
          instance.dataHoraInicioProcesso?.toIso8601String(),
      'prioridade': instance.prioridade,
      'decisao': instance.decisao,
      'acao': instance.acao,
      'respostaEPCEPI': instance.respostaEPCEPI,
      'itemEmLeitura': instance.itemEmLeitura,
      'modoConsulta': instance.modoConsulta,
      'itens': instance.itens,
      'kitEmLeitura': instance.kitEmLeitura,
      'kits': instance.kits,
      'circulante': instance.circulante,
      'processoTipo': instance.processoTipo,
      'local': instance.local,
      'configuracao': instance.configuracao,
      'processoRegistro': instance.processoRegistro,
      'processoDetalheRegistro': instance.processoDetalheRegistro,
      'solicitaItemNaoConforme': instance.solicitaItemNaoConforme,
      'solicitaKitNaoConforme': instance.solicitaKitNaoConforme,
      'estoque': instance.estoque,
      'codMotivoRetornoArsenalItem': instance.codMotivoRetornoArsenalItem,
      'motivoRetornoArsenalItem': instance.motivoRetornoArsenalItem,
      'codMotivoRetornoArsenalKit': instance.codMotivoRetornoArsenalKit,
      'motivoRetornoArsenalKit': instance.motivoRetornoArsenalKit,
      'etapaFinalItem': instance.etapaFinalItem,
      'codUsuarioQuebraFluxo': instance.codUsuarioQuebraFluxo,
      'usuarioQuebraFluxo': instance.usuarioQuebraFluxo,
      'codMotivoQuebraFluxo': instance.codMotivoQuebraFluxo,
      'motivoQuebraFluxo': instance.motivoQuebraFluxo,
      'calculadora': instance.calculadora,
      'consignado': instance.consignado,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'impressaoPreparo': instance.impressaoPreparo,
      'embalagemProcesso': instance.embalagemProcesso,
      'integradorKitProcesso': instance.integradorKitProcesso,
      'conferenciaVisualProcesso': instance.conferenciaVisualProcesso,
      'liberaKitIncompletoProcesso': instance.liberaKitIncompletoProcesso,
      'etapas': instance.etapas,
      'processoMotivos': instance.processoMotivos,
      'processoMotivosQuebraFluxo': instance.processoMotivosQuebraFluxo,
      'usuarios': instance.usuarios,
      'embalagens': instance.embalagens,
      'proprietarios': instance.proprietarios,
      'descritores': instance.descritores,
      'indicadorProcesso': instance.indicadorProcesso,
      'indicadorBiologicoProcesso': instance.indicadorBiologicoProcesso,
      'dataMatrixGeralLeitura': instance.dataMatrixGeralLeitura,
      'impressaoEtiquetaLote': instance.impressaoEtiquetaLote,
      'impressaoRelatorioRetirada': instance.impressaoRelatorioRetirada,
      'selecaoKitItem': instance.selecaoKitItem,
      'confirmaQuebraFluxoRemocaoArsenal':
          instance.confirmaQuebraFluxoRemocaoArsenal,
      'loteEquipamento': instance.loteEquipamento,
      'solicitaItemKitNaoConforme': instance.solicitaItemKitNaoConforme,
      'defineAcaoOcorrencia': instance.defineAcaoOcorrencia,
      'acoesOcorrencia': instance.acoesOcorrencia,
    };
