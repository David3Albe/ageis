import 'dart:math';

import 'package:ageiscme_impressoes/dto/epi_delivery/epi/epi_delivery_epi_print_dto.dart';
import 'package:ageiscme_impressoes/dto/epi_delivery/epi_delivery_print_dto.dart';
import 'package:ageiscme_impressoes/prints/epi_delivery/widgets/epi_widget.dart';
import 'package:ageiscme_impressoes/prints/epi_delivery/widgets/footer_widget.dart';
import 'package:ageiscme_impressoes/prints/epi_delivery/widgets/header_widget.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class EpiDeliveryPrinterController {
  final EpiDeliveryPrintDTO dto;
  mat.BuildContext context;

  EpiDeliveryPrinterController({
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
    if (dto.epis.isEmpty) {
      await WarningUtils.showWarningDialog(
        context,
        'Não há Epis para imprimir',
      );
      return;
    }

    List<List<EpiDeliveryEpiPrintDTO>> listasEpis = [];
    listasEpis.add(dto.epis.getRange(0, min(15, dto.epis.length)).toList());

    if (dto.epis.length > 15) {
      listasEpis.addAll(
        ListHelper.dividirLista(
          dto.epis.getRange(15, dto.epis.length).toList(),
          27,
        ),
      );
    }

    int page = 1;
    for (List<EpiDeliveryEpiPrintDTO> epis in listasEpis) {
      pdf.addPage(
        _createPage(
          page: page,
          epis: epis,
        ),
      );
      page++;
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({
    required int page,
    required Iterable<EpiDeliveryEpiPrintDTO> epis,
  }) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(
              page: page,
              epis: epis,
            ),
          ),
          padding: const pw.EdgeInsets.only(
            left: 35,
            top: 25,
            bottom: 25,
            right: 35,
          ),
        );
      },
    );
  }

  List<pw.Widget> _getPage({
    required int page,
    required Iterable<EpiDeliveryEpiPrintDTO> epis,
  }) {
    List<pw.Widget> widgets = [];
    widgets.add(HeaderWidget(dto: dto));

    widgets.add(Padding(padding: const EdgeInsets.only(top: 16)));

    for (EpiDeliveryEpiPrintDTO epi in epis) {
      widgets.add(EpiWidget(dto: dto, epi: epi));
    }

    widgets.add(Padding(padding: const EdgeInsets.only(top: 16)));
    
    widgets.add(FooterWidget(dto: dto));

    return widgets;
  }
}
