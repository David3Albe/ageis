import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:flutter/material.dart';

class SaveFileHelperStub implements SaveFileInterface {
  Future save(
    BuildContext context,
    String docString,
    String docName,
    bool openAfterSave,
  ) {
    throw UnimplementedError('getSaveFileInterface');
  }
}

SaveFileInterface getSaveFileInterface() =>
    throw UnimplementedError('getSaveFileInterface');
