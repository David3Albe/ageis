import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_disponivel/consulta_estoque_disponivel_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_vencido/consulta_estoque_vencido_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_devolvido/consulta_processos_leitura_devolvido_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_devolvido/consulta_processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_dispensado/load_consulta_processos_leitura_dispensado_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_retirado/consulta_processos_leitura_retirado_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_tamanho/consulta_processos_leitura_tamanho_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/localizacao_arsenal/localizacao_arsenal_page.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/consulta_documento/consulta_documento_page.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/alterar_senha/alterar_senha_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/centro_custo/centro_custo_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/imagem/imagem_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/instituicao/instituicao_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/perfil_acesso/perfil_acesso_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/proprietario/proprietario_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/tipo_documento/tipo_documento_page.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/afastamento_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado_saude_ocupacional_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_historico_colaborador/consulta_historico_colaborador_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_processo_resposta_epcepi/consulta_processo_resposta_epcepi_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/escala_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/sigla/sigla_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/tipo_afastamento/tipo_afastamento_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/turno/turno_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/consulta_manutencao/consulta_manutencao_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/consulta_registro_servico/consulta_registro_servico_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/peca/peca_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_service_page.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/servico_tipo/servico_tipo_page.dart';
import 'package:ageiscme_admin/app/module/pages/home/home_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_insumo_estoque/consulta_insumo_estoque_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_insumo_saldo/consulta_insumo_saldo_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_movimentacao_estoque/consulta_movimentacao_estoque_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/deposito_insumo/deposito_insumo_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/destino_residuo/destino_residuo_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo/insumo_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/solicitacao_material_expedicoes_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item/consulta_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item_etiqueta/consulta_item_etiqueta_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item_inventario/consulta_item_inventario_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit/consulta_kit_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit_inventario/consulta_kit_inventario_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_remover_repor_item/consulta_remover_repor_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/embalagem/embalagem_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/etiqueta/etiqueta_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/grupo_material/grupo_material_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_cor/kit_cor_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/acao_ocorrencia/acao_ocorrencia_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/anormalidade_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/anormalidade_tipo_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cancelamento_preparo_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_anormalidade/consulta_anormalidade_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_consignado/consulta_processos_consignado_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe/consulta_processos_leitura_datalhe_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/liberacao_leituras/presenter/liberacao_leituras_presenter_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/motivo_quebra_fluxo/motivo_quebra_fluxo_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo/processo_tipo_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_consulta/processo_tipo_consulta_page.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:flutter/material.dart';

abstract class AdminNavigatorService {
  static void Function()? goingToHome;

  static bool ObrigatorioTrocaSenha = false;
  static void navigateTo(ItemMenuModel itemMenu, BuildContext context) {
    openRoute(itemMenu: itemMenu, context: context);
  }

  static void navigateToArguments(
    String route,
    BuildContext context,
    dynamic data,
  ) {
    openRouteArguments(
      route: route,
      context: context,
      data: data,
    );
  }

  static void navigateToHome() {
    ObrigatorioTrocaSenha = false;
    NavigatorService.navigateTo('/admin/home');
  }

  static void navigateToHomeValidaTrocaSenha(BuildContext context) {
    if (ObrigatorioTrocaSenha == true) {
      ToastUtils.showCustomToastNotice(
        context,
        'Obrigatório troca de senhas para acessar outras telas',
      );
      return;
    }
    if (goingToHome != null) goingToHome!();
    NavigatorService.navigateTo('/admin/home');
  }

  static void navigateToChangePassword({
    required String actualPassword,
  }) {
    ObrigatorioTrocaSenha = true;
    NavigatorService.navigateToArguments(
      '/admin/cadastro/alterar-senha',
      actualPassword,
    );
  }

  static void openRoute({
    required ItemMenuModel itemMenu,
    required BuildContext context,
  }) {
    if (ObrigatorioTrocaSenha == true) {
      ToastUtils.showCustomToastNotice(
        context,
        'Obrigatório troca de senhas para trocar de tela',
      );
      return;
    }
    String route = itemMenu.route + '/';
    Widget widget = getWidgetParams(data: null, route: route);
    ItemMenuModel? father = itemMenu.getFather();
    String text = father != null ? '${father.text} > ' : '';
    text += itemMenu.text;
    WindowsHelper.OpenDefaultWindows(
      widget: widget,
      title: text,
      theme: Theme.of(context),
    );
  }

