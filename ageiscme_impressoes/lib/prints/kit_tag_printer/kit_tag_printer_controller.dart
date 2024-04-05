import 'package:ageiscme_impressoes/dto/kit_tag_print/kit_tag_print_dto.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class KitTagPrinterController {
  final KitTagPrintDTO dto;
  BuildContext context;

  KitTagPrinterController({
    required this.dto,
    required this.context,
  });

  Future print() async {
    final Font font = await PdfGoogleFonts.openSansRegular();
    final Font fontBold = await PdfGoogleFonts.openSansBold();
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
          padding: const pw.EdgeInsets.only(left: 20, top: 30),
        );
      },
    );
  }

  List<pw.Widget> _getPage() {
    List<pw.Widget> widgets = [];
    widgets.add(
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.BarcodeWidget(
            data: dto.codBarra,
            barcode: Barcode.dataMatrix(),
            height: 30,
            width: 30,
          ),
        ],
      ),
    );

    widgets.add(
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 5, top: 7),
            child: pw.Text(
              'AGEIS CME KIT: ${dto.codBarra}',
              style: const pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
    return widgets;
  }
}
