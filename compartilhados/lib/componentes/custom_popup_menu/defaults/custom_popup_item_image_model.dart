import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/functions/image_helper/image_helper.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';

class CustomPopupItemImageModel {
  static CustomPopupItemModel getImageItem(
    String text,
    void Function(Future<ImageObjectModel?> Function()) onTap,
  ) =>
      CustomPopupItemModel(
        text: text,
        onTap: () => onTap(ImageHelper.selectImage),
      );
}
