import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_motivo_cubit.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageReasonKitArsenalReturnDialog extends StatefulWidget {
  const ProcessoPageReasonKitArsenalReturnDialog({
    required this.processoLeitura,
    Key? key,
  });

  final ProcessoLeituraMontagemModel processoLeitura;

  @override
  State<ProcessoPageReasonKitArsenalReturnDialog> createState() =>
      _ProcessoPageReasonKitArsenalReturnDialogState();
}

class _ProcessoPageReasonKitArsenalReturnDialogState
    extends State<ProcessoPageReasonKitArsenalReturnDialog> {
  late final ProcessoMotivoCubit processoMotivoCubit;
  ProcessoMotivoModel? motivo;

  @override
  void initState() {
    processoMotivoCubit = ProcessoMotivoCubit();
    processoMotivoCubit.loadAll();
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
                    .where((element) => element.arsenal == true)
                    .toList();
                return DropDownSearchWidget<ProcessoMotivoModel>(
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
        DecisaoEnum.CancelaSelecaoMotivoRetornoArsenalItem;
    Navigator.of(context).pop();
  }

  void selecionarMotivo() {
    if (!_validaCampos()) return;
    widget.processoLeitura.leituraAtual.codMotivoRetornoArsenalKit =
        motivo!.cod;
    widget.processoLeitura.leituraAtual.motivoRetornoArsenalKit = motivo;
    widget.processoLeitura.leituraAtual.decisao = null;
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
