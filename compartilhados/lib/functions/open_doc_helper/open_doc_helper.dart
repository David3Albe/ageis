import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:flutter/widgets.dart';

class OpenDocHelper {
  static void openDoc(
    BuildContext context,
    String docString,
    String docName,
  ) async {
    OpenDocInterface openDoc = OpenDocInterface();
    openDoc.open(
      context,
      docString,
      docName,
    );
  }
}
