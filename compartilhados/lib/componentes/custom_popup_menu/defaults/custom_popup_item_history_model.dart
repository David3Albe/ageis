import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/uuid_export.dart';
import 'package:flutter/material.dart';

class CustomPopupItemHistoryModel {
  static CustomPopupItemModel getHistoryItem({
    required String title,
    BuildContext? context,
    Widget? child,
  }) =>
      CustomPopupItemModel(
        text: 'Histórico',
        onTap: () => abrirHistorico(context!, title, child!),
      );

  static void abrirHistorico(
    BuildContext context,
    String title,
    Widget child,
  ) {
    WindowsHelper.OpenDefaultWindows(
      identificador: const Uuid().v4(),
      widget: child,
      title: 'Histórico - $title',
    );
  }
}
