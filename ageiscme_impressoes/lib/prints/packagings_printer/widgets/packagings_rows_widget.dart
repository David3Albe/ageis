import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:ageiscme_impressoes/prints/packagings_printer/widgets/packaging_row_widget.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PackagingsRowsWidget extends StatelessWidget {
  final List<PackagingsPackagingPrintDTO> packagings;
  final PackagingsPrintDTO dto;
  PackagingsRowsWidget({
    required this.packagings,
    required this.dto,
  });

  @override
  Widget build(Context context) {
    return Column(
      children: _getPackagings(),
    );
  }

  List<Widget> _getPackagings() {
    List<Widget> widgets = [];
    for (int i = 0; i < packagings.length; i += 2) {
      PackagingsPackagingPrintDTO packaging = packagings[i];
      PackagingsPackagingPrintDTO? packagingTwo =
          packagings.elementAtOrNull(i + 1);
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: PackagingRowWidget(
            packaging: packaging,
            dto: dto,
            packaging2: packagingTwo,
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
