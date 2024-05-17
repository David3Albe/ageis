import 'dart:convert';
import 'dart:typed_data';

import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrinterHelper {
  static Future<bool> PrintBase64DocumentDefaultPrinter(
    BuildContext context,
    String impressao,
  ) async {
    final Uint8List bytes = base64.decode(impressao);
    return PrintDocumentDefaultPrinter(context, bytes);
  }

  static Future<bool> PrintDocumentDefaultPrinter(
    BuildContext context,
    Uint8List bytes, {
    bool usePrinterConfig = true,
  }) async {
    PrintingInfo info = await Printing.info();
    if (info.directPrint == true && info.canListPrinters == true) {
      return await _directPrint(
        context,
        bytes,
        false,
        usePrinterConfig: usePrinterConfig,
      );
    }
    return await _printLayout(
      context,
      bytes,
      usePrinterConfig: usePrinterConfig,
    );
  }

  static String decodeBase64(String encodedString) {
    Uint8List decodedBytes = base64.decode(encodedString);
    return utf8.decode(decodedBytes);
  }

  static Future<bool> _directPrint(
    BuildContext context,
    Uint8List bytes,
    bool retryed, {
    bool usePrinterConfig = true,
  }) async {
    List<Printer> printers = await Printing.listPrinters();
    Printer? printer =
        printers.where((element) => element.isDefault).firstOrNull;
    if (printer == null) {
      await ErrorUtils.showErrorDialog(
        context,
        [
          'Defina a impressora padrão, após isso clique em OK para tentar realizar a impressão novamente',
        ],
      );
      if (retryed == true) return await _printLayout(context, bytes);
      return await _directPrint(context, bytes, true);
    }
    return await Printing.directPrintPdf(
      printer: printer,
      onLayout: (PageFormat) => bytes,
      usePrinterSettings: usePrinterConfig,
    );
  }

  static Future<bool> _printLayout(
    BuildContext context,
    Uint8List bytes, {
    bool usePrinterConfig = true,
  }) async {
    return await Printing.layoutPdf(
      onLayout: (PageFormat) => bytes,
      usePrinterSettings: usePrinterConfig,
    );
  }
}
