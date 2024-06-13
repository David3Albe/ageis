import 'dart:convert';

import 'package:compartilhados/exporters/imagem_printing_service_helper.dart';
import 'package:compartilhados/exporters/pdf/custom_pluto_grid_default_pdf_export.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/pluto_grid_data_export.dart';
import 'package:flutter/material.dart';

class PlutoGridPdfExport {
  PlutoGridStateManager stateManager;
  BuildContext context;

  PlutoGridPdfExport({
    required this.stateManager,
    required this.context,
  });

  Future export() async {
    var plutoGridPdfExport = CustomPlutoGridDefaultPdfExport(
      title: 'Consulta',
      creator: 'AGEISCME',
      format: PdfPageFormat.a4.landscape,
      logoEsquerda:
          await ImagemPrintingServiceHelper.loadDefaultWidgetIdentificador(
        identificador: 'logo_impressao_esquerda',
      ),
      logoDireita:
          await ImagemPrintingServiceHelper.loadDefaultWidgetIdentificador(
        identificador: 'logo_impressao_direita',
      ),
    );

    var exported = await plutoGridPdfExport.export(stateManager);
    String base64String = base64Encode(exported);
    SaveFileInterface saveFile = SaveFileInterface();
    await saveFile.save(
        context: context,
        docString: base64String,
        docName: 'Consulta.pdf',
        openAfterSave: true);
  }
}
