import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_stub.dart' //
    if (dart.library.io) 'open_doc_io_helper.dart'
    if (dart.library.html) 'open_doc_helper_web.dart';

abstract class OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  );

  factory OpenDocInterface() => getOpenDocHelper();
}
