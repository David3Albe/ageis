import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/company_row_widget.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/employeer_row_widget.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/impression_time_row_widget.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/material_row_widget.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/module_row_widget.dart';
import 'package:ageiscme_impressoes/prints/equipment_maintenance_printer/widgets/service_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class EquipmentMaintenanceController {
  final EquipmentMaintenancePrintDTO equipmentMaintenance;
  BuildContext context;
  pw.TextStyle _style = const pw.TextStyle(fontSize: 8);
  static const double DEFAULT_PADDING_TOP = 0;

  EquipmentMaintenanceController({
    required this.equipmentMaintenance,
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

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage() {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(left:8),
          child: pw.Column(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 1),
              ),
              CompanyRowWidget(
                company: equipmentMaintenance.company,
                style: _style,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: DEFAULT_PADDING_TOP),
              ),
              ImpressionTimeRowWidget(
                maintenance: equipmentMaintenance,
                style: _style,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: DEFAULT_PADDING_TOP),
              ),
              EmployeerRowWidget(
                employeer: equipmentMaintenance.employeer,
                style: _style,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: DEFAULT_PADDING_TOP),
              ),
              MaterialRowWidget(
                maintenance: equipmentMaintenance,
                style: _style,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: DEFAULT_PADDING_TOP),
              ),
              ServiceRowWidget(
                maintenance: equipmentMaintenance,
                style: _style,
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: DEFAULT_PADDING_TOP),
              ),
              ModuleRowWidget(
                maintenance: equipmentMaintenance,
                style: _style,
              ),
            ],
          ),
        );
      },
    );
  }
}
