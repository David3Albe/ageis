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
    required String? docName,
    required bool openAfterSave,
    bool encodeAsUtf8 = false,
    List<String>? allowedExtensions,
  }) async {
    String? path = await FilePicker.platform.saveFile(
      fileName: docName,
      allowedExtensions: allowedExtensions,
      type: allowedExtensions == null || allowedExtensions.isEmpty
          ? FileType.any
          : FileType.custom,
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
    if (allowedExtensions != null &&
        allowedExtensions.isNotEmpty &&
        allowedExtensions.length == 1) {
      String firstExtension = allowedExtensions.first;
      if (!path.toLowerCase().endsWith(firstExtension.toLowerCase())) {
        if (!path.endsWith('.')) {
          path += '.';
        }
        path += firstExtension;
      }
    }

    final file = File(path);
    await file.writeAsBytes(bytes);
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Abrir arquivo?',
      onCancel: () => {},
      onConfirm: () => onConfirm(openAfterSave, path!),
    );
  }

  Future onConfirm(bool openAfterSave, String path) async {
    if (!openAfterSave) return;
    await launchUrl(Uri.parse('file:///$path'));
  }
}
