import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:flutter/material.dart';

class OpenDocHelperStub implements OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  ) {
    throw UnimplementedError('getOpenDocHelper');
  }
}

OpenDocInterface getOpenDocHelper() =>
    throw UnimplementedError('getOpenDocHelper');
