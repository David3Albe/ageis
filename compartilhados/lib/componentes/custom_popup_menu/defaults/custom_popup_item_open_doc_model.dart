import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/functions/open_doc_helper/open_doc_helper.dart';
import 'package:flutter/widgets.dart';

class CustomPopupItemOpenDocModel {
  static CustomPopupItemModel getOpenDocItem(
    String text,
    BuildContext context,
    String? docString,
    String docName,
  ) =>
      CustomPopupItemModel(
        text: text,
        onTap: () {
          if (docString == null) return;
          OpenDocHelper.openDoc(
            context,
            docString,
            docName,
          );
        },
      );
}
