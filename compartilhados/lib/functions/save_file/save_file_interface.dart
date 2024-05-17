import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:compartilhados/functions/save_file/save_file_helper_stub.dart'
    if (dart.library.io) 'save_file_io_helper.dart'
    if (dart.library.html) 'save_file_helper_web.dart';

abstract class SaveFileInterface {
  Future save(
    BuildContext context,
    String docString,
    String docName,
    bool openAfterSave,
  );

  factory SaveFileInterface() => getSaveFileInterface();
}
