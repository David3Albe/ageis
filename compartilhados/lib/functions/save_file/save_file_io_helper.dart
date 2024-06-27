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
  Future save({
    required BuildContext context,
    required String docString,
    required String docName,
    required bool openAfterSave,
    bool encodeAsUtf8 = false,
  }) async {
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
    Uint8List bytes = base64.decode(docString);
    if (encodeAsUtf8) {
      String decodedString = utf8.decode(bytes);
      bytes = Uint8List.fromList(decodedString.codeUnits);
    }

    final file = File(path);
    await file.writeAsBytes(bytes);
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Abrir arquivo?',
      onCancel: () => {},
      onConfirm: () => onConfirm(openAfterSave, path),
    );
  }

  Future onConfirm(bool openAfterSave, String path) async {
    if (!openAfterSave) return;
    await launchUrl(Uri.parse('file:///$path'));
  }
}
