import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_consignado_print/estoque_item_consignado_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_item_print/estoque_kit_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_print_dto.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/widgets/header_row_widget.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/widgets/item_consignado_row_widget.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/widgets/item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/widgets/kit_item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/estoque_printer/widgets/kit_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class EstoquePrinterController {
  final EstoquePrintDTO dto;
  BuildContext context;

  EstoquePrinterController({
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

    _generatePages(pdf);

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  void _createPage(pw.Document pdf, List<pw.Widget> widgets, int pagina) {
    widgets.insert(0, HeaderRowWidget(dto: dto, pagina: pagina));
    widgets.insert(
      1,
      pw.Padding(
        padding: const pw.EdgeInsets.only(top: 10),
      ),
    );
    widgets.add(
      pw.Padding(
        padding: const pw.EdgeInsets.only(top: 10),
        child: pw.Divider(height: 2, thickness: 1),
      ),
    );
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.Column(
            children: widgets,
          );
        },
      ),
    );
  }

  List<pw.Widget> getLastWidgets(List<List<pw.Widget>> widgetsList) {
    return widgetsList.last;
  }

  void _generatePages(pw.Document pdf) {
    List<List<pw.Widget>> widgetsList = [];
    widgetsList.add([]);

    int itensInPage = 0;
    int pagina = 1;
    for (EstoqueKitPrintDTO kit in dto.kits) {
      getLastWidgets(widgetsList).add(
        KitRowWidget(
          dto: kit,
        ),
      );
      itensInPage++;
      if (itensInPage % 50 == 0) {
        _createPage(pdf, getLastWidgets(widgetsList), pagina);
        widgetsList.add([]);
        pagina++;
      }
      for (EstoqueKitItemPrintDTO itemKit
          in kit.itens.where((element) => element.riscado == true)) {
        getLastWidgets(widgetsList).add(
          KitItemRowWidget(
            dto: itemKit,
          ),
        );
        itensInPage++;
        if (itensInPage % 50 == 0) {
          _createPage(pdf, getLastWidgets(widgetsList), pagina);
          widgetsList.add([]);
          pagina++;
        }
      }
      for (EstoqueKitItemPrintDTO itemKit
          in kit.itens.where((element) => element.riscado != true)) {
        getLastWidgets(widgetsList).add(
          KitItemRowWidget(
            dto: itemKit,
          ),
        );
        itensInPage++;
        if (itensInPage % 50 == 0) {
          _createPage(pdf, getLastWidgets(widgetsList), pagina);
          widgetsList.add([]);
          pagina++;
        }
      }
    }

    for (EstoqueItemPrintDTO item in dto.itens) {
      getLastWidgets(widgetsList).add(
        ItemRowWidget(
          dto: item,
        ),
      );
      itensInPage++;
      if (itensInPage % 50 == 0) {
        _createPage(pdf, getLastWidgets(widgetsList), pagina);
        widgetsList.add([]);
        pagina++;
      }
      for (EstoqueItemConsignadoPrintDTO itemConsignado in item.consignados) {
        getLastWidgets(widgetsList).add(
          ItemConsignadoRowWidget(
            dto: itemConsignado,
          ),
        );
        itensInPage++;
        if (itensInPage % 50 == 0) {
          _createPage(pdf, getLastWidgets(widgetsList), pagina);
          widgetsList.add([]);
          pagina++;
        }
      }
    }

    if (widgetsList.last.isNotEmpty) {
      _createPage(pdf, getLastWidgets(widgetsList), pagina);
      widgetsList.add([]);
      pagina++;
    }
  }
}
