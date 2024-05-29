import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PriorityRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  PriorityRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.normalPriority != true &&
        stageFunctionsPrint.urgentPriority != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.normalPriority == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagNormal(),
              text: 'PRIORIDADE NORMAL',
            ),
          ),
        ),
      );
    }
    if (stageFunctionsPrint.normalPriority == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagUrgent(),
              text: 'PRIORIDADE URGENTE',
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  String _tagNormal() {
    String prioridade = ModulosEnum.EtapaProcessoPrioridadeNormal.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return prioridade + instituicao + local;
  }

  String _tagUrgent() {
    String prioridade = ModulosEnum.EtapaProcessoPrioridadeUrgente.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return prioridade + instituicao + local;
  }
}
