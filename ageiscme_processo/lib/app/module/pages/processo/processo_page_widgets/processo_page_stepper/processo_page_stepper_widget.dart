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

  double getStepperEscala(Size size, double escala) {
    double width = size.width;
    if (width > 1700 && escala > 1) {
      return 0.3;
    } else if (width > 1500) {
      return 0.25;
    } else if (width > 1300) {
      return 0.2;
    } else if (width > 1100) {
      return 0.15;
    } else if (width > 700) {
      return 0.1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          builder: (context, state) {
            Size size = MediaQuery.of(context).size;
            var scale = size.width / 1920;
            var novaEscala = scale;
            double escala = state.processo.getEscala();
            if (escala != 1) {
              double stepperScale = getStepperEscala(size, escala);
              if (state.processo.passos.length >= 7) {
                if (escala >= 1) {
                  if (size.width > 1700) {
                    stepperScale = 0.05;
                  } else {
                    stepperScale = 0.15;
                  }
                }
              }
              novaEscala = scale + stepperScale;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 9 * novaEscala,
                    right: 14 * novaEscala,
                    left: 14 * novaEscala,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Transform.scale(
                          filterQuality: FilterQuality.high,
                          scale: novaEscala,
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
            );
          },
        ),
      ),
    );
  }
}
