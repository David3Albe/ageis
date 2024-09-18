import 'dart:convert';

import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/functions/save_file/save_file_interface.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/xml_export.dart';
import 'package:flutter/material.dart';

class PlutoGridXmlExport {
  PlutoGridStateManager stateManager;
  BuildContext context;
  List<String> columnsToIgnore;
  List<CustomDataColumn> dataColumns;

  PlutoGridXmlExport({
    required this.stateManager,
    required this.context,
    required this.columnsToIgnore,
    required this.dataColumns,
  });

  Future export() async {
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

    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(
      'DocumentElement',
      attributes: {
        'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
      },
      nest: () {
        for (PlutoRow row in rows) {
          builder.element(
            'CONSULTA',
            nest: () {
              for (PlutoColumn column in columns) {
                String tag = columnTitleToReplace[column.field]!;
                dynamic value = row.cells[column.field]?.value;
                Map<String, String> attributes = {};
                CustomDataColumn? columnData = dataColumns
                    .where((element) => element.field == column.field)
                    .firstOrNull;

                if (value is String && columnData?.incluirApostrofo == true) {
                  value = value == '' ? '' : "'$value'";
                  attributes = {
                    'xsi:type': 'xsd:string',
                  };
                }
                builder.element(
                  attributes: attributes,
                  tag,
                  nest: () {
                    builder.text(
                      value?.toString() ?? '',
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