  static void openRouteArguments({
    required String route,
    required BuildContext context,
    required dynamic data,
  }) {
    if (ObrigatorioTrocaSenha == true) {
      ToastUtils.showCustomToastNotice(
        context,
        'Obrigatório troca de senhas para trocar de tela',
      );
      return;
    }
    route += '/';
    route = route.replaceAll('/admin', '');
    Widget widget = getWidgetParams(data: data, route: route);
    WindowsHelper.OpenDefaultWindows(
      widget: widget,
      title: route,
      theme: Theme.of(context),
    );
  }

  static void navigateToModuleSelection() =>
      NavigatorService.navigateToModuleSelection();

  static Widget getWidgetParams({
    required String route,
    required final dynamic data,
  }) {
    switch (route) {
      case '/home/':
        return const HomePage();
      case '/cadastro/alterar-senha/':
        return AlterarSenhaPage(
          actualPassword: data,
        );
      case '/cadastro/centro-custo/':
        return const CentroCustoPage();
      case '/material/embalagem/':
        return const EmbalagemPage();
      case '/material/etiqueta/':
        return const EtiquetaPage();
      case '/insumo/destino-residuo/':
        return const DestinoResiduoPage();
      case '/colaborador/tipo-afastamento/':
        return const TipoAfastamentoPage();
      case '/equipamento/servico-tipo/':
        return const ServicoTipoPage();
      case '/equipamento/peca/':
        return const PecaPage();
      case '/material/tamanho/':
        return const TamanhoPage();
      case '/processo/acao-ocorrencia/':
        return const AcaoOcorrenciaPage();
      case '/material/unidade-medida/':
        return const UnidadeMedidaPage();
      case '/insumo/fornecedor/':
        return const FornecedorPage();
      case '/insumo/fabricante/':
        return const FabricantePage();
      case '/cadastro/tipo-documento/':
        return const TipoDocumentoPage();
      case '/material/motivo-remover-repor-item/':
        return const MotivoRemoverReporItemPage();
      case '/processo/processo-motivo/':
        return const ProcessoMotivoPage();
      case '/processo/motivo-quebra-fluxo/':
        return const MotivoQuebraFluxoPage();
      case '/biblioteca/gestao-contrato/':
        return const GestaoContratoPage();
      case '/material/grupo-material/':
        return const GrupoMaterialPage();
      case '/material/kit-cor/':
        return const KitCorPage();
      case '/cadastro/local-instituicao/':
        return const LocalInstituicaoPage();
      case '/arsenal/localizacao-arsenal/':
        return const LocalizacaoArsenalPage();
      case '/cadastro/parametro-sistema/':
        return const ParametroSistemaPage();
      case '/insumo/deposito/':
        return const DepositoInsumoPage();
      case '/biblioteca/documento/':
        return DocumentoPage(
          cod: data,
        );
      case '/insumo/insumo/':
        return const InsumoPage();
      case '/colaborador/epi-descritor/':
        return const EpiDescritorPage();
      case '/colaborador/atestado-saude-ocupacional/':
        return AtestadoSaudeOcupacionalPage(
          cod: data,
        );
      case '/colaborador/afastamento/':
        return AfastamentoPage(
          cod: data,
        );
      case '/material/item-descritor/':
        return const ItemDescritorPage();
      case '/processo/processo-etapa/':
        return const ProcessoEtapaPage();
      case '/equipamento/registro-servico/':
        return RegistroServicoPage(cod: data);
      case '/equipamento/equipamento-manutencao/':
        return EquipamentoManutencaoPage(cod: data);
      case '/equipamento/equipamento/':
        return const EquipamentoPage();
      case '/arsenal/arsenal/':
        return const ArsenalEstoquePage();
      case '/cadastro/instituicao/':
        return const InstituicaoPage();
      case '/colaborador/treinamento-registro/':
        return const TreinamentoRegistroPage();
      case '/cadastro/usuario/':
        return const UsuarioPage();
      case '/cadastro/proprietario/':
        return const ProprietarioPage();
      case '/material/consulta-remover-repor-item/':
        return const ConsultaRemoverReporItemPage();
      case '/material/item/':
        return const ItemPage(frmType: ItemPageFrmtype.Items);
      case '/material/item-consignado/':
        return const ItemPage(frmType: ItemPageFrmtype.Consigned);
      case '/material/kit-descritor/':
        return const KitDescritorPage();
      case '/material/kit/':
        return const KitPage();
      case '/colaborador/epi-entrega/':
        return EpiEntregaPage(
          codUsuario: data,
        );
      case '/equipamento/consulta-registro-servico/':
        return const ConsultaRegistroServicoPage();
      case '/equipamento/consulta-manutencao/':
        return const ConsultaManutencaoPage();
      case '/material/consulta-kit/':
        return ConsultaKitPage(
          filter: data,
        );
      case '/material/consulta-kit-inventario/':
        return const ConsultaKitInventarioPage();
      case '/insumo/consulta-movimento-estoque/':
        return ConsultaMovimentacaoEstoquePage(
          filter: data,
        );
      case '/arsenal/consulta-estoque-disponivel/':
        return const ConsultaEstoqueDisponivelPage();
      case '/arsenal/consulta-processo-leitura-devolvido/':
        return const ConsultaProcessosLeituraDevolvidoPage();
      case '/arsenal/consulta-estoque-disponivel-rotulado/':
        return const ConsultaEstoqueDisponivelRotuladoPage();
      case '/arsenal/consulta-processos-leitura-dispensado/':
        return const LoadConsultaProcessosLeituraDispensadoPage();
      case '/arsenal/consulta-processos-leitura-retirado-div-local/':
        return const ConsultaProcessosLeituraRetiradosDivLocalPage();
      case '/arsenal/consulta-estoque-vencido/':
        return const ConsultaEstoqueVencidoPage();
      case '/arsenal/consulta-processos-leitura-retirado/':
        return const ConsultaProcessosLeituraRetiradoPage();
      case '/colaborador/consulta-processo-resposta-ecp-epi/':
        return const ConsultaProcessoRespostaEPCEPIPage();
      case '/insumo/consulta-insumo-saldo/':
        return ConsultaInsumoSaldoPage(
          codInsumo: data,
        );
      case '/insumo/consulta-insumo-estoque/':
        return const ConsultaInsumoEstoquePage();
      case '/material/consulta-item/':
        return ConsultaItemPage(
          filter: data,
        );
      case '/processo/consulta-processo-leitura-acao-ocorrencia/':
        return const ConsultaProcessosLeituraAcaoOcorrenciaPage();
      case '/biblioteca/consulta-documento/':
        return const ConsultaDocumentoPage();
      case '/processo/consulta-processo-consignado/':
        return const ConsultaProcessosConsignadoPage();
      case '/processo/consulta-processo-leitura/':
        return ConsultaProcessosLeituraPage(
          filter: data,
        );
      case '/colaborador/consulta-historico-colaborador/':
        return const ConsultaHistoricoColaboradorPage();
      case '/material/consulta-item-inventario/':
        return const ConsultaItemInventarioPage();
      case '/insumo/insumo-movimento/':
        return const InsumoMovimentoPage();
      case '/processo/processo-tipo/':
        return const ProcessoTipoPage();
      case '/material/consulta-item-etiqueta/':
        return const ConsultaItemEtiquetaPage();
      case '/arsenal/consulta-processos-leitura-tamanho/':
        return ConsultaProcessosLeituraTamanhoPage(
          filter: data,
        );
      case '/cadastro/perfil-acesso/':
        return const PerfilAcessoPage();
      case '/processo/consulta-processo-leitura-entrada-automatica/':
        return const ConsultaProcessosleituraEntradaAutomaticaPage();
      case '/cadastro/imagem/':
        return const ImagemPage();
      case '/arsenal/consulta-processo-leitura-devolvido-sub/':
        return ConsultaProcessosLeituraDevolvidoSubPage(
          filter: data,
        );
      case '/processo/consulta-processo-leitura-detalhe/':
        return ConsultaProcessoLeituraDetalhePage(
          filter: data,
        );
      case '/processo/consulta-processo-leitura-detalhe-kit/':
        return ConsultaProcessoLeituraDetalheKitPage(
          filter: data,
        );
      case '/insumo/solicitacao-material/':
        return const SolicitacaoMaterialPage();
      case '/insumo/solicitacao-material-expedicoes/':
        return const SolicitacaoMaterialExpedicoesPage();
      case '/processo/liberacao-leituras/':
        return const LiberacaoLeiturasPresenterPage();
      case '/processo/cancelamento-preparo/':
        return const CancelamentoPreparoPage();
      case '/insumo/insumo-teste/':
        return const InsumoTestePage();
      case '/processo/processo-tipo-consulta/':
        return const ProcessoTipoConsultaPage();
      case '/processo/anormalidade-tipo/':
        return const AnormalidadeTipoPage();
      case '/processo/anormalidade/':
        return const AnormalidadePage();
      case '/processo/consulta-anormalidade/':
        return const ConsultaAnormalidadePage();
      case '/colaborador/sigla/':
        return const SiglaPage();
      case '/colaborador/turno/':
        return const TurnoPage();
      case '/colaborador/escala/':
        return const EscalaPage();
    }
    return const SizedBox();
  }
}
