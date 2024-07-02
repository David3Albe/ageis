import 'package:ageiscme_impressoes/dto/fluxo_print/fluxo_print_dto.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class FluxoPrinterController {
  final FluxoPrintDTO dto;
  BuildContext context;

  FluxoPrinterController({
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

    _createPage(pdf);

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  void _createPage(pw.Document pdf) {
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              pw.MemoryImage(
                dto.imageBytes,
              ),
            ),
          );
        },
      ),
    );
  }
}
