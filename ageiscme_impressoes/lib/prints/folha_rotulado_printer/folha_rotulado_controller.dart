import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_item_print/folha_rotulado_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_print_dto.dart';
import 'package:ageiscme_impressoes/prints/folha_rotulado_printer/widgets/header_row_widget.dart';
import 'package:ageiscme_impressoes/prints/folha_rotulado_printer/widgets/items_row_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class FolhaRotuladoPrintController {
  final FolhaRotuladoPrintDTO dto;
  BuildContext context;
  static const double DEFAULT_PADDING_TOP = 1;

  FolhaRotuladoPrintController({
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

    if (dto.itensPorTipo.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário imprimir ao menos um item',
      );
      return;
    }

    createData(pdf);

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  void createData(pw.Document pdf) {
    int row = 0;
    List<List<pw.Widget>> allWidgets = [];
    allWidgets.add([]);
    dto.itensPorTipo.forEach((key, value) {
      row += 6;
      List<pw.Widget> widgets = allWidgets.last;
      if (validateGeneratePage(row, pdf, widgets, key)) {
        allWidgets.add([]);
        widgets = allWidgets.last;
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 40, top: 10),
            child: HeaderRowWidget(tipo: key),
          ),
        );
        row = 6;
      } else {
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 40, top: 10),
            child: HeaderRowWidget(tipo: key),
          ),
        );
      }
      for (int i = 0; i < value.length; i += 3) {
        widgets = allWidgets.last;
        FolhaRotuladoItemPrintDTO itemOne = value[i];
        FolhaRotuladoItemPrintDTO? itemTwo = value.elementAtOrNull(i + 1);
        FolhaRotuladoItemPrintDTO? itemThree = value.elementAtOrNull(i + 2);
        widgets.add(
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 40),
            child: ItemsRowWidget(
              itemOne: itemOne,
              itemTwo: itemTwo,
              itemThree: itemThree,
            ),
          ),
        );
        row += 10;
        widgets = allWidgets.last;

        if (validateGeneratePage(row, pdf, widgets, key)) {
          FolhaRotuladoItemPrintDTO lastItem = itemThree ?? itemTwo ?? itemOne;
          row = 0;
          allWidgets.add([]);
          widgets = allWidgets.last;
          if (lastItem != value.last) {
            widgets.add(
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 40, top: 10),
                child: HeaderRowWidget(tipo: key),
              ),
            );
          }
          row += 3;
        }
      }
      if (dto.itensPorTipo.keys.last == key) {
        pdf.addPage(_createPage(widgets, key));
      }
    });
  }

  pw.Page _createPage(List<pw.Widget> widgets, String tipo) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: widgets,
        );
      },
    );
  }

  bool validateGeneratePage(
    int row,
    pw.Document pdf,
    List<pw.Widget> widgets,
    String tipo,
  ) {
    bool generatePage = row >= 105;
    if (generatePage) {
      pdf.addPage(_createPage(widgets, tipo));
    }
    return generatePage;
  }
}
