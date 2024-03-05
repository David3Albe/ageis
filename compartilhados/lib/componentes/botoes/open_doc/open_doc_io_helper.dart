import 'dart:io';

import 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_mobile.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_windows.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:flutter/material.dart';

OpenDocInterface getOpenDocHelper() => OpenDocIo();

class OpenDocIo implements OpenDocInterface {
  void open(
    BuildContext context,
    String docString,
    String docName,
  ) {
    if (Platform.isWindows) {
      OpenDocHelperWindows().open(context, docString, docName);
    } else {
      OpenDocHelperMobile().open(context, docString, docName);
    }
  }
}
