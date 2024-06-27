import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:flutter/material.dart';

class CustomPopupItemHistoryModel {
  static CustomPopupItemModel getHistoryItem({
    BuildContext? context,
    Widget? child,
  }) =>
      CustomPopupItemModel(
        text: 'Histórico',
        onTap: () => abrirHistorico(context!, child!),
      );

  static void abrirHistorico(
    BuildContext context,
    Widget child,
  ) {
    WindowsHelper.OpenDefaultWindows(
      widget: child,
      title: 'Histórico',
    );
  }
}
