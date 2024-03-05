import 'package:ageiscme_impressoes/dto/user_print/user_print_dto.dart';
import 'package:ageiscme_impressoes/prints/user_printer/user_printer_controller.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrmUserPrinterController {
  late final UserPrintDTO dto;

  UsuarioPageFrmUserPrinterController() {
    dto = UserPrintDTO(
      actives: true,
      inactives: false,
    );
  }

  void cancelarImpressao(BuildContext context) {
    Navigator.of(context).pop();
  }

  void imprimir(BuildContext context) async {
    UserPrintController controller =
        UserPrintController(context: context, userPrintDTO: dto);
    await controller.print();
    Navigator.of(context).pop();
  }
}
