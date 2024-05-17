import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/query_dialog/query_dialog_widget.dart';
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
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: child,
        );
      },
    );
  }
}
