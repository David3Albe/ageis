import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:flutter/material.dart';

SaveFileInterface getSaveFileInterface() => SaveFileHelperWeb();

class SaveFileHelperWeb implements SaveFileInterface {
  Future save({
    required BuildContext context,
    required String docString,
    required String docName,
    required bool openAfterSave,
    bool encodeAsUtf8 = false,
  }) async {
    final Uint8List bytes = base64.decode(docString);
    final Blob blob = Blob([bytes]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..setAttribute('download', docName)
      ..click();

    Url.revokeObjectUrl(url);
  }
}
