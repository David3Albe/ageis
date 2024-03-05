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
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado_saude_ocupacional_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_historico_colaborador/consulta_historico_colaborador_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_processo_resposta_epcepi/consulta_processo_resposta_epcepi_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/tipo_afastamento/tipo_afastamento_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page.dart';
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
// import 'package:ageiscme_admin/app/module/pages/insumo/insumo_solicitacao_consulta/insumo_solicitacao_consulta_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page.dart';
import 'package:ageiscme_admin/app/module/pages/login/login_page.dart';
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
import 'package:ageiscme_admin/app/module/pages/router_outlet/router_outlet.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:ageiscme_admin/app/module/guards/authentication_guard.dart';
import 'package:ageiscme_admin/app/module/guards/route_access_guard.dart';
import 'package:flutter/material.dart';

class AdminModule extends Module {
  ParallelRoute<dynamic> createParallelRoute(
    String route, {
    required Widget Function(BuildContext context) child,
  }) {
    return ParallelRoute.child(
      route,
      transition: TransitionType.noTransition,
      child: child,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/login',
      child: (context) => LoginPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/',
      child: (context) => const RouterOutletPage(),
      transition: TransitionType.noTransition,
      guards: [
        AuthenticationGuard(),
        RouteAccessGuard(),
      ],
      children: [
        createParallelRoute(
          '/home',
          child: (context) => const HomePage(),
        ),
        createParallelRoute(
          '/cadastro/alterar-senha',
          child: (context) => AlterarSenhaPage(),
        ),
        createParallelRoute(
          '/cadastro/centro-custo',
          child: (context) => CentroCustoPage(),
        ),
        createParallelRoute(
          'material/embalagem',
          child: (context) => EmbalagemPage(),
        ),
        createParallelRoute(
          'material/etiqueta',
          child: (context) => EtiquetaPage(),
        ),
        createParallelRoute(
          'insumo/destino-residuo',
          child: (context) => DestinoResiduoPage(),
        ),
        createParallelRoute(
          '/colaborador/tipo-afastamento',
          child: (context) => TipoAfastamentoPage(),
        ),
        createParallelRoute(
          '/equipamento/servico-tipo',
          child: (context) => ServicoTipoPage(),
        ),
        createParallelRoute(
          '/equipamento/peca',
          child: (context) => PecaPage(),
        ),
        createParallelRoute(
          '/material/tamanho',
          child: (context) => TamanhoPage(),
        ),
        createParallelRoute(
          '/processo/acao-ocorrencia',
          child: (context) => AcaoOcorrenciaPage(),
        ),
        createParallelRoute(
          '/material/unidade-medida',
          child: (context) => UnidadeMedidaPage(),
        ),
        createParallelRoute(
          '/insumo/fornecedor',
          child: (context) => FornecedorPage(),
        ),
        createParallelRoute(
          '/insumo/fabricante',
          child: (context) => FabricantePage(),
        ),
        createParallelRoute(
          '/cadastro/tipo-documento',
          child: (context) => TipoDocumentoPage(),
        ),
        createParallelRoute(
          '/material/motivo-remover-repor-item',
          child: (context) => MotivoRemoverReporItemPage(),
        ),
        createParallelRoute(
          '/processo/processo-motivo',
          child: (context) => ProcessoMotivoPage(),
        ),
        createParallelRoute(
          'processo/motivo-quebra-fluxo',
          child: (context) => MotivoQuebraFluxoPage(),
        ),
        createParallelRoute(
          '/biblioteca/gestao-contrato',
          child: (context) => GestaoContratoPage(),
        ),
        createParallelRoute(
          '/material/grupo-material',
          child: (context) => GrupoMaterialPage(),
        ),
        createParallelRoute(
          '/material/kit-cor',
          child: (context) => KitCorPage(),
        ),
        createParallelRoute(
          '/cadastro/local-instituicao',
          child: (context) => LocalInstituicaoPage(),
        ),
        createParallelRoute(
          '/arsenal/localizacao-arsenal',
          child: (context) => LocalizacaoArsenalPage(),
        ),
        createParallelRoute(
          '/cadastro/parametro-sistema',
          child: (context) => ParametroSistemaPage(),
        ),
        createParallelRoute(
          '/insumo/deposito',
          child: (context) => DepositoInsumoPage(),
        ),
        createParallelRoute(
          '/biblioteca/documento',
          child: (context) => DocumentoPage(),
        ),
        createParallelRoute(
          '/insumo/insumo',
          child: (context) => InsumoPage(),
        ),
        createParallelRoute(
          '/colaborador/epi-descritor',
          child: (context) => EpiDescritorPage(),
        ),
        createParallelRoute(
          '/colaborador/atestado-saude-ocupacional',
          child: (context) => AtestadoSaudeOcupacionalPage(),
        ),
        createParallelRoute(
          '/material/item-descritor',
          child: (context) => ItemDescritorPage(),
        ),
        createParallelRoute(
          '/processo/processo-etapa',
          child: (context) => ProcessoEtapaPage(),
        ),
        createParallelRoute(
          '/equipamento/registro-servico',
          child: (context) => RegistroServicoPage(),
        ),
        createParallelRoute(
          '/equipamento/equipamento-manutencao',
          child: (context) => EquipamentoManutencaoPage(),
        ),
        createParallelRoute(
          '/equipamento/equipamento',
          child: (context) => EquipamentoPage(),
        ),
        createParallelRoute(
          '/arsenal/arsenal',
          child: (context) => ArsenalEstoquePage(),
        ),
        createParallelRoute(
          '/cadastro/instituicao',
          child: (context) => InstituicaoPage(),
        ),
        createParallelRoute(
          '/colaborador/treinamento-registro',
          child: (context) => TreinamentoRegistroPage(),
        ),
        createParallelRoute(
          '/cadastro/usuario',
          child: (context) => UsuarioPage(),
        ),
        createParallelRoute(
          '/cadastro/proprietario',
          child: (context) => ProprietarioPage(),
        ),
        createParallelRoute(
          '/material/consulta-remover-repor-item',
          child: (context) => ConsultaRemoverReporItemPage(),
        ),
        createParallelRoute(
          '/material/item',
          child: (context) => const ItemPage(frmType: ItemPageFrmtype.Items),
        ),
        createParallelRoute(
          '/material/item-consignado',
          child: (context) =>
              const ItemPage(frmType: ItemPageFrmtype.Consigned),
        ),
        createParallelRoute(
          '/material/kit-descritor',
          child: (context) => KitDescritorPage(),
        ),
        createParallelRoute(
          '/material/kit',
          child: (context) => KitPage(),
        ),
        createParallelRoute(
          '/colaborador/epi-entrega',
          child: (context) => EpiEntregaPage(),
        ),
        createParallelRoute(
          '/equipamento/consulta-registro-servico',
          child: (context) => ConsultaRegistroServicoPage(),
        ),
        createParallelRoute(
          '/equipamento/consulta-manutencao',
          child: (context) => ConsultaManutencaoPage(),
        ),
        createParallelRoute(
          '/material/consulta-kit',
          child: (context) => ConsultaKitPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/material/consulta-kit-inventario',
          child: (context) => ConsultaKitInventarioPage(),
        ),
        createParallelRoute(
          '/insumo/consulta-movimento-estoque',
          child: (context) => ConsultaMovimentacaoEstoquePage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-disponivel',
          child: (context) => ConsultaEstoqueDisponivelPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processo-leitura-devolvido',
          child: (context) => ConsultaProcessosLeituraDevolvidoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-disponivel-rotulado',
          child: (context) => ConsultaEstoqueDisponivelRotuladoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-dispensado',
          child: (context) => LoadConsultaProcessosLeituraDispensadoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-retirado-div-local',
          child: (context) => ConsultaProcessosLeituraRetiradosDivLocalPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-vencido',
          child: (context) => ConsultaEstoqueVencidoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-retirado',
          child: (context) => ConsultaProcessosLeituraRetiradoPage(),
        ),
        createParallelRoute(
          '/colaborador/consulta-processo-resposta-ecp-epi',
          child: (context) => ConsultaProcessoRespostaEPCEPIPage(),
        ),
        createParallelRoute(
          '/insumo/consulta-insumo-saldo',
          child: (context) => ConsultaInsumoSaldoPage(),
        ),
        createParallelRoute(
          '/insumo/consulta-insumo-estoque',
          child: (context) => ConsultaInsumoEstoquePage(),
        ),
        createParallelRoute(
          '/material/consulta-item',
          child: (context) => ConsultaItemPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-acao-ocorrencia',
          child: (context) => ConsultaProcessosLeituraAcaoOcorrenciaPage(),
        ),
        createParallelRoute(
          '/biblioteca/consulta-documento',
          child: (context) => ConsultaDocumentoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-consignado',
          child: (context) => ConsultaProcessosConsignadoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura',
          child: (context) => ConsultaProcessosLeituraPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/colaborador/consulta-historico-colaborador',
          child: (context) => ConsultaHistoricoColaboradorPage(),
        ),
        createParallelRoute(
          '/material/consulta-item-inventario',
          child: (context) => ConsultaItemInventarioPage(),
        ),
        createParallelRoute(
          '/insumo/insumo-movimento',
          child: (context) => InsumoMovimentoPage(),
        ),
        createParallelRoute(
          '/processo/processo-tipo',
          child: (context) => ProcessoTipoPage(),
        ),
        createParallelRoute(
          '/material/consulta-item-etiqueta',
          child: (context) => ConsultaItemEtiquetaPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-tamanho',
          child: (context) => ConsultaProcessosLeituraTamanhoPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/cadastro/perfil-acesso',
          child: (context) => PerfilAcessoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-entrada-automatica',
          child: (context) => ConsultaProcessosleituraEntradaAutomaticaPage(),
        ),
        createParallelRoute(
          '/cadastro/imagem',
          child: (context) => ImagemPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processo-leitura-devolvido-sub',
          child: (context) => ConsultaProcessosLeituraDevolvidoSubPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-detalhe',
          child: (context) => ConsultaProcessoLeituraDetalhePage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-detalhe-kit',
          child: (context) => ConsultaProcessoLeituraDetalheKitPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/insumo/solicitacao-material',
          child: (context) => SolicitacaoMaterialPage(),
        ),
        createParallelRoute(
          '/processo/liberacao-leituras',
          child: (context) => LiberacaoLeiturasPresenterPage(),
        ),
        // createParallelRoute(
        //   '/insumo/insumo-solicitacao-consulta',
        //   // child: (context) => InsumoSolicitacaoConsultaPage(),
        // ),
      ],
    );
  }
}
