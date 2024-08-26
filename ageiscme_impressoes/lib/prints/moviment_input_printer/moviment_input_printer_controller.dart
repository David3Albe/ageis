import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/widgets/batch_barcode_row_widget.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/widgets/entry_out_row_widget.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/widgets/input_row_widget.dart';
import 'package:ageiscme_impressoes/prints/moviment_input_printer/widgets/instituition_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class MovimentInputPrinterController {
  final MovimentInputPrintDTO dto;
  mat.BuildContext context;

  MovimentInputPrinterController({
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

    pdf.addPage(
      _createPage(),
    );

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage() {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 5),
        );
      },
    );
  }

  List<pw.Widget> _getPage() {
    List<pw.Widget> widgets = [];
    widgets.add(InstituitionRowWidget(dto: dto));
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: InputRowWidget(dto: dto),
      ),
    );
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: EntryOutRowWidget(dto: dto),
      ),
    );
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: BatchBarcodeWidget(dto: dto),
      ),
    );

    return widgets;
  }
}
