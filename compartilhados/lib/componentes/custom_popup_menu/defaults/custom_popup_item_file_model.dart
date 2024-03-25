import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/functions/file_helper/file_helper.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';

class CustomPopupItemFileModel {
  static CustomPopupItemModel getFileItem(
    String text,
    void Function(Future<FileObjectModel?> Function()) onTap,
  ) =>
      CustomPopupItemModel(
        text: text,
        onTap: () => onTap(FileHelper.selectFile),
      );
}
