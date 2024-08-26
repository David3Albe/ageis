import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/widgets/equipamento_row_widget.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/widgets/lote_equipamento_row_widget.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/widgets/lote_row_widget.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/widgets/user_row_widget.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/widgets/validade_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class EtiquetaLotePrinterController {
  final EtiquetaLotePrintDTO dto;
  BuildContext context;

  static const double MAX_WIDTH = 95;

  EtiquetaLotePrinterController({
    required this.dto,
    required this.context,
  });

  Future print() async {
    final Font font =
        await fontFromAssetBundle('assets/fonts/open-sans-regular.ttf');
    final Font fontBold =
        await fontFromAssetBundle('assets/fonts/open-sans-bold.ttf');
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
      bold: fontBold,
    );
    final pdf = pw.Document(theme: themeOpenSans);

    int impressoes = dto.impressoes;
    while (impressoes > 0) {
      pdf.addPage(
        _createPage(impressoes: impressoes),
      );
      impressoes = impressoes - 3;
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({required int impressoes}) {
    // const double inch = 72.0;
    // const double cm = inch / 2.54;
    return pw.Page(
      orientation: pw.PageOrientation.landscape,
      pageFormat: const PdfPageFormat(
        10 * PdfPageFormat.cm,
        3 * PdfPageFormat.cm,
        marginAll: 0,
      ),
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(
              impressoes: impressoes,
            ),
          ),
          padding: const pw.EdgeInsets.only(
            top: 10,
            left: 5,
          ),
        );
      },
    );
  }

  List<pw.Widget> _getPage({required int impressoes}) {
    List<pw.Widget> widgets = [];
    widgets.add(
      LoteRowWidget(
        dto: dto,
        impressoes: impressoes,
      ),
    );
    widgets.add(pw.SizedBox(height: 0.2));
    widgets.add(
      ValidadeRowWidget(
        dto: dto,
        impressoes: impressoes,
      ),
    );
    widgets.add(
      EquipamentoRowWidget(
        dto: dto,
        impressoes: impressoes,
      ),
    );
    widgets.add(
      UserRowWidget(
        dto: dto,
        impressoes: impressoes,
      ),
    );
    widgets.add(
      LoteEquipamentoRowWidget(
        dto: dto,
        impressoes: impressoes,
      ),
    );
    return widgets;
  }
}
