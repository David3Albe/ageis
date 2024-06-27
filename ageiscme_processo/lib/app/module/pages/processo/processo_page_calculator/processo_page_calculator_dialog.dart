import 'package:ageiscme_models/enums/decisao_enum.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/cubit/processo_page_calculator_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/enum/processo_page_calculator_button_type.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/widgets/processo_page_calculator_button_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/widgets/processo_page_calculator_result_widget.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/exceptions/custom_base_exception.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProcessoPageCalculatorDialog extends StatefulWidget {
  const ProcessoPageCalculatorDialog({
    Key? key,
  });

  @override
  State<ProcessoPageCalculatorDialog> createState() =>
      _ProcessoPageCalculatorDialogState();
}

class _ProcessoPageCalculatorDialogState
    extends State<ProcessoPageCalculatorDialog> {
  late final ItemProcessoModel item;
  late final ProcessoLeituraMontagemModel leitura;
  late final ProcessoPageCalculatorCubit cubit;
  final FocusNode _textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: handleKey,
  );

  @override
  void initState() {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    leitura = processoCubit.state.processo;
    if (leitura.leituraAtual.itemEmLeitura == null) {
      throw CustomBaseException('Defina o item Em Leitura');
    }
    item = leitura.leituraAtual.itemEmLeitura!;
    cubit = ProcessoPageCalculatorCubit();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void handleKey(String barCode) {
    int? number = int.tryParse(barCode);
    if (number != null) {
      cubit.addNumber(number);
      return;
    }
    if (barCode == 'clean') {
      barCode = '';
      cubit.Clean();
      return;
    }
    if (barCode == 'confirm') {
      cubit.Confirm();
      return;
    }
    if (barCode == 'cancel') {
      cubit.Cancel();
      return;
    }
  }

  void handleCustomkey(RawKeyEvent key) {
    if (key is RawKeyUpEvent) return;
    String? keyChar = key.character;
    if (keyChar != null) {
      int? parseado = int.tryParse(keyChar);
      if (parseado != null) cubit.addNumber(parseado);
      return;
    }
    coletorHelper.handleKey(key);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Calculadora de rotulados'),
      content: BlocListener<ProcessoPageCalculatorCubit,
          ProcessoPageCalculatorState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.confirmed == true) {
            confirm(state);
          } else if (state.canceled == true) {
            cancel();
          }
        },
        child: RawKeyboardListener(
          onKey: handleCustomkey,
          autofocus: true,
          focusNode: _textNode,
          child: Container(
            height: size.height * .9,
            width: size.width * .35,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Informe a quantidade',
                      style: TextStyle(
                        fontSize: HelperFunctions.calculaFontSize(context, 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: ProcessoPageCalculatorResult(
                        item: item,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Clean,
                        cubit: cubit,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 1,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 2,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        number: 3,
                        type: ProcessoPageCalculatorButtonType.Number,
                        cubit: cubit,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 4,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 5,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        number: 6,
                        type: ProcessoPageCalculatorButtonType.Number,
                        cubit: cubit,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 7,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 8,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        number: 9,
                        type: ProcessoPageCalculatorButtonType.Number,
                        cubit: cubit,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Cancel,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Number,
                        number: 0,
                        cubit: cubit,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: ProcessoPageCalculatorButtonWidget(
                        type: ProcessoPageCalculatorButtonType.Confirm,
                        cubit: cubit,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirm(ProcessoPageCalculatorState state) async {
    LoadingController loading = LoadingController(context: context);
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    ProcessoLeituraMontagemModel processoState = processoCubit.state.processo;

    ItemProcessoModel item = processoState.leituraAtual.itemEmLeitura!;
    if (state.value == null || state.value == 0) {
      if (processoCubit.state.processo.leituraAtual.local == null) {
        loading.closeDefault();
        ToastUtils.showCustomToastWarning(context, 'Informe a quantidade');
        return;
      }
    }
    item.calculadora!.valorInformado = state.value;

    processoState.leituraAtual.decisao =
        DecisaoEnum.ConfirmarDefinirValorCalculadora;

    String lastCode = processoCubit.state.processo.filaLeituras!.last;
    await processoCubit.readCode(lastCode);
    loading.closeDefault();
    ProcessoLeituraState processoLeituraState = processoCubit.state;
    if (processoLeituraState.processo.leituraAtual.decisao !=
        DecisaoEnum.RetentativaDefinirValorCalculadora) {
      Navigator.of(context).pop();
      return;
    }
    WarningUtils.showWarningDialog(
      context,
      processoLeituraState.aviso ?? '',
    );
  }

  void cancel() {
    final ProcessoLeituraCubit processoCubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);

    ProcessoLeituraMontagemModel processoState = processoCubit.state.processo;
    processoState.leituraAtual.decisao =
        DecisaoEnum.CancelarDefinirValorCalculadora;
    Navigator.of(context).pop();
    String lastCode = processoCubit.state.processo.filaLeituras!.removeLast();
    processoCubit.readCode(lastCode);
  }
}
