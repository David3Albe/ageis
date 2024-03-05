import 'package:compartilhados/componentes/stepper/custom_stepper_step_mixin.dart';
import 'package:compartilhados/componentes/stepper/custom_stepper_step_status.dart';
import 'package:flutter/material.dart';
import 'package:dependencias_comuns/main.dart';

class CustomStepperWidget extends StatefulWidget {
  CustomStepperWidget({
    required this.steps,
    required this.corCompletos,
    this.circleRadius = 12,
    this.lineThickness = 3,
    this.corIncompletos = Colors.white,
    this.alternateTopBottomDescription = true,
  });

  final List<CustomStepperStepMixin> steps;
  final Color corCompletos;
  final Color corIncompletos;
  final double circleRadius;
  final double lineThickness;
  final bool alternateTopBottomDescription;

  @override
  State<CustomStepperWidget> createState() => _CustomStepperWidgetState();
}

class _CustomStepperWidgetState extends State<CustomStepperWidget> {
  static const corInactive = Color.fromARGB(92, 158, 158, 158);

  @override
  Widget build(BuildContext context) {
    double lengthLine = MediaQuery.of(context).size.width * .08;
    lengthLine = lengthLine < 90 ? 90 : lengthLine;
    return Container(
      height: 40,
      child: EasyStepper(
        activeStep: getIndexStepEmAndamento(),
        lineStyle: LineStyle(
          lineType: LineType.normal,
          finishedLineColor: widget.corCompletos,
          lineThickness: widget.lineThickness,
          lineLength: lengthLine,
          unreachedLineColor: corInactive,
          defaultLineColor: corInactive,
        ),
        activeStepTextColor: widget.corCompletos,
        finishedStepTextColor: widget.corCompletos,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: widget.circleRadius,
        showStepBorder: false,
        steps: getEasySteps(),
        padding: const EdgeInsets.all(0),
      ),
    );
  }

  CustomStepperStepMixin? getStepEmAndamento() => widget.steps
      .where(
        (element) =>
            element.situacao ==
            CustomStepperStepStatusValue.getValue(
              CustomStepperStepStatus.Andamento,
            ),
      )
      .firstOrNull;

  int getIndexStepEmAndamento() {
    CustomStepperStepMixin? stepEmAndamento = getStepEmAndamento();
    return stepEmAndamento == null ? 0 : widget.steps.indexOf(stepEmAndamento);
  }

  List<EasyStep> getEasySteps() {
    List<EasyStep> easySteps = [];
    for (CustomStepperStepMixin step in widget.steps) {
      bool topTitle = widget.alternateTopBottomDescription &&
          (widget.steps.indexOf(step) + 1) % 2 == 0;
      easySteps.add(getEasyStep(step, topTitle));
    }
    return easySteps;
  }

  EasyStep getEasyStep(CustomStepperStepMixin step, bool topTitle) {
    return EasyStep(
      enabled: false,
      customStep: Stack(
        children: [
          CircleAvatar(
            radius: widget.circleRadius,
            backgroundColor: widget.corCompletos,
            child: CircleAvatar(
              radius: widget.circleRadius,
              backgroundColor: step.situacao ==
                      CustomStepperStepStatusValue.getValue(
                        CustomStepperStepStatus.Concluido,
                      )
                  ? widget.corCompletos
                  : widget.corIncompletos,
            ),
          ),
          if (step.situacao ==
              CustomStepperStepStatusValue.getValue(
                CustomStepperStepStatus.Andamento,
              )) ...{
            CircleAvatar(
              radius: widget.circleRadius,
              backgroundColor: widget.corCompletos,
              child: CircleAvatar(
                radius: widget.circleRadius - 3,
                backgroundColor: Colors.white,
              ),
            ),
          },
        ],
      ),
      title: step.descricao,
      // topTitle: topTitle,
    );
  }
}
