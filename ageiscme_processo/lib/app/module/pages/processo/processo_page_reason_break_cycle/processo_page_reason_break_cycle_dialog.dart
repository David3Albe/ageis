import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/motivo_quebra_fluxo_cubit.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageReasonBreakCycleDialog extends StatefulWidget {
  const ProcessoPageReasonBreakCycleDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageReasonBreakCycleDialog> createState() =>
      _ProcessoPageReasonBreakCycleDialogState();
}

class _ProcessoPageReasonBreakCycleDialogState
    extends State<ProcessoPageReasonBreakCycleDialog> {
  late final MotivoQuebraFluxoCubit motivoQuebraFluxoCubit;
  MotivoQuebraFluxoModel? motivo;
  late final ProcessoLeituraMontagemModel leitura;

  @override
  void initState() {
    motivoQuebraFluxoCubit = MotivoQuebraFluxoCubit();
    motivoQuebraFluxoCubit.loadAll();
    leitura = widget.processoLeitura;
    super.initState();
  }

  @override
  void dispose() {
    motivoQuebraFluxoCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Quebra de Fluxo'),
      content: Container(
        height: size.height * .4,
        width: size.width * .4,
        child: Column(
          children: [
            BlocBuilder<MotivoQuebraFluxoCubit, MotivoQuebraFluxoState>(
              bloc: motivoQuebraFluxoCubit,
              builder: (context, state) {
                if (state.loading) return const Center(child: LoadingWidget());
                List<MotivoQuebraFluxoModel> motivos = state.motivos
                    .where((element) => element.ativo == true)
                    .toList();
                motivos.sort(
                  (item, itemb) =>
                      (item.descricao ?? '').compareTo(itemb.descricao ?? ''),
                );
                motivo;
                if (leitura.leituraAtual.codMotivoQuebraFluxo != null) {
                  motivo = motivos
                      .where(
                        (element) =>
                            element.cod ==
                            leitura.leituraAtual.codMotivoQuebraFluxo,
                      )
                      .firstOrNull;
                }
                return DropDownSearchWidget<MotivoQuebraFluxoModel>(
                  expandOnStart: true,
                  textFunction: (item) => item.DescricaoText(),
                  initialValue: motivo,
                  sourceList: motivos,
                  onChanged: (value) {
                    motivo = value;
                  },
                  placeholder: 'Motivo',
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        InsertButtonWidget(
          onPressed: selecionarMotivo,
        ),
        CancelButtonUnfilledWidget(
          onPressed: cancelarSelecao,
        ),
      ],
    );
  }

  void cancelarSelecao() {
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.CancelaSelecaoMotivoQuebraFluxo;
    Navigator.of(context).pop();
  }

  void selecionarMotivo() {
    if (!_validaCampos()) return;
    widget.processoLeitura.leituraAtual.codMotivoQuebraFluxo = motivo?.cod;
    widget.processoLeitura.leituraAtual.motivoQuebraFluxo = motivo;
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.ConfirmaSelecaoMotivoQuebraFluxo;
    Navigator.of(context).pop();
  }

  bool _validaCampos() {
    if (motivo == null) {
      ToastUtils.showCustomToastError(context, 'Selecione um motivo');
      return false;
    }
    return true;
  }
}
