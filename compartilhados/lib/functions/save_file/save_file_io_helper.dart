import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/file_picker_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

SaveFileInterface getSaveFileInterface() => SaveFileIo();

class SaveFileIo implements SaveFileInterface {
  Future save(
    BuildContext context,
    String docString,
    String docName,
    bool openAfterSave,
  ) async {
    String? path = await FilePicker.platform.saveFile(
      fileName: docName,
    );

    if (path == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Selecione uma pasta para salvar o arquivo',
      );
      return;
    }
    final Uint8List bytes = base64.decode(docString);

    final file = File(path);
    await file.writeAsBytes(bytes);
    bool? open = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Abrir arquivo?',
    );
    if (openAfterSave && open) {
      await launchUrl(Uri.parse('file:///$path'));
    }
  }
}
