import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class CancelRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  CancelRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.cancel1Item != true &&
        stageFunctionsPrint.cancelReadings != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.cancel1Item == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagData(),
              text: 'Cancelar 1 Item',
            ),
          ),
        ),
      );
    }
    if (stageFunctionsPrint.cancelReadings == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagData2(),
              text: 'Cancelar Leituras',
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  String _tagData() {
    String modulo = ModulosEnum.EtapaProcessoCancelar1Item.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return modulo + instituicao + local;
  }

  String _tagData2() {
    String modulo = ModulosEnum.EtapaProcessoCancelarLeituras.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return modulo + instituicao + local;
  }
}
