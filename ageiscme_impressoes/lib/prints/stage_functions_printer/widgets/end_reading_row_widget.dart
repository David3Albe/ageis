import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EndReadingRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  EndReadingRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.finish != true &&
        stageFunctionsPrint.generateLabel != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.finish == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagData(),
              text: 'FINALIZAR',
            ),
          ),
        ),
      );
    }
    if (stageFunctionsPrint.generateLabel == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagData2(),
              text: 'GERAR ETIQUETA',
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  String _tagData() {
    String etapa = ModulosEnum.EtapaProcessoFinalizarLeitura.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }

  String _tagData2() {
    String etapa = ModulosEnum.GerarEtiquetaBarra.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }
}
