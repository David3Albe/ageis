import 'dart:math';

import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:ageiscme_impressoes/dto/training_record/user/training_record_user_print_dto.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/description_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/header_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/presence_description_widget.dart';
import 'package:ageiscme_impressoes/prints/training_record_printer/widgets/user_widget.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/functions/list_helper.dart';
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
    final Font font = await fontFromAssetBundle('assets/fonts/open-sans-regular.ttf');
    final Font fontBold = await fontFromAssetBundle('assets/fonts/open-sans-bold.ttf');
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
      bold: fontBold,
    );
    final pdf = pw.Document(theme: themeOpenSans);
    if (dto.users.isEmpty) {
      WarningUtils.showWarningDialog(
        context,
        'Não há usuários para imprimir a lista de treinamento',
      );
      return;
    }

    dto.users.sort((a, b) => a.userName.compareTo(b.userName));

    List<List<TrainingRecordUserPrintDTO>> listasUsuario = [];
    listasUsuario
        .add(dto.users.getRange(0, min(15, dto.users.length)).toList());

    if (dto.users.length > 15) {
      listasUsuario.addAll(
        ListHelper.dividirLista(
          dto.users.getRange(15, dto.users.length).toList(),
          27,
        ),
      );
    }

    bool first = true;
    int page = 1;
    for (List<TrainingRecordUserPrintDTO> users in listasUsuario) {
      pdf.addPage(
        _createPage(
          totalUsers: dto.users.length,
          first: first,
          page: page,
          users: users,
        ),
      );
      first = false;
      page++;
    }

    return await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage({
    required bool first,
    required int page,
    required int totalUsers,
    required Iterable<TrainingRecordUserPrintDTO> users,
  }) {
    return pw.Page(
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Padding(
          child: pw.Column(
            children: _getPage(
              totalUsers: totalUsers,
              first: first,
              page: page,
              users: users,
            ),
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

  List<pw.Widget> _getPage({
    required bool first,
    required int page,
    required int totalUsers,
    required Iterable<TrainingRecordUserPrintDTO> users,
  }) {
    List<pw.Widget> widgets = [];
    widgets.add(HeaderWidget(dto: dto));
    if (first) {
      widgets.add(DescriptionWidget(dto: dto));
    }
    widgets.add(
      PresenceDescriptionWidget(),
    );

    int indexUser = 0;
    while (true) {
      TrainingRecordUserPrintDTO? user = users.elementAtOrNull(indexUser);
      if (user == null) break;
      indexUser++;
      TrainingRecordUserPrintDTO? user2 = users.elementAtOrNull(indexUser);
      indexUser++;
      TrainingRecordUserPrintDTO? user3 = users.elementAtOrNull(indexUser);
      indexUser++;
      widgets.add(
        pw.Row(
          children: [
            UserWidget(dto: dto, user: user),
            if (user2 != null) UserWidget(dto: dto, user: user2),
            if (user3 != null) UserWidget(dto: dto, user: user3),
          ],
        ),
      );
    }

    widgets.add(Spacer());
    int totalPages = 1;
    int usersCalc = totalUsers - 10;
    if (usersCalc > 0) totalPages += usersCalc ~/ 20;
    widgets.add(
      pw.Row(
        children: [
          Spacer(),
          pw.Text(
            'Pág. $page/$totalPages',
            style: const pw.TextStyle(fontSize: 10),
          ),
        ],
      ),
    );

    return widgets;
  }
}
