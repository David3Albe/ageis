import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_cancelamentos_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_etiqueta_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_padrao_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_prioridade_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_simNao_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_transferir_receber_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_widget/processo_etapa_page_frm_imprimir_funcoes_zoom_widget.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesPage extends StatefulWidget {
  const ProcessoEtapaPageFrmImprimirFuncoesPage({
    required this.stageCod,
    Key? key,
  }) : super(key: key);

  final int stageCod;

  @override
  State<ProcessoEtapaPageFrmImprimirFuncoesPage> createState() =>
      _ProcessoEtapaPageFrmImprimirFuncoesPageState();
}

class _ProcessoEtapaPageFrmImprimirFuncoesPageState
    extends State<ProcessoEtapaPageFrmImprimirFuncoesPage> {
  late final ProcessoEtapaPageFrmImprimirFuncoesController _controller;
  static const double DEFAULT_PADDING_TOP = 10;

  @override
  void initState() {
    _controller = ProcessoEtapaPageFrmImprimirFuncoesController(
      stageCod: widget.stageCod,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Opções da folha de comando'),
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 600,
          minHeight: 425,
          maxWidth: 800,
          minWidth: 600,
        ),
        height: size.height * .5,
        width: size.width * .7,
        child: BlocConsumer<ProcessoEtapaCubit, ProcessoEtapaState>(
          listener: (context, state) =>
              _controller.etapaCubitListener(context, state),
          bloc: _controller.etapaCubit,
          builder: (context, etapaState) {
            if (etapaState.loading) return const Center(child: LoadingWidget());
            ProcessoEtapaModel etapa = etapaState.processosEtapas.first;
            return BlocConsumer<EquipamentoCubit, EquipamentoState>(
              listener: (context, state) =>
                  _controller.equipamentoCubitListener(context, state),
              bloc: _controller.equipamentoCubit,
              builder: (context, equipamentoState) {
                return BlocConsumer<ArsenalEstoqueCubit, ArsenalEstoqueState>(
                  listener: (context, state) =>
                      _controller.estoqueCubitListener(context, state),
                  bloc: _controller.estoqueCubit,
                  builder: (context, estoqueState) {
                    if (equipamentoState.loading || estoqueState.loading) {
                      return const Center(child: LoadingWidget());
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ProcessoEtapaPageFrmImprimirFuncoesPadraoWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesPrioridadeWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesCancelamentosWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesSimNaoWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesEtiquetaWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesTransferirReceberWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: DEFAULT_PADDING_TOP),
                          ),
                          ProcessoEtapaPageFrmImprimirFuncoesZoomWidget(
                            etapa: etapa,
                            controller: _controller,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      actions: [
        PrintButtonWidget(
          onPressed: () => _controller.imprimir(context),
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => _controller.cancelarImpressao(context),
        ),
      ],
    );
  }
}
