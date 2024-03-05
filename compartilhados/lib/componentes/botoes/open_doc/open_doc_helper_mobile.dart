import 'dart:convert';
import 'dart:typed_data';

import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:flutter/material.dart';

class OpenDocHelperMobile implements OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  ) {
    final docBytes = base64Decode(docString);
    final isImage = docString.toLowerCase().contains('.jpg') ||
        docString.toLowerCase().contains('.jpeg') ||
        docString.toLowerCase().contains('.pdf') ||
        docString.toLowerCase().contains('.png');

    if (isImage) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Image.memory(Uint8List.fromList(docBytes)),
        ),
      );
    }
  }
}
