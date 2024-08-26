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
    final Font font = await fontFromAssetBundle('assets/fonts/open-sans-regular.ttf');
    final Font fontBold = await fontFromAssetBundle('assets/fonts/open-sans-bold.ttf');
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
          return pw.Column(
            children: [
              pw.Padding(padding: const pw.EdgeInsets.only(top: 15)),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        dto.nomeFluxo,
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              pw.Expanded(
                child: pw.Center(
                  child: pw.Image(
                    pw.MemoryImage(
                      dto.imageBytes,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
