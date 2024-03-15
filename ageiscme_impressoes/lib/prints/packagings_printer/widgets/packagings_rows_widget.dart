import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PackagingsRowsWidget extends StatelessWidget {
  final List<PackagingsPackagingPrintDTO> packagings;
  PackagingsRowsWidget({required this.packagings});

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Row(
            children: [
              // Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }
}
