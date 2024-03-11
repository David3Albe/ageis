import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ZoomRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  ZoomRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.zoom != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.zoom == true) {
      widgets.add(
        TextWithDataMatrixWidget(
          tagId: _tagData(),
          text: 'ZOOM',
        ),
      );
    }

    return widgets;
  }

  String _tagData() {
    String modulo = ModulosEnum.EtapaZoom.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return modulo + instituicao + local;
  }
}
