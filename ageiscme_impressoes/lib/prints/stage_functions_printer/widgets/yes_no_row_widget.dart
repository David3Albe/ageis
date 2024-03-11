import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class YesNoRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  YesNoRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.yesNo != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.yesNo == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagData(),
              text: 'SIM',
            ),
          ),
        ),
      );
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagNoData(),
              text: 'NÃO',
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  String _tagData() {
    String etapa = ModulosEnum.EtapaProcessoSIM.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }

  String _tagNoData() {
    String etapa = ModulosEnum.EtapaProcessoNAO.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }
}
