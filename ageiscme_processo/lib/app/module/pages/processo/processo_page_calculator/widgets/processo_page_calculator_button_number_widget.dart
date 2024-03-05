import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/cubit/processo_page_calculator_cubit.dart';
import 'package:compartilhados/main.dart';
import 'package:flutter/material.dart';

class ProcessoPageCalculatorButtonNumberWidget extends StatelessWidget {
  final int number;
  final ProcessoPageCalculatorCubit cubit;

  const ProcessoPageCalculatorButtonNumberWidget({
    required this.number,
    required this.cubit,
  });

  double getNumberHeight(Size size) {
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

  double getFontSize(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 48;
    } else if (height > 900) {
      return 42;
    } else if (height > 800) {
      return 36;
    } else if (height > 700) {
      return 30;
    } else if (height > 600) {
      return 28;
    } else if (height > 500) {
      return 26;
    } else if (height > 400) {
      return 24;
    }
    return 22;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: selectNumber,
      child: SizedBox(
        height: getNumberHeight(size),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xffDBD7D7)),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: HelperFunctions.calculaFontSize(
                  context,
                  48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void selectNumber() => cubit.addNumber(number);
}
