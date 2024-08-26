import 'package:ageiscme_impressoes/dto/arsenais_print/arsenais_print_dto.dart';
import 'package:ageiscme_impressoes/dto/arsenais_print/arsenal_print/arsenal_print_dto.dart';
import 'package:ageiscme_impressoes/prints/arsenais_printer/widgets/arsenais_rows_widget.dart';
import 'package:ageiscme_impressoes/prints/arsenais_printer/widgets/header_row_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class ArsenaisPrintController {
  final ArsenaisPrintDTO dto;
  BuildContext context;
  static const double DEFAULT_PADDING_TOP = 1;

  ArsenaisPrintController({
    required this.dto,
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

    List<ArsenalPrintDTO> arsenaisSelecionados = dto.arsenais
        .where((element) => element.selected == true)
        .toList();

    if (arsenaisSelecionados.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário imprimir ao menos um Arsenal',
      );
      return;
    }

    List<List<ArsenalPrintDTO>> arsenaisGrouped =
        ListHelper.dividirLista(arsenaisSelecionados, 20);

    for (List<ArsenalPrintDTO> arsenaisSeparados
        in arsenaisGrouped) {
      pdf.addPage(
        _createPage(arsenaisSeparados),
      );
    }

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage(List<ArsenalPrintDTO> arsenais) {
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
                dto: dto,
              ),
            ),
            pw.Divider(
              thickness: 1.2,
            ),
            ArsenaisRowsWidget(
              arsenais: arsenais,
              dto: dto,
            ),
          ],
        );
      },
    );
  }
}
