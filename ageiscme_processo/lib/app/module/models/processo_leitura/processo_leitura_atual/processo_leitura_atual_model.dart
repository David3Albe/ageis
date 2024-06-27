import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/processo_detalhe_registro/processo_detalhe_registro_model.dart';
import 'package:ageiscme_models/models/processo_registro/processo_registro_model.dart';
import 'package:ageiscme_models/models/processo_resposta_epcepi/processo_resposta_epcepi_model.dart';
import 'package:ageiscme_processo/app/module/models/calculadora_base/calculadora_base_model.dart';
import 'package:ageiscme_processo/app/module/models/conferencia_visual_processo/conferencia_visual_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/confirma_quebra_fluxo_remocao_arsenal/confirma_quebra_fluxo_remocao_arsenal_model.dart';
import 'package:ageiscme_processo/app/module/models/data_matrix_geral_leitura/data_matrix_geral_leitura_model.dart';
import 'package:ageiscme_processo/app/module/models/define_acao_ocorrencia/define_acao_ocorrencia_model.dart';
import 'package:ageiscme_processo/app/module/models/embalagem_processo/embalagem_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/indicador_biologico_processo/indicador_biologico_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/indicador_processo/indicador_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/integrador_kit_processo/integrador_kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/item_consignado_base/item_consignado_base_model.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/libera_kit_incompleto_processo/libera_kit_incompleto_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/local_nao_compativel/local_nao_compativel_model.dart';
import 'package:ageiscme_processo/app/module/models/lote_equipamento/lote_equipamento_model.dart';
import 'package:ageiscme_processo/app/module/models/selecao_kit_item/selecao_kit_item_model.dart';
import 'package:ageiscme_processo/app/module/models/usuario_processo/usuario_processo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_atual_model.g.dart';
part 'processo_leitura_atual_model.freezed.dart';

@unfreezed
sealed class ProcessoLeituraAtualModel with _$ProcessoLeituraAtualModel {
  const ProcessoLeituraAtualModel._();

  factory ProcessoLeituraAtualModel({
    required int? cod,
    required UsuarioProcessoModel? usuario,
    required InstituicaoModel? instituicao,
    required EquipamentoModel? equipamento,
    required int? acaoEmAndamento,
    required DateTime? dataHoraInicioProcesso,
    required int? prioridade,
    required int? decisao,
    required String? acao,
    required ProcessoRespostaEPCEPIModel? respostaEPCEPI,
    required ItemProcessoModel? itemEmLeitura,
    required bool? modoConsulta,
    required List<ItemProcessoModel> itens,
    required KitProcessoModel? kitEmLeitura,
    required List<KitProcessoModel> kits,
    required UsuarioProcessoModel? circulante,
    required ProcessoTipoModel? processoTipo,
    required LocalInstituicaoModel? local,
    required ParametroSistemaModel? configuracao,
    required ProcessoRegistroModel? processoRegistro,
    required ProcessoDetalheRegistroModel? processoDetalheRegistro,
    required bool solicitaItemNaoConforme,
    required bool solicitaKitNaoConforme,
    required ArsenalEstoqueModel? estoque,
    required int? codMotivoRetornoArsenalItem,
    required ProcessoMotivoModel? motivoRetornoArsenalItem,
    required int? codMotivoRetornoArsenalKit,
    required ProcessoMotivoModel? motivoRetornoArsenalKit,
    required bool? etapaFinalItem,
    required int? codUsuarioQuebraFluxo,
    required UsuarioProcessoModel? usuarioQuebraFluxo,
    required int? codMotivoQuebraFluxo,
    required MotivoQuebraFluxoModel? motivoQuebraFluxo,
    required CalculadoraBaseModel? calculadora,
    required ItemConsignadoBaseModel? consignado,
    required bool? conferidoVisualmente,
    required String? impressaoPreparo,
    required EmbalagemProcessoModel embalagemProcesso,
    required IntegradorKitProcessoModel integradorKitProcesso,
    required ConferenciaVisualProcessoModel conferenciaVisualProcesso,
    required LiberaKitIncompletoProcessoModel liberaKitIncompletoProcesso,
    required List<ProcessoEtapaModel>? etapas,
    required List<ProcessoMotivoModel>? processoMotivos,
    required List<MotivoQuebraFluxoModel>? processoMotivosQuebraFluxo,
    required List<UsuarioProcessoModel>? usuarios,
    required List<EmbalagemModel>? embalagens,
    required List<ProprietarioModel>? proprietarios,
    required List<ItemDescritorModel>? descritores,
    required IndicadorProcessoModel indicadorProcesso,
    required IndicadorBiologicoProcessoModel indicadorBiologicoProcesso,
    required DataMatrixGeralLeituraModel dataMatrixGeralLeitura,
    required String? impressaoEtiquetaLote,
    required String? impressaoRelatorioRetirada,
    required SelecaoKitItemModel? selecaoKitItem,
    required ConfirmaQuebraFluxoRemocaoArsenalModel
        confirmaQuebraFluxoRemocaoArsenal,
    required LoteEquipamentoModel loteEquipamento,
    required bool? solicitaItemKitNaoConforme,
    required DefineAcaoOcorrenciaModel? defineAcaoOcorrencia,
    required List<AcaoOcorrenciaModel> acoesOcorrencia,
    required LocalNaoCompativelModel localNaoCompativel,
  }) = _ProcessoLeituraAtualModel;

  factory ProcessoLeituraAtualModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAtualModelFromJson(json);

  static ProcessoLeituraAtualModel copy(
    ProcessoLeituraAtualModel processoLeitura,
  ) =>
      ProcessoLeituraAtualModel.fromJson(processoLeitura.toJson());

  factory ProcessoLeituraAtualModel.empty() => ProcessoLeituraAtualModel(
        cod: 0,
        usuario: null,
        instituicao: null,
        equipamento: null,
        acaoEmAndamento: null,
        dataHoraInicioProcesso: null,
        decisao: null,
        prioridade: null,
        acao: null,
        respostaEPCEPI: null,
        itemEmLeitura: null,
        kitEmLeitura: null,
        modoConsulta: null,
        itens: [],
        kits: [],
        circulante: null,
        processoTipo: null,
        local: null,
        configuracao: null,
        processoRegistro: null,
        processoDetalheRegistro: null,
        solicitaItemKitNaoConforme: null,
        solicitaItemNaoConforme: true,
        solicitaKitNaoConforme: true,
        codMotivoRetornoArsenalItem: null,
        codMotivoRetornoArsenalKit: null,
        estoque: null,
        motivoRetornoArsenalItem: null,
        motivoRetornoArsenalKit: null,
        codMotivoQuebraFluxo: null,
        codUsuarioQuebraFluxo: null,
        etapaFinalItem: null,
        motivoQuebraFluxo: null,
        usuarioQuebraFluxo: null,
        calculadora: null,
        consignado: null,
        conferidoVisualmente: null,
        impressaoPreparo: null,
        embalagemProcesso: EmbalagemProcessoModel(),
        integradorKitProcesso: IntegradorKitProcessoModel(),
        conferenciaVisualProcesso: ConferenciaVisualProcessoModel(),
        liberaKitIncompletoProcesso: LiberaKitIncompletoProcessoModel(),
        etapas: [],
        processoMotivos: [],
        usuarios: [],
        embalagens: [],
        proprietarios: [],
        descritores: [],
        indicadorProcesso: IndicadorProcessoModel(),
        indicadorBiologicoProcesso: IndicadorBiologicoProcessoModel(),
        dataMatrixGeralLeitura: DataMatrixGeralLeituraModel(),
        impressaoEtiquetaLote: null,
        impressaoRelatorioRetirada: null,
        selecaoKitItem: null,
        confirmaQuebraFluxoRemocaoArsenal:
            ConfirmaQuebraFluxoRemocaoArsenalModel(),
        loteEquipamento: LoteEquipamentoModel(),
        processoMotivosQuebraFluxo: [],
        defineAcaoOcorrencia: null,
        acoesOcorrencia: [],
        localNaoCompativel: LocalNaoCompativelModel(confirmou: false),
      );

  void adicionarMotivo(ProcessoMotivoModel? motivo) {
    if (motivo == null || processoMotivos == null) return;
    if (processoMotivos!
            .where((element) => element.cod == motivo.cod)
            .firstOrNull !=
        null) return;
    processoMotivos?.add(motivo);
  }

  void adicionarMotivoAcaoOcorrencia(AcaoOcorrenciaModel? motivo) {
    if (motivo == null) return;
    if (acoesOcorrencia
            .where((element) => element.cod == motivo.cod)
            .firstOrNull !=
        null) return;
    acoesOcorrencia.add(motivo);
  }

  void adicionarMotivoQuebraFluxo(MotivoQuebraFluxoModel? motivo) {
    if (motivo == null || processoMotivosQuebraFluxo == null) return;
    if (processoMotivosQuebraFluxo!
            .where((element) => element.cod == motivo.cod)
            .firstOrNull !=
        null) return;
    processoMotivosQuebraFluxo?.add(motivo);
  }
}
