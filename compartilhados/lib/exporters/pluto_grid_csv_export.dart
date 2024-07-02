import 'dart:convert';

import 'package:compartilhados/exporters/csv/custom_pluto_grid_export_csv.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridCsvExport {
  PlutoGridStateManager stateManager;
  BuildContext context;

  PlutoGridCsvExport({
    required this.stateManager,
    required this.context,
  });

  Future export() async {
    String csv =
        CustomPlutoGridExportCsv.exportCSV(stateManager, fieldDelimiter: ';');
    var exported = utf8.encode(csv);
    String base64String = base64Encode(exported);
    SaveFileInterface saveFile = SaveFileInterface();
    await saveFile.save(
      allowedExtensions: ['csv'],
      context: context,
      docString: base64String,
      docName: null,
      openAfterSave: true,
      encodeAsUtf8: true,
    );
  }
}
