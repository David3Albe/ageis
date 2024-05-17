import 'package:ageiscme_impressoes/dto/item_consignado_etiqueta_print/item_consignado_etiqueta_print_dto.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class ItemConsignadoPrinterController {
  final ItemConsignadoEtiquetaPrintDTO dto;
  BuildContext context;

  ItemConsignadoPrinterController({
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
            data: dto.idEtiqueta,
            barcode: Barcode.dataMatrix(),
            height: 20,
            width: 20,
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
              'AGEIS CME Consignado: ${dto.idEtiqueta}',
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
