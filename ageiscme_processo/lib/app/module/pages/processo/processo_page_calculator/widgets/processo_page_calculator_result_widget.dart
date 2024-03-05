import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_calculator/cubit/processo_page_calculator_cubit.dart';
import 'package:compartilhados/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageCalculatorResult extends StatelessWidget {
  final ItemProcessoModel item;
  final ProcessoPageCalculatorCubit cubit;
  const ProcessoPageCalculatorResult({required this.item, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .13,
                child: DecoratedBox(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder<ProcessoPageCalculatorCubit,
                        ProcessoPageCalculatorState>(
                      bloc: cubit,
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            state.value?.toString() ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  HelperFunctions.calculaFontSize(context, 48),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: const Color(0xffDBD7D7),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                'Saldo estoque disponível',
                style: TextStyle(
                  fontSize: HelperFunctions.calculaFontSize(context, 16),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                item.calculadora?.saldo ?? '',
                style: TextStyle(
                  color: Cores.corTextoVermelho,
                  fontSize: HelperFunctions.calculaFontSize(context, 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
