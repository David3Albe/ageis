import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:ageiscme_impressoes/prints/packagings_printer/widgets/header_row_widget.dart';
import 'package:ageiscme_impressoes/prints/packagings_printer/widgets/packagings_rows_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class PackagingsController {
  final PackagingsPrintDTO packagingsPrint;
  BuildContext context;
  static const double DEFAULT_PADDING_TOP = 1;

  PackagingsController({
    required this.packagingsPrint,
    required this.context,
  });

  Future print() async {
    final Font font = await fontFromAssetBundle('assets/fonts/open-sans-regular.ttf');
    final Font fontBold = await fontFromAssetBundle('assets/fonts/open-sans-bold.ttf');
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
      bold: fontBold,
    );
    final pdf = pw.Document(theme: themeOpenSans);

    List<PackagingsPackagingPrintDTO> packagings = packagingsPrint.packagings
        .where((element) => element.selected == true)
        .toList();

    if (packagings.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário imprimir ao menos uma embalagem',
      );
      return;
    }

    List<List<PackagingsPackagingPrintDTO>> packagingsGrouped =
        ListHelper.dividirLista(packagings, 20);

    for (List<PackagingsPackagingPrintDTO> packagingsSeparated
        in packagingsGrouped) {
      pdf.addPage(
        _createPage(packagingsSeparated),
      );
    }

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage(List<PackagingsPackagingPrintDTO> packagings) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                left: 40,
                top: 20,
              ),
              child: HeaderRowWidget(
                dto: packagingsPrint,
              ),
            ),
            pw.Divider(
              thickness: 1.2,
            ),
            PackagingsRowsWidget(
              packagings: packagings,
              dto: packagingsPrint,
            ),
          ],
        );
      },
    );
  }
}
