import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/cubit/processo_page_calculator_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/enum/processo_page_calculator_button_type.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/widgets/processo_page_calculator_button_action_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/widgets/processo_page_calculator_button_number_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageCalculatorButtonWidget extends StatelessWidget {
  final int? number;
  final ProcessoPageCalculatorButtonType type;
  final ProcessoPageCalculatorCubit cubit;

  ProcessoPageCalculatorButtonWidget({
    required this.cubit,
    required this.type,
    this.number,
  });

  double getBarCodeHeightSize(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 130;
    } else if (height > 900) {
      return 110;
    } else if (height > 800) {
      return 90;
    } else if (height > 700) {
      return 70;
    } else if (height > 600) {
      return 50;
    } else if (height > 500) {
      return 50;
    } else if (height > 400) {
      return 45;
    }
    return 40;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double barcodeSize = getBarCodeHeightSize(size);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: BarcodeWidget(
                      height: barcodeSize,
                      barcode: Barcode.dataMatrix(),
                      data: getDataButton(),
                    ),
                  ),
                  if (type == ProcessoPageCalculatorButtonType.Number) ...{
                    Flexible(
                      fit: FlexFit.tight,
                      child: ProcessoPageCalculatorButtonNumberWidget(
                        number: number!,
                        cubit: cubit,
                      ),
                    ),
                  },
                ],
              ),
              if (type == ProcessoPageCalculatorButtonType.Cancel ||
                  type == ProcessoPageCalculatorButtonType.Clean ||
                  type == ProcessoPageCalculatorButtonType.Confirm) ...{
                Row(
                  children: [
                    Expanded(
                      child: ProcessoPageCalculatorButtonActionWidget(
                        cubit: cubit,
                        type: type,
                      ),
                    ),
                  ],
                ),
              },
            ],
          ),
        ),
      ],
    );
  }

  String getDataButton() {
    switch (type) {
      case ProcessoPageCalculatorButtonType.Clean:
        return 'clean';
      case ProcessoPageCalculatorButtonType.Confirm:
        return 'confirm';
      case ProcessoPageCalculatorButtonType.Cancel:
        return 'cancel';
      case ProcessoPageCalculatorButtonType.Number:
        return number!.toString();
      default:
        throw Exception('button type not implemented');
    }
  }
}
