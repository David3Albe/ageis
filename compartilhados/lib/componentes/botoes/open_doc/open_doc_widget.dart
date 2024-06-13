import 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_stub.dart'
    if (dart.library.html) 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_web.dart'
    if (dart.library.io) 'package:compartilhados/componentes/botoes/open_doc/open_doc_io_helper.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class OpenDocWidget extends StatefulWidget {
  final String? documentoString;
  final String documentName;
  final bool readonly;
  final String? placeholder;

  OpenDocWidget({
    required this.documentoString,
    required this.documentName,
    this.readonly = false,
    required this.placeholder,
  });

  @override
  State<OpenDocWidget> createState() => _OpenDocWidgetState();
}

class _OpenDocWidgetState extends State<OpenDocWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: !hovered
          ? ElevatedButton.styleFrom(
              backgroundColor: Cores.corBotaoArquivo,
            )
          : ElevatedButton.styleFrom(
              backgroundColor: Cores.corBotaoArquivoHover,
            ),
      onPressed: !valid || widget.readonly || widget.documentoString == null
          ? null
          : () {
              _openDocument( 
                context,
                widget.documentoString!,
                widget.documentName,
              );
            },
      child: Padding( 
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12.0 * scaleW,
          vertical: 6.0 * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: const Icon(
                  Symbols.open_in_browser,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.placeholder!,
                  style: TextStyle(
                    color: Cores.corTextoBranco,
                    fontSize: HelperFunctions.calculaFontSize(context, 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDocument(
    BuildContext context,
    String docString,
    String docName,
  ) async {
    OpenDocInterface openDoc = getOpenDocHelper();
    openDoc.open(context, docString, docName);
  }
}
