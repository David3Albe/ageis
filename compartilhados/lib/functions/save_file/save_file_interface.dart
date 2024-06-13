import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:compartilhados/functions/save_file/save_file_helper_stub.dart'
    if (dart.library.io) 'save_file_io_helper.dart'
    if (dart.library.html) 'save_file_helper_web.dart';

abstract class SaveFileInterface {
  Future save({
    required BuildContext context,
    required String docString,
    required String docName,
    required bool openAfterSave,
    bool encodeAsUtf8 = false,
  });

  factory SaveFileInterface() => getSaveFileInterface();
}
