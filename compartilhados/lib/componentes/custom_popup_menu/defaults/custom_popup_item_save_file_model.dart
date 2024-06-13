import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:flutter/widgets.dart';

class CustomPopupItemSaveFileModel {
  static CustomPopupItemModel getOpenDocItem({
    required String text,
    required BuildContext context,
    required String? docName,
    required String? docString,
  }) =>
      CustomPopupItemModel(
        text: text,
        onTap: () {
          SaveFileInterface saveFile = SaveFileInterface();
          if (docName == null || docString == null) {
            return;
          }
          saveFile.save(
            context: context,
            docString: docString,
            docName: docName,
            openAfterSave: true,
          );
        },
      );
}
