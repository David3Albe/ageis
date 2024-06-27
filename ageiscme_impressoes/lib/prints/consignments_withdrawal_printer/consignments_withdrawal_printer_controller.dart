import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments/consignments_withdrawal_consignment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments_withdrawal_print_dto.dart';
import 'package:ageiscme_impressoes/prints/consignments_withdrawal_printer/widgets/consigned_widget.dart';
import 'package:ageiscme_impressoes/prints/consignments_withdrawal_printer/widgets/fotter_widget.dart';
import 'package:ageiscme_impressoes/prints/consignments_withdrawal_printer/widgets/header_widget.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class ConsignmentsWithdrawalPrinterController {
  final ConsignmentsWithdrawalPrintDTO dto;
  mat.BuildContext context;

  ConsignmentsWithdrawalPrinterController({
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
    if (dto.items.isEmpty) {
      WarningUtils.showWarningDialog(
        context,
        'Não há itens consignados para imprimir a lista de retirada',
      );
      return;
    }

    ImagemModel? imagem = await ImagemService().getLogoAgeis();

    for (List<Widget> widgets in _getPageWidgets(imagem)) {
      pdf.addPage(
        _createPage(widgets: widgets),
      );
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({
    required List<Widget> widgets,
  }) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: widgets,
          ),
          padding: const pw.EdgeInsets.only(
            left: 30,
            top: 25,
            bottom: 25,
            right: 30,
          ),
        );
      },
    );
  }

  int calculatePages(int totalItems) {
    return 1 + ((totalItems - 10) / 11).ceil();
  }

  List<List<pw.Widget>> _getPageWidgets(ImagemModel? imagem) {
    List<List<pw.Widget>> widgets = [];
    bool first = true;
    widgets.add([]);

    List<pw.Widget> page = widgets.last;
    page.add(HeaderWidget(dto: dto, imagem: imagem));
    int pages = calculatePages(dto.items.length);

    int itensPagina = 0;
    for (ConsignmentsWithdrawalConsignmentPrintDTO item in dto.items) {
      int limitesWidgetsPagina = 10;
      if (!first) limitesWidgetsPagina = 11;
      if (itensPagina >= limitesWidgetsPagina) {
        _adicionarIndicePagina(page: page, widgets: widgets, pages: pages);
        page = widgets.last;
        first = false;
        itensPagina = 0;
      }
      page.add(
        ConsignedWidget(
          dto: dto,
          consignment: item,
        ),
      );
      itensPagina++;
    }

    if (widgets.last.isNotEmpty) {
      _adicionarIndicePagina(
        page: page,
        widgets: widgets,
        pages: pages,
      );
    }

    widgets.removeWhere((element) => element.isEmpty);
    List<Widget> ultimaPagina = widgets.last;
    if (widgets.last.length >= 10) {
      widgets.add([]);
      ultimaPagina.add(FotterWidget(dto: dto));
    } else {
      ultimaPagina.insert(ultimaPagina.length - 2, FotterWidget(dto: dto));
    }
    return widgets;
  }

  void _adicionarIndicePagina({
    required List<pw.Widget> page,
    required List<List<pw.Widget>> widgets,
    required int pages,
  }) {
    page.add(Spacer());
    page.add(
      pw.Row(
        children: [
          Spacer(),
          pw.Text(
            'Pág. ${widgets.length}/$pages',
            style: const pw.TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
    widgets.add([]);
  }
}
