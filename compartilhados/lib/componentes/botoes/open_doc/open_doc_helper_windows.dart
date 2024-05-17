import 'dart:convert';
import 'dart:typed_data';
import 'dart:io' as io;

import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class OpenDocHelperWindows implements OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  ) async {
    final Uint8List bytes = base64.decode(docString);

    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}\\$docName';

    final file = io.File(filePath);
    await file.writeAsBytes(bytes);
    await launchUrl(Uri.parse('file:///$filePath'));
  }
}
