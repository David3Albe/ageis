import 'package:ageiscme_impressoes/dto/user_print/user_print_dto.dart';
import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_company_response/user_print_company_response_dto.dart';
import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_response_dto.dart';
import 'package:ageiscme_impressoes/response_dto/user_print_response/user_print_user_response/user_print_user_response_dto.dart';
import 'package:ageiscme_impressoes/services/user_print/user_print_service.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/list_helper.dart';
import 'package:compartilhados/functions/printer/printer_helper.dart';
import 'package:dependencias_comuns/printing_exports.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class UserPrintController {
  UserPrintDTO userPrintDTO;
  BuildContext context;
  UserPrintResponseDTO? _response;
  List<UserPrintUserResponseDTO>? get _users => _response?.users;
  UserPrintCompanyResponseDTO? get _company => _response?.company;
  pw.TextStyle _titleStyle =
      pw.TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  pw.TextStyle _style = const pw.TextStyle(fontSize: 8);
  pw.TextStyle _boldStyle =
      pw.TextStyle(fontSize: 8, fontWeight: FontWeight.bold);

  UserPrintController({
    required this.userPrintDTO,
    required this.context,
  });

  Future<UserPrintResponseDTO?> _getUserPrintResponse() async =>
      (await UserPrintService().findData(userPrintDTO))?.$2;

  Future print() async {
    final Font font = await PdfGoogleFonts.openSansRegular();
    final Font fontBold = await PdfGoogleFonts.openSansBold();
    pw.ThemeData themeOpenSans = pw.ThemeData.withFont(
      base: font,
      bold: fontBold,
    );
    final pdf = pw.Document(theme: themeOpenSans);

    _response = await _getUserPrintResponse();
    if (_response == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Houve um erro ao buscar os usuários para imprimir',
      );
      return;
    }
    List<List<UserPrintUserResponseDTO>> listasUsuario =
        ListHelper.dividirLista(_users!, 50);

    int pagina = 1;
    int totalPaginas = listasUsuario.length;
    for (List<UserPrintUserResponseDTO> usuarios in listasUsuario) {
      pdf.addPage(
        _createPage(
          usuarios,
          pagina,
          totalPaginas,
        ),
      );
      pagina++;
    }

    await PrinterHelper.PrintDocumentDefaultPrinter(
      context,
      await pdf.save(),
    );
  }

  pw.Page _createPage(
    List<UserPrintUserResponseDTO> usuarios,
    int pagina,
    int totalPaginas,
  ) {
    return pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: _getPageContent(
            usuarios,
            pagina,
            totalPaginas,
          ),
        );
      },
    );
  }

  pw.Row _getRowTitle() {
    String titleType = _getTitleType();
    return pw.Row(
      children: [
        pw.Text(
          'USUÁRIOS CADASTRADOS ($titleType) - ${_company?.name}',
          style: _titleStyle,
        ),
      ],
    );
  }

  String _getTitleType() {
    if (userPrintDTO.actives && userPrintDTO.inactives) {
      return 'ATIVOS, INATIVOS';
    } else if (userPrintDTO.actives) {
      return 'ATIVOS';
    }
    return 'INATIVOS';
  }

  List<pw.Widget> _getPageContent(
    List<UserPrintUserResponseDTO> usuarios,
    int pagina,
    int totalPaginas,
  ) {
    List<pw.Widget> widgets = [];
    widgets.add(_getRowTitle());
    widgets.add(
      pw.SizedBox(height: 12),
    );
    widgets.add(_getRowHeader());
    widgets.add(pw.SizedBox(height: 7));
    _addUsers(widgets, usuarios);
    widgets.add(pw.SizedBox(height: 3));
    widgets.add(_getRowFotter(pagina, totalPaginas));
    return widgets;
  }

  pw.Row _getRowHeader() {
    return pw.Row(
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Container(
            child: pw.Text(
              'NOME',
              style: _boldStyle,
            ),
            alignment: pw.Alignment.centerLeft,
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            child: pw.Text(
              'RG',
              style: _boldStyle,
            ),
            alignment: pw.Alignment.center,
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            child: pw.Text(
              'Crachá',
              style: _boldStyle,
            ),
            alignment: pw.Alignment.centerRight,
          ),
        ),
      ],
    );
  }

  pw.Row _getRowFotter(int pagina, int totalPaginas) {
    return pw.Row(
      children: [
        pw.Expanded(
          child: pw.Container(
            child: pw.Text('Pág. $pagina/$totalPaginas', style: _boldStyle),
            alignment: pw.Alignment.centerRight,
          ),
        ),
      ],
    );
  }

  void _addUsers(
    List<pw.Widget> widgets,
    List<UserPrintUserResponseDTO> usuarios,
  ) {
    if (_users == null) ;
    for (UserPrintUserResponseDTO user in usuarios) {
      widgets.add(_getUserRow(user));
      widgets.add(
        pw.Divider(
          height: 2,
          thickness: 1.2,
        ),
      );
    }
  }

  pw.Widget _getUserRow(UserPrintUserResponseDTO user) {
    String userName = user.userName;
    if (userName.length > 50) userName = user.userName.substring(0, 50) + '...';
    return pw.Row(
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Container(
            child: pw.Text(userName, style: _style),
            alignment: pw.Alignment.centerLeft,
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            child: pw.Text(user.rg.toString(), style: _style),
            alignment: pw.Alignment.center,
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            child: pw.Text(user.tagId.toString(), style: _style),
            alignment: pw.Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}
