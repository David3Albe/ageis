import 'package:ageiscme_impressoes/dto/company_locals_print/company_locals_print_dto.dart';
import 'package:ageiscme_impressoes/dto/company_locals_print/company_locals_print_local_dto.dart/company_locals_print_local_dto.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class CompanyLocalsPrinterController {
  CompanyLocalsPrintDTO companyLocalsPrint;
  BuildContext context;
  List<CompanyLocalsPrintLocalDTO>? get _locals => companyLocalsPrint.locals;
  pw.TextStyle _titleStyle = const pw.TextStyle(fontSize: 16);
  pw.TextStyle _headerStyle = const pw.TextStyle(fontSize: 12);
  pw.TextStyle _miniHeaderStyle = const pw.TextStyle(fontSize: 8);
  pw.TextStyle _style = const pw.TextStyle(fontSize: 12);
  pw.TextStyle _miniStyle = const pw.TextStyle(fontSize: 8);

  CompanyLocalsPrinterController({
    required this.companyLocalsPrint,
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

    if (_locals == null || _locals!.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário imprimir ao menos um local',
      );
      return;
    }

    List<List<CompanyLocalsPrintLocalDTO>> localsLists =
        ListHelper.dividirLista(_locals!, 20);

    for (List<CompanyLocalsPrintLocalDTO> locals in localsLists) {
      pdf.addPage(
        _createPage(
          locals,
        ),
      );
    }

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage(
    List<CompanyLocalsPrintLocalDTO> locals,
  ) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Column(
          children: _getPageContent(
            locals,
          ),
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
            '${companyLocalsPrint.companyName}',
            style: _titleStyle,
          ),
        ],
      ),
    );
  }

  List<pw.Widget> _getPageContent(
    List<CompanyLocalsPrintLocalDTO> locals,
  ) {
    List<pw.Widget> widgets = [];
    widgets.add(_getRowTitle());
    widgets.add(
      pw.SizedBox(height: 8),
    );
    widgets.add(_getRowHeader());
    widgets.add(pw.SizedBox(height: 10));
    _addLocals(widgets, locals);
    return widgets;
  }

  pw.Widget _getRowHeader() {
    return pw.Row(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 40),
          child: pw.Text(
            'Locais para Distribuição e Recebimento de Materiais',
            style: _headerStyle,
          ),
        ),
        pw.Expanded(
          child: pw.Padding(
            padding: const pw.EdgeInsets.only(top: 10),
            child: pw.Container(
              child: pw.BarcodeWidget(
                barcode: Barcode.dataMatrix(),
                data: '99900100000999',
                height: 15,
                width: 15,
              ),
              alignment: pw.Alignment.centerRight,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Padding(
            padding: const pw.EdgeInsets.only(right: 40, left: 3),
            child: pw.Text(
              'Inserir',
              style: _miniHeaderStyle,
            ),
          ),
        ),
      ],
    );
  }

  void _addLocals(
    List<pw.Widget> widgets,
    List<CompanyLocalsPrintLocalDTO> locals,
  ) {
    widgets.add(
      pw.Divider(
        height: 2,
        thickness: 1,
      ),
    );
    for (int i = 0; i <= locals.length - 1; i += 2) {
      CompanyLocalsPrintLocalDTO? secondLocal = locals.elementAtOrNull(i + 1);
      widgets.add(pw.SizedBox(height: 7));
      widgets.add(_getRowLocal(locals[i], secondLocal));
      widgets.add(
        pw.Divider(
          height: 2,
          thickness: 1,
        ),
      );
    }
  }

  pw.Widget _getRowLocal(
    CompanyLocalsPrintLocalDTO local,
    CompanyLocalsPrintLocalDTO? secondLocal,
  ) {
    List<pw.Widget> widgets = [];
    widgets.add(_getLocal(local, pw.Alignment.centerLeft));
    if (secondLocal != null) {
      widgets.add(_getLocal(secondLocal, pw.Alignment.center, padLeft: 70));
    }
    return pw.Padding(
      padding: const pw.EdgeInsets.only(
        left: 20,
      ),
      child: pw.Row(
        children: widgets,
      ),
    );
  }

  pw.Widget _getLocal(
    CompanyLocalsPrintLocalDTO local,
    pw.Alignment alignment, {
    double padLeft = 40,
  }) {
    String localName = local.name;
    if (localName.length > 40) localName = localName.substring(0, 40) + '...';
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(left: padLeft),
        child: pw.Container(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(localName, style: _style),
              pw.SizedBox(height: 5),
              pw.BarcodeWidget(
                barcode: Barcode.dataMatrix(),
                data: local.tagId,
                height: 20,
                width: 20,
              ),
              pw.SizedBox(height: 5),
              pw.Padding(
                child: pw.Text(local.tagId, style: _miniStyle),
                padding: const pw.EdgeInsets.only(
                  left: 3,
                ),
              ),
              pw.SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
