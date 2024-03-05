import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:flutter/material.dart';

OpenDocInterface getOpenDocHelper() => OpenDocHelperWeb();

class OpenDocHelperWeb implements OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  ) async {
    print(2);

    final Uint8List bytes = base64.decode(docString);
    final Blob blob = Blob([bytes]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..setAttribute('download', docName)
      ..click();

    Url.revokeObjectUrl(url);
  }
}
