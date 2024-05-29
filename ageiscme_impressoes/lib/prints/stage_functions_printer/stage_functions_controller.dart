import 'package:ageiscme_impressoes/dto/stage_functions_print/stage_functions_print_dto.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/cancel_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/end_reading_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/entry_exit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/priority_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/transfer_receibe_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/yes_no_row_widget.dart';
import 'package:ageiscme_impressoes/prints/stage_functions_printer/widgets/zoom_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class StageFunctionsPrinterController {
  final StageFunctionsPrintDTO stageFunctionsPrint;
  BuildContext context;
  pw.TextStyle _titleStyle = const pw.TextStyle(fontSize: 16);
  pw.TextStyle _headerStyle = const pw.TextStyle(fontSize: 12);

  StageFunctionsPrinterController({
    required this.stageFunctionsPrint,
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
        return pw.Column(
          children: _getPageContent(),
        );
      },
    );
  }

  pw.Widget _getRowTitle() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(
        top: 20,
        left: 35,
      ),
      child: pw.Row(
        children: [
          pw.Text(
            '${stageFunctionsPrint.instituitionName}',
            style: _headerStyle,
          ),
        ],
      ),
    );
  }

  List<pw.Widget> _getPageContent() {
    List<pw.Widget> widgets = [];
    widgets.add(_getRowTitle());
    widgets.add(
      pw.SizedBox(height: 8),
    );
    widgets.add(_getRowHeader());
    widgets.add(pw.SizedBox(height: 10));
    _addPrints(widgets);
    return widgets;
  }

  pw.Widget _getRowHeader() {
    return pw.Row(
      children: [
        pw.Container(
          width: 400,
          child: pw.Padding(
            padding: const pw.EdgeInsets.only(left: 35),
            child: pw.Text(
              '${stageFunctionsPrint.localName}',
              style: _titleStyle,
            ),
          ),
        ),
        stageFunctionsPrint.printTagLocal == true
            ? pw.Padding(
                padding: const pw.EdgeInsets.only(top: 10),
                child: pw.Container(
                  child: pw.BarcodeWidget(
                    barcode: Barcode.dataMatrix(),
                    data: stageFunctionsPrint.localTag!,
                    height: 15,
                    width: 15,
                  ),
                  alignment: pw.Alignment.centerRight,
                ),
              )
            : pw.SizedBox(),
      ],
    );
  }

  void _addPrints(
    List<pw.Widget> widgets,
  ) {
    widgets.add(
      pw.Divider(
        height: 2,
        thickness: 1,
      ),
    );
    widgets.add(EntryExitRowWidget(stageFunctionsPrint: stageFunctionsPrint));
    widgets.add(EndReadingRowWidget(stageFunctionsPrint: stageFunctionsPrint));
    widgets.add(CancelRowWidget(stageFunctionsPrint: stageFunctionsPrint));
    widgets.add(YesNoRowWidget(stageFunctionsPrint: stageFunctionsPrint));
    widgets.add(PriorityRowWidget(stageFunctionsPrint: stageFunctionsPrint));
    widgets.add(
      TransferReceiveRowWidget(
        stageFunctionsPrint: stageFunctionsPrint,
      ),
    );
    widgets.add(ZoomRowWidget(stageFunctionsPrint: stageFunctionsPrint));
  }
}
