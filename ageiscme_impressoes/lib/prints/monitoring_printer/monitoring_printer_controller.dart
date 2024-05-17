import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/equipment_row_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/instituition_row_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/realized_in_row_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/service_type_barcode_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/service_type_row_widget.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/widgets/user_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class MonitoringPrinterController {
  final MonitoringPrintDTO dto;
  mat.BuildContext context;

  MonitoringPrinterController({
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
          padding: const pw.EdgeInsets.only(left: 10, top: 2),
        );
      },
    );
  }

  List<pw.Widget> _getPage() {
    List<pw.Widget> widgets = [];
    widgets.add(InstituitionRowWidget(dto: dto));
    widgets.add(RealizedInRowWidget(dto: dto));
    widgets.add(UserRowWidget(dto: dto));
    if (dto.equipamentCod != null) {
      widgets.add(EquipmentRowWidget(dto: dto));
    }
    if (dto.itemCod != null) {
      widgets.add(ItemRowWidget(dto: dto));
    }
    widgets.add(ServiceTypeRowWidget(dto: dto));
    widgets.add(ServiceTypeBarcodeWidget(dto: dto));

    return widgets;
  }
}
