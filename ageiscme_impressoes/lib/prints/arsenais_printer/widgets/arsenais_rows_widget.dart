import 'package:ageiscme_impressoes/dto/arsenais_print/arsenais_print_dto.dart';
import 'package:ageiscme_impressoes/dto/arsenais_print/arsenal_print/arsenal_print_dto.dart';
import 'package:ageiscme_impressoes/prints/arsenais_printer/widgets/arsenal_row_widget.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ArsenaisRowsWidget extends StatelessWidget {
  final List<ArsenalPrintDTO> arsenais;
  final ArsenaisPrintDTO dto;
  ArsenaisRowsWidget({
    required this.arsenais,
    required this.dto,
  });

  @override
  Widget build(Context context) {
    return Column(
      children: _getArsenais(),
    );
  }

  List<Widget> _getArsenais() {
    List<Widget> widgets = [];
    for (int i = 0; i < arsenais.length; i += 2) {
      ArsenalPrintDTO arsenal= arsenais[i];
      ArsenalPrintDTO? arsenalTwo =
          arsenais.elementAtOrNull(i + 1);
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: ArsenalRowWidget(
            arsenal: arsenal,
            dto: dto,
            arsenalTwo: arsenalTwo,
          ),
        ),
      );
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 1),
        ),
      );
      widgets.add(Divider(thickness: 1.2));
    }
    return widgets;
  }
}
