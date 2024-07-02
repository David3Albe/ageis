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
// import 'package:ageiscme_admin/app/module/pages/insumo/insumo_solicitacao_consulta/insumo_solicitacao_consulta_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/solicitacao_material_expedicoes_page.dart';
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
          child: (context) => AlterarSenhaPage(
            actualPassword: r.args.data,
          ),
        ),
        createParallelRoute(
          '/cadastro/centro-custo',
          child: (context) => const CentroCustoPage(),
        ),
        createParallelRoute(
          'material/embalagem',
          child: (context) => const EmbalagemPage(),
        ),
        createParallelRoute(
          'material/etiqueta',
          child: (context) => const EtiquetaPage(),
        ),
        createParallelRoute(
          'insumo/destino-residuo',
          child: (context) => const DestinoResiduoPage(),
        ),
        createParallelRoute(
          '/colaborador/tipo-afastamento',
          child: (context) => const TipoAfastamentoPage(),
        ),
        createParallelRoute(
          '/equipamento/servico-tipo',
          child: (context) => const ServicoTipoPage(),
        ),
        createParallelRoute(
          '/equipamento/peca',
          child: (context) => const PecaPage(),
        ),
        createParallelRoute(
          '/material/tamanho',
          child: (context) => const TamanhoPage(),
        ),
        createParallelRoute(
          '/processo/acao-ocorrencia',
          child: (context) => const AcaoOcorrenciaPage(),
        ),
        createParallelRoute(
          '/material/unidade-medida',
          child: (context) => const UnidadeMedidaPage(),
        ),
        createParallelRoute(
          '/insumo/fornecedor',
          child: (context) => const FornecedorPage(),
        ),
        createParallelRoute(
          '/insumo/fabricante',
          child: (context) => const FabricantePage(),
        ),
        createParallelRoute(
          '/cadastro/tipo-documento',
          child: (context) => const TipoDocumentoPage(),
        ),
        createParallelRoute(
          '/material/motivo-remover-repor-item',
          child: (context) => const MotivoRemoverReporItemPage(),
        ),
        createParallelRoute(
          '/processo/processo-motivo',
          child: (context) => const ProcessoMotivoPage(),
        ),
        createParallelRoute(
          'processo/motivo-quebra-fluxo',
          child: (context) => const MotivoQuebraFluxoPage(),
        ),
        createParallelRoute(
          '/biblioteca/gestao-contrato',
          child: (context) => const GestaoContratoPage(),
        ),
        createParallelRoute(
          '/material/grupo-material',
          child: (context) => const GrupoMaterialPage(),
        ),
        createParallelRoute(
          '/material/kit-cor',
          child: (context) => const KitCorPage(),
        ),
        createParallelRoute(
          '/cadastro/local-instituicao',
          child: (context) => const LocalInstituicaoPage(),
        ),
        createParallelRoute(
          '/arsenal/localizacao-arsenal',
          child: (context) => const LocalizacaoArsenalPage(),
        ),
        createParallelRoute(
          '/cadastro/parametro-sistema',
          child: (context) => const ParametroSistemaPage(),
        ),
        createParallelRoute(
          '/insumo/deposito',
          child: (context) => const DepositoInsumoPage(),
        ),
        createParallelRoute(
          '/biblioteca/documento',
          child: (context) => DocumentoPage(
            cod: r.args.data,
          ),
        ),
        createParallelRoute(
          '/insumo/insumo',
          child: (context) => const InsumoPage(),
        ),
        createParallelRoute(
          '/colaborador/epi-descritor',
          child: (context) => const EpiDescritorPage(),
        ),
        createParallelRoute(
          '/colaborador/atestado-saude-ocupacional',
          child: (context) => AtestadoSaudeOcupacionalPage(
            cod: r.args.data,
          ),
        ),
        createParallelRoute(
          '/colaborador/afastamento',
          child: (context) => AfastamentoPage(
            cod: r.args.data,
          ),
        ),
        createParallelRoute(
          '/material/item-descritor',
          child: (context) => const ItemDescritorPage(),
        ),
        createParallelRoute(
          '/processo/processo-etapa',
          child: (context) => const ProcessoEtapaPage(),
        ),
        createParallelRoute(
          '/equipamento/registro-servico',
          child: (context) => RegistroServicoPage(cod: r.args.data),
        ),
        createParallelRoute(
          '/equipamento/equipamento-manutencao',
          child: (context) => EquipamentoManutencaoPage(
            cod: r.args.data,
          ),
        ),
        createParallelRoute(
          '/equipamento/equipamento',
          child: (context) => const EquipamentoPage(),
        ),
        createParallelRoute(
          '/arsenal/arsenal',
          child: (context) => const ArsenalEstoquePage(),
        ),
        createParallelRoute(
          '/cadastro/instituicao',
          child: (context) => const InstituicaoPage(),
        ),
        createParallelRoute(
          '/colaborador/treinamento-registro',
          child: (context) => const TreinamentoRegistroPage(),
        ),
        createParallelRoute(
          '/cadastro/usuario',
          child: (context) => const UsuarioPage(),
        ),
        createParallelRoute(
          '/cadastro/proprietario',
          child: (context) => const ProprietarioPage(),
        ),
        createParallelRoute(
          '/material/consulta-remover-repor-item',
          child: (context) => const ConsultaRemoverReporItemPage(),
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
          child: (context) => const KitDescritorPage(),
        ),
        createParallelRoute(
          '/material/kit',
          child: (context) => const KitPage(),
        ),
        createParallelRoute(
          '/colaborador/epi-entrega',
          child: (context) => EpiEntregaPage(
            codUsuario: r.args.data,
          ),
        ),
        createParallelRoute(
          '/equipamento/consulta-registro-servico',
          child: (context) => const ConsultaRegistroServicoPage(),
        ),
        createParallelRoute(
          '/equipamento/consulta-manutencao',
          child: (context) => const ConsultaManutencaoPage(),
        ),
        createParallelRoute(
          '/material/consulta-kit',
          child: (context) => ConsultaKitPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/material/consulta-kit-inventario',
          child: (context) => const ConsultaKitInventarioPage(),
        ),
        createParallelRoute(
          '/insumo/consulta-movimento-estoque',
          child: (context) => ConsultaMovimentacaoEstoquePage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-disponivel',
          child: (context) => const ConsultaEstoqueDisponivelPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processo-leitura-devolvido',
          child: (context) => const ConsultaProcessosLeituraDevolvidoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-disponivel-rotulado',
          child: (context) => const ConsultaEstoqueDisponivelRotuladoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-dispensado',
          child: (context) =>
              const LoadConsultaProcessosLeituraDispensadoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-retirado-div-local',
          child: (context) =>
              const ConsultaProcessosLeituraRetiradosDivLocalPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-estoque-vencido',
          child: (context) => const ConsultaEstoqueVencidoPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-retirado',
          child: (context) => const ConsultaProcessosLeituraRetiradoPage(),
        ),
        createParallelRoute(
          '/colaborador/consulta-processo-resposta-ecp-epi',
          child: (context) => const ConsultaProcessoRespostaEPCEPIPage(),
        ),
        createParallelRoute(
          '/insumo/consulta-insumo-saldo',
          child: (context) => ConsultaInsumoSaldoPage(
            codInsumo: r.args.data,
          ),
        ),
        createParallelRoute(
          '/insumo/consulta-insumo-estoque',
          child: (context) => const ConsultaInsumoEstoquePage(),
        ),
        createParallelRoute(
          '/material/consulta-item',
          child: (context) => ConsultaItemPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-acao-ocorrencia',
          child: (context) =>
              const ConsultaProcessosLeituraAcaoOcorrenciaPage(),
        ),
        createParallelRoute(
          '/biblioteca/consulta-documento',
          child: (context) => const ConsultaDocumentoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-consignado',
          child: (context) => const ConsultaProcessosConsignadoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura',
          child: (context) => ConsultaProcessosLeituraPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/colaborador/consulta-historico-colaborador',
          child: (context) => const ConsultaHistoricoColaboradorPage(),
        ),
        createParallelRoute(
          '/material/consulta-item-inventario',
          child: (context) => const ConsultaItemInventarioPage(),
        ),
        createParallelRoute(
          '/insumo/insumo-movimento',
          child: (context) => const InsumoMovimentoPage(),
        ),
        createParallelRoute(
          '/processo/processo-tipo',
          child: (context) => const ProcessoTipoPage(),
        ),
        createParallelRoute(
          '/material/consulta-item-etiqueta',
          child: (context) => const ConsultaItemEtiquetaPage(),
        ),
        createParallelRoute(
          '/arsenal/consulta-processos-leitura-tamanho',
          child: (context) => ConsultaProcessosLeituraTamanhoPage(
            filter: r.args.data,
          ),
        ),
        createParallelRoute(
          '/cadastro/perfil-acesso',
          child: (context) => const PerfilAcessoPage(),
        ),
        createParallelRoute(
          '/processo/consulta-processo-leitura-entrada-automatica',
          child: (context) =>
              const ConsultaProcessosleituraEntradaAutomaticaPage(),
        ),
        createParallelRoute(
          '/cadastro/imagem',
          child: (context) => const ImagemPage(),
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
          child: (context) => const SolicitacaoMaterialPage(),
        ),
        createParallelRoute(
          '/insumo/solicitacao-material-expedicoes',
          child: (context) => const SolicitacaoMaterialExpedicoesPage(),
        ),
        createParallelRoute(
          '/processo/liberacao-leituras',
          child: (context) => const LiberacaoLeiturasPresenterPage(),
        ),
        createParallelRoute(
          '/processo/cancelamento-preparo',
          child: (context) => const CancelamentoPreparoPage(),
        ),
        createParallelRoute(
          '/insumo/insumo-teste',
          child: (context) => const InsumoTestePage(),
        ),
        createParallelRoute(
          '/processo/processo-tipo-consulta',
          child: (context) => const ProcessoTipoConsultaPage(),
        ),
        createParallelRoute(
          '/processo/anormalidade-tipo',
          child: (context) => const AnormalidadeTipoPage(),
        ),
        createParallelRoute(
          '/processo/anormalidade',
          child: (context) => const AnormalidadePage(),
        ),
        createParallelRoute(
          '/processo/consulta-anormalidade',
          child: (context) => const ConsultaAnormalidadePage(),
        ),
        createParallelRoute(
          '/colaborador/sigla',
          child: (context) => const SiglaPage(),
        ),
        createParallelRoute(
          '/colaborador/turno',
          child: (context) => const TurnoPage(),
        ),
        createParallelRoute(
          '/colaborador/escala',
          child: (context) => const EscalaPage(),
        ),
      ],
    );
  }
}
