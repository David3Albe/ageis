import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/clipboard_export.dart';
import 'package:flutter/material.dart';

class ClipboardHelper {
  static void copy({
    required String text,
    BuildContext? context,
  }) async {
    await FlutterClipboard.copy(text);
    if (context == null) return;
    ToastUtils.showCustomToastNotice(
      context,
      'Copiado para a área de transferência',
    );
  }
}
