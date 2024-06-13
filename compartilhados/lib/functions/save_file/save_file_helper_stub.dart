import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:flutter/material.dart';

class SaveFileHelperStub implements SaveFileInterface {
  Future save({
    required BuildContext context,
    required String docString,
    required String docName,
    required bool openAfterSave,
    bool encodeAsUtf8 = false,
  }) {
    throw UnimplementedError('getSaveFileInterface');
  }
}

SaveFileInterface getSaveFileInterface() =>
    throw UnimplementedError('getSaveFileInterface');
