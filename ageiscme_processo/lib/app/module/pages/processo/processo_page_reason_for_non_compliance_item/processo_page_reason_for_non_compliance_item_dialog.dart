import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_motivo_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageReasonForNonComplianceItemDialog extends StatefulWidget {
  const ProcessoPageReasonForNonComplianceItemDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageReasonForNonComplianceItemDialog> createState() =>
      _ProcessoPageReasonForNonComplianceItemDialogState();
}

class _ProcessoPageReasonForNonComplianceItemDialogState
    extends State<ProcessoPageReasonForNonComplianceItemDialog> {
  late final ProcessoMotivoCubit processoMotivoCubit;
  ProcessoMotivoModel? motivo;
  late final ItemProcessoModel item;

  @override
  void initState() {
    processoMotivoCubit = ProcessoMotivoCubit();
    processoMotivoCubit.loadAll();
    item = widget.processoLeitura.getItemLido();
    super.initState();
  }

  @override 
  void dispose() {
    processoMotivoCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Motivo de Processo'),
      content: Container(
        height: size.height * .4,
        width: size.width * .4,
        child: Column(
          children: [
            BlocBuilder<ProcessoMotivoCubit, ProcessoMotivoState>(
              bloc: processoMotivoCubit,
              builder: (context, state) {
                if (state.loading) return const Center(child: LoadingWidget());
                List<ProcessoMotivoModel> motivos = state.motivos
                    .where((element) => element.recepcaoExpurgo == true)
                    .toList();
                motivo;
                if (item.codMotivoNaoConforme != null) {
                  motivo = motivos
                      .where(
                        (element) => element.cod == item.codMotivoNaoConforme,
                      )
                      .firstOrNull;
                }
                return DropDownSearchWidget<ProcessoMotivoModel>(
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
        DecisaoEnum.CancelaSelecaoMotivoNaoConformidadeItem;
    Navigator.of(context).pop();
  }

  void selecionarMotivo() {
    if (!_validaCampos()) return;
    item.codMotivoNaoConforme = motivo?.cod;
    widget.processoLeitura.leituraAtual.adicionarMotivo(motivo);
    widget.processoLeitura.leituraAtual.decisao =
        DecisaoEnum.ConfirmaSelecaoMotivoNaoConformidadeItem;
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
