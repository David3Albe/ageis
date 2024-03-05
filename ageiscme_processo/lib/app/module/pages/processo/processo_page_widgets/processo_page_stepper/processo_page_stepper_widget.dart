import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/componentes/stepper/custom_stepper_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageStepperWidget extends StatelessWidget {
  const ProcessoPageStepperWidget({Key? key});

  double getStepperHeight(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 70;
    } else if (height > 900) {
      return 65;
    } else if (height > 800) {
      return 60;
    } else if (height > 700) {
      return 55;
    } else if (height > 600) {
      return 50;
    } else if (height > 500) {
      return 50;
    } else if (height > 400) {
      return 50;
    }
    return 50;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scale = size.width / 1920;
    double height = getStepperHeight(size);
    return Material(
      elevation: 10,
      child: Container(
        constraints: BoxConstraints(maxHeight: height, minHeight: height),
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 8 * scale,
                  bottom: 0,
                  right: 14 * scale,
                  left: 14 * scale,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Transform.scale(
                        scale: scale,
                        child: CustomStepperWidget(
                          corCompletos: const Color(0xff03468A),
                          steps: state.processo.passos,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
