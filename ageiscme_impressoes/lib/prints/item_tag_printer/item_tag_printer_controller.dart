import 'package:ageiscme_impressoes/dto/item_tag_print/item_tag_print_dto.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class ItemTagPritnerController {
  final ItemTagPrintDTO dto;
  BuildContext context;

  ItemTagPritnerController({
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
          padding: const pw.EdgeInsets.only(left: 15, top: 5),
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
          pw.Text(
            'ITEM: ${dto.descricaoItem}',
            style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        ],
      ),
    );

    widgets.add(
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Text(
            'PROPRIETÁRIO: ${dto.descricaoProprietario}',
            style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
        ],
      ),
    );

    widgets.add(
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            dto.idEtiqueta,
            style: pw.TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ),
          pw.Padding(padding: const pw.EdgeInsets.only(left: 25)),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 3),
            child: pw.BarcodeWidget(
              data: dto.idEtiqueta,
              barcode: Barcode.dataMatrix(),
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );

    if (dto.restricao != null && dto.restricao!.isNotEmpty) {
      widgets.add(pw.Padding(padding: const pw.EdgeInsets.only(top: 2)));
      widgets.add(
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Text(
              dto.restricao!,
              style: const pw.TextStyle(fontSize: 8),
            ),
          ],
        ),
      );
    }

    return widgets;
  }
}
