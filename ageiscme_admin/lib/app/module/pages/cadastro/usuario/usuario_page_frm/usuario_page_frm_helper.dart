import 'package:ageiscme_impressoes/dto/user_tag_print/user_tag_print_dto.dart';
import 'package:ageiscme_impressoes/prints/user_tag_printer/user_tag_printer_controller.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrmHelper {
  static Future printTag(
    int tagId,
    String userName,
    BuildContext context,
  ) async {
    UserTagPrintDTO userTagPrint =
        UserTagPrintDTO(tagId: tagId, userName: userName);
    UserTagPrinterController controller = UserTagPrinterController(
      context: context,
      userTagPrintDTO: userTagPrint,
    );
    await controller.printTag();
  }
}
