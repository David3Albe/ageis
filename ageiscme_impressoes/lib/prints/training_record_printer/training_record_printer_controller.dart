import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:ageiscme_impressoes/dto/training_record/user/training_record_user_print_dto.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/description_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/header_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/presence_description_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/user_widget.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/widgets.dart' as pw;

class TrainingRecordPrinterController {
  final TrainingRecordPrintDTO dto;
  mat.BuildContext context;

  TrainingRecordPrinterController({
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
    if (dto.users.isEmpty) {
      await WarningUtils.showWarningDialog(
        context,
        'Não há usuários para imprimir a lista de treinamento',
      );
      return;
    }

    bool first = true;
    while (dto.users.isNotEmpty) {
      pdf.addPage(
        _createPage(
          first: first,
        ),
      );
      first = false;
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({
    required bool first,
  }) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(first: first),
          ),
          padding: const pw.EdgeInsets.only(
            left: 40,
            top: 20,
            bottom: 40,
            right: 20,
          ),
        );
      },
    );
  }

  List<pw.Widget> _getPage({
    required bool first,
  }) {
    List<pw.Widget> widgets = [];
    widgets.add(HeaderWidget(dto: dto));
    if (first) {
      widgets.add(DescriptionWidget(dto: dto));
    }
    widgets.add(PresenceDescriptionWidget());

    int usersToPrint = first ? 10 : 20;
    List<Widget> usersInRow = [];
    while (usersToPrint > 0) {
      TrainingRecordUserPrintDTO? user = dto.users.firstOrNull;
      if (user == null) break;
      usersInRow.add(UserWidget(dto: dto, user: user));
      dto.users.remove(user);
      usersToPrint--;
    }

    while (usersInRow.isNotEmpty) {
      widgets.add(
        pw.Row(
          children: usersInRow,
        ),
      );
    }
    widgets.add(Spacer());

    return widgets;
  }
}
