import 'package:ageiscme_impressoes/dto/ciclo_print/ciclo_print_dto.dart';
import 'package:ageiscme_impressoes/dto/ciclo_print/items/ciclo_print_items_dto.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class CicloPrinterController {
  final CicloPrintDTO dto;
  BuildContext context;
  static const double DEFAULT_PADDING_TOP = 1;

  CicloPrinterController({
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
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário imprimir ao menos um Ciclo',
      );
      return;
    }

    List<List<CicloPrintItemsDTO>> arsenaisGrouped =
        ListHelper.dividirLista(dto.items, 50);

    for (List<CicloPrintItemsDTO> arsenaisSeparados in arsenaisGrouped) {
      pdf.addPage(
        _createPage(arsenaisSeparados),
      );
    }

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage(List<CicloPrintItemsDTO> items) {
    return pw.Page(
      orientation: pw.PageOrientation.landscape,
      margin: const pw.EdgeInsets.only(left: 20, right: 20),
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                top: 20,
              ),
            ),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    decoration: border,
                    child: pw.Center(
                      child: pw.Text(
                        dto.instituicao,
                        style: pw.TextStyle(
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                top: 5,
              ),
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    'RELATÓRIO DE CICLOS',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(
                top: 5,
              ),
            ),
            getTable(),
          ],
        );
      },
    );
  }

  pw.Table getTable() {
    List<pw.TableRow> rows = [];
    rows.add(getHeaderRow());
    rows.add(createSeparatorRow());
    for (CicloPrintItemsDTO item in dto.items) {
      rows.add(getItemRow(item));
    }

    return pw.Table(
      children: rows,
    );
  }

  static const double sizeText = 7;
  static const double sizeHeader = 8;
  static pw.BoxDecoration border = pw.BoxDecoration(
    border: pw.Border.all(
      color: PdfColors.black,
      width: 0.2,
    ),
  );

  pw.TableRow createSeparatorRow() {
    return pw.TableRow(
      children: [
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
        pw.SizedBox(height: 5),
      ],
    );
  }

  pw.TableRow getItemRow(CicloPrintItemsDTO item) {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return pw.TableRow(
      children: [
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            format.format(item.dataHora),
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.equipamento,
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.processo,
            style: const pw.TextStyle(
              fontSize: sizeText,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.codKit ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.nomeKit ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.idEtiqueta ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.nomeItem ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.proprietario ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.indicador,
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.lote,
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.loteEquipamento ?? '',
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2),
          child: pw.Text(
            item.usuario,
            style: const pw.TextStyle(fontSize: sizeText),
          ),
        ),
      ],
    );
  }

  pw.TableRow getHeaderRow() {
    return pw.TableRow(
      children: [
        pw.Container(
          decoration: border,
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          child: pw.Text(
            'DATA/HORA',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'EQUIPAMENTO',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'PROCESSO',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'COD_KIT',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'KIT',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'ETIQUETA',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'ITEM',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'PROPRIETÁRIO',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'INDICADOR',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'LOTE',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'LOTE EQUIPAMENTO',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 2, top: 1, bottom: 1),
          decoration: border,
          child: pw.Text(
            'USUÁRIO',
            style: pw.TextStyle(
              fontSize: sizeHeader,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
