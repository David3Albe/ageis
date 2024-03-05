import 'package:ageiscme_impressoes/dto/user_tag_print/user_tag_print_dto.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class UserTagPrinterController {
  UserTagPrintDTO userTagPrintDTO;
  mat.BuildContext context;

  UserTagPrinterController({
    required this.userTagPrintDTO,
    required this.context,
  });

  Future printTag() async {
    final Font font = await PdfGoogleFonts.openSansRegular();
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
    );
    final pdf = pw.Document(
      theme: themeOpenSans,
    );
    pw.TextStyle style = const pw.TextStyle(fontSize: 8);

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.only(top: 40, left: 30),
        build: (pw.Context context) {
          return pw.Column(
            children: [
              _getRowDataMatrix(),
              pw.SizedBox(height: 5),
              _getRowUser(style),
            ],
          );
        },
      ),
    );
    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Row _getRowDataMatrix() => pw.Row(
        children: [
          pw.BarcodeWidget(
            barcode: Barcode.dataMatrix(),
            data: userTagPrintDTO.tagId.toString(),
            height: 20,
            width: 20,
          ),
          pw.SizedBox(width: 60),
          pw.BarcodeWidget(
            barcode: Barcode.dataMatrix(),
            data: userTagPrintDTO.tagId.toString(),
            height: 20,
            width: 20,
          ),
          pw.SizedBox(width: 60),
          pw.BarcodeWidget(
            barcode: Barcode.dataMatrix(),
            data: userTagPrintDTO.tagId.toString(),
            height: 20,
            width: 20,
          ),
        ],
      );

  pw.Row _getRowUser(
    pw.TextStyle style,
  ) =>
      pw.Row(
        children: [
          pw.Text(userTagPrintDTO.tagId.toString(), style: style),
          pw.SizedBox(width: 15),
          pw.Text(userTagPrintDTO.userName.toString(), style: style),
        ],
      );
}
