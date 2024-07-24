import 'dart:convert';

import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/xml_export.dart';
import 'package:flutter/material.dart';

class PlutoGridXmlExport {
  PlutoGridStateManager stateManager;
  BuildContext context;
  List<String> columnsToIgnore;

  PlutoGridXmlExport({
    required this.stateManager,
    required this.context,
    required this.columnsToIgnore,
  });

  Future export() async{
    LoadingController? loading = LoadingController(context: context);
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      _export().then((value) => loading.closeDefault());
    });
  }

  XmlBuilder _getXmlBuilder() {
    final builder = XmlBuilder();
    Map<String, String> columnTitleToReplace = {};
    List<PlutoRow> rows = stateManager.rows;
    List<PlutoColumn> columns = stateManager.columns
        .where(
          (e) => !columnsToIgnore.contains(
            e.field,
          ),
        )
        .toList();

    for (PlutoColumn column in columns) {
      columnTitleToReplace[column.field] = '_' +
          column.title
              .replaceAll(' ', '.')
              .replaceAll('/', '.')
              .replaceAll('(', '.')
              .replaceAll(')', '.')
              .replaceAll('.', '');
    }

    builder.processing('xml', 'version="1.0"');
    builder.element(
      'DocumentElement',
      nest: () {
        for (PlutoRow row in rows) {
          builder.element(
            'CONSULTA',
            nest: () {
              for (PlutoColumn column in columns) {
                builder.element(
                  columnTitleToReplace[column.field]!,
                  nest: () {
                    builder.text(
                      row.cells[column.field]?.value?.toString() ?? '',
                    );
                  },
                );
              }
            },
          );
        }
      },
    );
    return builder;
  }

  Future<String> _getXmlString() {
    String xml = _getXmlBuilder().buildDocument().toXmlString();
    return Future.value(xml);
  }

  Future _export() async {
    String strXml = await _getXmlString();
    String base64String = base64Encode(utf8.encode(strXml));
    SaveFileInterface saveFile = SaveFileInterface();
    await saveFile.save(
      context: context,
      docString: base64String,
      allowedExtensions: ['xml'],
      docName: null,
      openAfterSave: true,
    );
  }
}
