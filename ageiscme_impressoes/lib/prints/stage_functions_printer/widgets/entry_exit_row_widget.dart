import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/row_item_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/text_with_data_matrix_widget.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EntryExitRowWidget extends StatelessWidget {
  final StageFunctionsPrintDTO stageFunctionsPrint;

  EntryExitRowWidget({required this.stageFunctionsPrint});

  @override
  Widget build(Context context) {
    if (stageFunctionsPrint.entry != true && stageFunctionsPrint.exit != true) {
      return SizedBox();
    }
    return RowItemWidget(
      widgets: _getWidgets(),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    if (stageFunctionsPrint.entry == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagEntryData(),
              text: 'INICIAR ENTRADA',
            ),
          ),
        ),
      );
    }
    if (stageFunctionsPrint.exit == true) {
      widgets.add(
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: TextWithDataMatrixWidget(
              tagId: _tagExitData(),
              text: 'INICIAR SAÍDA',
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  String _tagEntryData() {
    String etapa = ModulosEnum.EtapaProcessoIniciarEntrada.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }

  String _tagExitData() {
    String etapa = ModulosEnum.EtapaProcessoIniciarSaida.toString();
    String instituicao =
        '${stageFunctionsPrint.instituitionCod.toString().padLeft(
              3,
              '0',
            )}';
    String local = stageFunctionsPrint.localTag!.substring(6);
    return etapa + instituicao + local;
  }
}
