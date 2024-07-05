import 'dart:convert';

import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/exporters/imagem_printing_service_helper.dart';
import 'package:compartilhados/exporters/pdf/custom_pluto_grid_default_pdf_export.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/pluto_grid_data_export.dart' as pw;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlutoGridPdfExport {
  PlutoGridStateManager stateManager;
  BuildContext context;
  final pw.PdfColor? Function(dynamic data)? colorByData;
  final pw.PdfColor? Function(PlutoColumn data)? colorByColumn;
  final String title;
  final pw.Widget? Function(PlutoColumn, pw.TextStyle?)? getHeaderWidgetByColumn;
  final pw.EdgeInsets? margin;

  PlutoGridPdfExport({
    required this.stateManager,
    required this.context,
    this.title = 'Consulta',
    this.colorByData,
    this.colorByColumn,
    this.getHeaderWidgetByColumn,
    this.margin,
  });

  Future export({
    bool confirmou = false,
  }) async {
    int rows = stateManager.rows.length;
    if (rows > 500 && confirmou == false) {
      ConfirmDialogUtils.showConfirmAlertDialog(
        context: context,
        message:
            'Há muitos itens para impressão, o máximo para o estilo de pdf é 500 itens, deseja imprimir os 500 primeiros?',
        onConfirm: () => export(confirmou: true),
        onCancel: () => {},
      );
      return;
    }

    final font = await rootBundle.load('fonts/Arial/Arial.ttf');
    final ttf = pw.Font.ttf(font);
    var plutoGridPdfExport = CustomPlutoGridDefaultPdfExport(
      margin: margin,
      colorByColumn: colorByColumn,
      fontsFallback: [ttf],
      getHeaderWidgetByColumn: getHeaderWidgetByColumn,
      colorByData: colorByData,
      title: title,
      creator: 'AGEISCME',
      format: pw.PdfPageFormat.a4.landscape,
      logoEsquerda:
          await ImagemPrintingServiceHelper.loadDefaultWidgetIdentificador(
        identificador: 'logo_impressao_esquerda',
      ),
      logoDireita:
          await ImagemPrintingServiceHelper.loadDefaultWidgetIdentificador(
        identificador: 'logo_impressao_direita',
      ),
    );

    var exported = await plutoGridPdfExport.export(stateManager);
    String base64String = base64Encode(exported);
    SaveFileInterface saveFile = SaveFileInterface();
    await saveFile.save(
      context: context,
      docString: base64String,
      allowedExtensions: ['pdf'],
      docName: null,
      openAfterSave: true,
    );
  }
}
