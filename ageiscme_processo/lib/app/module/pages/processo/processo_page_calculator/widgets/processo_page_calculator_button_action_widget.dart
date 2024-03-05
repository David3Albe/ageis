import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/cubit/processo_page_calculator_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/enum/processo_page_calculator_button_type.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageCalculatorButtonActionWidget extends StatelessWidget {
  final ProcessoPageCalculatorButtonType type;
  final ProcessoPageCalculatorCubit cubit;

  const ProcessoPageCalculatorButtonActionWidget({
    required this.type,
    required this.cubit,
  });
  @override
  Widget build(BuildContext context) {
    if (type == ProcessoPageCalculatorButtonType.Cancel) {
      return CancelButtonUnfilledWidget(
        onPressed: cubit.Cancel,
        elevation: 0,
        paddingWidth: 6,
        paddingHeight: 12,
      );
    } else if (type == ProcessoPageCalculatorButtonType.Clean) {
      return CleanButtonWidget(
        paddingHeight: 12,
        paddingWidth: 6,
        elevation: 0.0,
        onPressed: cubit.Clean,
      );
    } else if (type == ProcessoPageCalculatorButtonType.Confirm) {
      return ConfirmButtonWidget(
        onPressed: cubit.Confirm,
        paddingWidth: 6,
        paddingHeight: 12,
        elevation: 0,
      );
    }
    throw Exception('Tipo de botão para ação da calculadora não implementado');
  }
}
