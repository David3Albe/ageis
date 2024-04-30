import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/barcode_item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/barcode_kit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/instituition_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/kit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/limite_item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/limite_kit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/preparado_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/processo_item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/processo_kit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/proprietario_item_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/proprietario_kit_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/tag_id_row_widget.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/widgets/user_row_widget.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class ProcessoPreparationPrinterController {
  final ProcessoPreparationPrintDTO dto;
  mat.BuildContext context;

  ProcessoPreparationPrinterController({
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

    String path = 'urgent_star.png';
    if (kReleaseMode) {
      path = 'assets/urgent_star.png';
    }
    final pw.ImageProvider urgencyImageProvider =
        await imageFromAssetBundle(path);

    for (ProcessoPreparationKitPrintDTO kit in dto.kits) {
      pdf.addPage(
        _createPage(
          urgencyImageProvider: urgencyImageProvider,
          kit: kit,
        ),
      );
    }

    dto.itens.sort((a, b) => a.ordemLeitura.compareTo(b.ordemLeitura));
    for (ProcessoPreparationItemPrintDTO item in dto.itens) {
      pdf.addPage(
        _createPage(
          urgencyImageProvider: urgencyImageProvider,
          item: item,
        ),
      );
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({
    required pw.ImageProvider urgencyImageProvider,
    ProcessoPreparationKitPrintDTO? kit,
    ProcessoPreparationItemPrintDTO? item,
  }) {
    const double inch = 72.0;
    const double cm = inch / 2.54;
    return pw.Page(
      orientation: pw.PageOrientation.landscape,
      margin: pw.EdgeInsets.zero,
      pageFormat: const PdfPageFormat(8.9 * cm, 4.8 * cm, marginAll: 0),
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(
              urgencyImageProvider: urgencyImageProvider,
              item: item,
              kit: kit,
            ),
          ),
          padding: const pw.EdgeInsets.only(left: 10, top: 10),
        );
      },
    );
  }

  List<pw.Widget> _getPage({
    required pw.ImageProvider urgencyImageProvider,
    ProcessoPreparationKitPrintDTO? kit,
    ProcessoPreparationItemPrintDTO? item,
  }) {
    List<pw.Widget> widgets = [];
    widgets.add(InstituitionRowWidget(dto: dto));
    if (item != null) {
      widgets.add(
        ItemRowWidget(
          dto: dto,
          item: item,
        ),
      );
      widgets.add(
        ProprietarioItemRowWidget(
          dto: dto,
          item: item,
        ),
      );
      widgets.add(
        ProcessoItemRowWidget(
          dto: dto,
          item: item,
        ),
      );
    }

    if (kit != null) {
      widgets.add(
        KitRowWidget(
          dto: dto,
          kit: kit,
        ),
      );
      widgets.add(
        ProprietarioKitRowWidget(
          dto: dto,
          kit: kit,
        ),
      );
      widgets.add(
        ProcessoKitRowWidget(
          dto: dto,
          kit: kit,
        ),
      );
    }

    widgets.add(
      PreparadoRowWidget(
        dto: dto,
      ),
    );

    if (kit != null) {
      widgets.add(
        LimiteKitRowWidget(
          dto: dto,
          kit: kit,
        ),
      );
    }
    if (item != null) {
      widgets.add(
        LimiteItemRowWidget(
          dto: dto,
          item: item,
        ),
      );
    }

    widgets.add(UserRowWidget(dto: dto));
    widgets.add(pw.SizedBox(height: 3));

    if (item != null) {
      widgets.add(
        BarcodeItemRowWidget(
          dto: dto,
          item: item,
          urgencyImageProvider: urgencyImageProvider,
        ),
      );
    }

    if (kit != null) {
      widgets.add(
        BarcodeKitRowWidget(
          dto: dto,
          kit: kit,
          urgencyImageProvider: urgencyImageProvider,
        ),
      );
    }

    widgets.add(
      TagIdRowWidget(
        dto: dto,
        tagId: item?.tagId ?? kit!.tagId.toString(),
      ),
    );

    return widgets;
  }
}
