import 'package:ageiscme_data/services/authentication/authentication_service.dart';
import 'package:ageiscme_impressoes/dto/user_tag_print/user_tag_print_dto.dart';
import 'package:ageiscme_impressoes/prints/user_tag_printer/user_tag_printer_controller.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrmHelper {
  static Future printTag(
    int tagId,
    String userName,
    BuildContext context,
  ) async {
    bool possui = await usuarioLogadoPossuiDireito(context: context);
    if(!possui) return;
    UserTagPrintDTO userTagPrint =
        UserTagPrintDTO(tagId: tagId, userName: userName);
    UserTagPrinterController controller = UserTagPrinterController(
      context: context,
      userTagPrintDTO: userTagPrint,
    );
    await controller.printTag();
  }

  static Future<bool> usuarioLogadoPossuiDireito({
    required BuildContext context,
  }) async {
    try {
      bool? possui = await AuthenticationService()
          .hasRight(DireitoEnum.UsuariosManutencao);
      if (possui == true) return true;
      ToastUtils.showCustomToastWarning(
        context,
        'Usuário sem permissão para impressão de etiqueta',
      );
      return false;
    } catch (ex) {
      await ErrorUtils.showOneErrorDialog(context, ex.toString());
      return false;
    }
  }
}
