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

  EtiquetaLotePrinterController({
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

    for (int i = 1; i <= dto.quantidadePadinas; i++) {
      pdf.addPage(
        _createPage(),
      );
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage() {
    const double inch = 72.0;
    const double cm = inch / 2.54;
    return pw.Page(
      pageFormat: const PdfPageFormat(8.9 * cm, 3 * cm, marginAll: 0),
      orientation: PageOrientation.landscape,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(),
          ),
          padding: const pw.EdgeInsets.only(
            top: 10,
            left: 5,
          ),
        );
      },
    );
  }

  List<pw.Widget> _getPage() {
    List<pw.Widget> widgets = [];
    widgets.add(LoteRowWidget(dto: dto));
    widgets.add(pw.SizedBox(height: 0.2));
    widgets.add(ValidadeRowWidget(dto: dto));
    widgets.add(EquipamentoRowWidget(dto: dto));
    widgets.add(UserRowWidget(dto: dto));
    widgets.add(LoteEquipamentoRowWidget(dto: dto));
    return widgets;
  }
}
