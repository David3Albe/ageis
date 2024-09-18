import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_grid_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_grid_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/grid/escala_grid_page_header_widget.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/exporters/pluto_grid_csv_export.dart';
import 'package:compartilhados/exporters/pluto_grid_pdf_export.dart';
import 'package:compartilhados/exporters/pluto_grid_xml_export.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:dependencias_comuns/font_awesome_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';
import 'package:dependencias_comuns/pluto_grid_data_export.dart' as pluto;

class EscalaPageGridWidget extends StatefulWidget {
  const EscalaPageGridWidget({
    super.key,
  });

  @override
  State<EscalaPageGridWidget> createState() => _EscalaPageGridWidgetState();
}

class _EscalaPageGridWidgetState extends State<EscalaPageGridWidget> {
  static double _getFontSize(Size size) {
    double height = size.height;
    if (height > 900) {
      return 12;
    }
    if (height > 750) {
      return 11;
    }
    return 10;
  }

  static double getRowsSize(Size size) {
    double height = size.height;
    if (height > 900) {
      return 45;
    }
    if (height > 750) {
      return 41;
    }
    if (height > 600) {
      return 36;
    }
    return 31;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = _getFontSize(size);
    double rowsSize = getRowsSize(size);
    return BlocBuilder<EscalaPageGridCubit, EscalaPageGridState>(
      builder: (context, state) {
        PlutoGridStateManager? stateManager = state.stateManager;
        if (stateManager != null) {
          stateManager.removeColumns(stateManager.columns);
          stateManager.insertColumns(0, state.columns);
          stateManager.removeAllRows();
          stateManager.insertRows(0, state.rows);
          if (stateManager.columns.isNotEmpty) {
            stateManager.setRowGroup(
              PlutoRowGroupByColumnDelegate(
                enableCompactCount: true,
                columns: [stateManager.columns[0]],
                showFirstExpandableIcon: false,
              ),
            );
          }
        }
        return ContextMenuOverlay(
          buttonStyle: const ContextMenuButtonStyle(
            textStyle: TextStyle(fontSize: 12),
          ),
          child: ContextMenuRegion(
            contextMenu: GenericContextMenu(
              buttonStyle: const ContextMenuButtonStyle(
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
              buttonConfigs: [
                ContextMenuButtonConfig(
                  'XML',
                  icon: const FaIcon(FontAwesomeIcons.file),
                  onPressed: () => exportXml(
                    columns: [],
                    context: context,
                  ),
                ),
                ContextMenuButtonConfig(
                  'CSV',
                  icon: const FaIcon(FontAwesomeIcons.fileCsv),
                  onPressed: () => exportCSV(
                    columns: [],
                    context: context,
                  ),
                ),
                ContextMenuButtonConfig(
                  'PDF',
                  icon: const FaIcon(FontAwesomeIcons.filePdf),
                  onPressed: () => exportPDF(
                    columns: [],
                    context: context,
                  ),
                ),
              ],
            ),
            child: PlutoGrid(
              key: BlocProvider.of<EscalaPageCubit>(context).state.gridKey,
              columnGroups: state.groups,
              configuration: PlutoGridConfiguration(
                localeText: const PlutoGridLocaleText.brazilianPortuguese(),
                style: PlutoGridStyleConfig(
                  cellTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                  ),
                  columnTextStyle: TextStyle(fontSize: fontSize),
                  rowHeight: rowsSize,
                  rowColor: const Color(0xffF4F4F4),
                ),
              ),
              createHeader: (stateManager) => EscalaGridPageHeaderWidget(
                adicionarLinhaTurno: () =>
                    BlocProvider.of<EscalaPageGridCubit>(context)
                        .criarLinha(columns: stateManager.columns),
                stateManager: stateManager,
              ),
              columns: [],
              rows: [],
              onChanged: (event) => onChanged(
                event: event,
                context: context,
              ),
              onLoaded: (e) {
                List<PlutoColumn> columns = [];
                if (e.stateManager.columns.isNotEmpty) {
                  columns = [e.stateManager.columns[0]];
                }
                e.stateManager.setRowGroup(
                  PlutoRowGroupByColumnDelegate(
                    enableCompactCount: true,
                    columns: columns,
                    showFirstExpandableIcon: false,
                  ),
                );
                BlocProvider.of<EscalaPageGridCubit>(context)
                    .setStateManager(stateManager: e.stateManager);
              },
            ),
          ),
        );
      },
    );
  }

  void exportXml({
    required BuildContext context,
    required List<CustomDataColumn> columns,
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    PlutoGridXmlExport xmlExport = PlutoGridXmlExport(
      dataColumns: columns,
      context: context,
      stateManager: stateManager,
      columnsToIgnore: [],
    );
    xmlExport.export();
  }

  void exportCSV({
    required BuildContext context,
    required List<CustomDataColumn> columns,
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    PlutoGridCsvExport csvExport = PlutoGridCsvExport(
      columns: columns,
      context: context,
      stateManager: stateManager,
    );
    csvExport.export();
  }

  void exportPDF({
    required BuildContext context,
    required List<CustomDataColumn> columns,
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    DateTime? data =
        BlocProvider.of<EscalaPageCubit>(context).state.escala?.anoMes;
    if (data == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'A escala não está carregada, consulte e tente novamente',
      );
      return;
    }
    DateFormat format = DateFormat('MM/yyyy');
    String anoMes = format.format(data);
    PlutoGridPdfExport pdfExport = PlutoGridPdfExport(
      columns: columns,
      customRow: getCustomRow,
      columnsToIgnore: ['turno'],
      margin: const pluto.EdgeInsets.only(
        top: 30,
        left: 10,
        right: 10,
        bottom: 30,
      ),
      getHeaderWidgetByColumn: (column, style) =>
          getCustomTitleByColumn(column, style, stateManager),
      title: 'Escala $anoMes',
      colorByData: (data) => BlocProvider.of<EscalaPageGridCubit>(context)
          .getPdfColorFromData(data: data, context: context),
      colorByColumn: (column) => BlocProvider.of<EscalaPageGridCubit>(context)
          .getColorByColumn(column, stateManager, data),
      context: context,
      stateManager: stateManager,
      getWidthByColumn: (column) => getWitdthByColumn(column, stateManager),
    );
    pdfExport.export();
  }

  pluto.Widget? getCustomTitleByColumn(
    PlutoColumn column,
    pluto.TextStyle? style,
    PlutoGridStateManager state,
  ) {
    int? field = int.tryParse(column.field);
    if (field == null) return null;
    PlutoColumnGroup? group = state.columnGroups
        .where((element) => element.fields!.contains(column.field))
        .firstOrNull;
    if (group == null) return null;
    return pluto.RichText(
      textAlign: pluto.TextAlign.center,
      text: pluto.TextSpan(
        children: [
          pluto.TextSpan(
            text: group.title.substring(0, 3) + '\n',
            style: style?.copyWith(
              fontSize: 5,
              fontWeight: pluto.FontWeight.normal,
            ),
          ),
          pluto.TextSpan(
            text: column.title,
            style: style,
          ),
        ],
      ),
    );
  }

  double? getWitdthByColumn(
    PlutoColumn column,
    PlutoGridStateManager state,
  ) {
    int? field = int.tryParse(column.field);
    if (field == null) return null;
    PlutoColumnGroup? group = state.columnGroups
        .where((element) => element.fields!.contains(column.field))
        .firstOrNull;
    if (group == null) return null;
    return 7;
  }

  List<pluto.Widget>? getCustomRow(Map<PlutoCell?, dynamic> data) {
    List<pluto.Widget> widgets = [];
    String? usuario = data.entries
        .where((element) => element.key?.column.field == 'usuario')
        .firstOrNull
        ?.value;
    if (usuario != null && usuario != '') {
      return null;
    }

    widgets.add(
      pluto.Container(
        alignment: pluto.Alignment.center,
        decoration: const pluto.BoxDecoration(
          border: pluto.Border(
            left: pluto.BorderSide(
              color: pluto.PdfColors.black,
              width: 0.5,
            ),
            top: pluto.BorderSide(
              color: pluto.PdfColors.black,
              width: 0.5,
            ),
            bottom: pluto.BorderSide(
              color: pluto.PdfColors.black,
              width: 0.5,
            ),
          ),
        ),
        constraints: const pluto.BoxConstraints(minHeight: 20),
        child: pluto.Text(
          data.entries
                  .where((element) => element.key?.column.field == 'turno')
                  .firstOrNull
                  ?.value
                  .toString() ??
              'Sem Turno Definido',
          style: pluto.TextStyle(
            fontWeight: pluto.FontWeight.bold,
            fontSize: 8,
          ),
        ),
      ),
    );
    for (int i = 0; i <= data.length - 2; i++) {
      widgets.add(
        pluto.Container(
          decoration: pluto.BoxDecoration(
            border: pluto.Border(
              bottom: const pluto.BorderSide(
                color: pluto.PdfColors.black,
                width: 0.5,
              ),
              top: const pluto.BorderSide(
                color: pluto.PdfColors.black,
                width: 0.5,
              ),
              right: i == (data.length - 3)
                  ? const pluto.BorderSide(
                      color: pluto.PdfColors.black,
                      width: 0.5,
                    )
                  : pluto.BorderSide.none,
            ),
          ),
          alignment: pluto.Alignment.center,
          constraints: const pluto.BoxConstraints(minHeight: 20),
          child: pluto.Text(
            '',
            style: pluto.TextStyle(
              fontWeight: pluto.FontWeight.bold,
              fontSize: 8,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  void onChanged({
    required PlutoGridOnChangedEvent event,
    required BuildContext context,
  }) {
    EasyThrottle.throttle('on-change', const Duration(seconds: 2), () {
      PlutoGridStateManager? stateManager =
          BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
      if (stateManager == null) return;
      if (event.oldValue == event.value) return;
      if (event.column.field != 'usuario') return;
      for (PlutoRow row in stateManager.iterateRowAndGroup) {
        TurnoShortResponseDTO? turno = event.row.cells['turno']!.value;
        TurnoShortResponseDTO? turnoRow = row.cells['turno']!.value;
        if (turnoRow?.cod != turno?.cod) {
          continue;
        }

        UsuarioDropDownSearchResponseDTO? usuario = event.value;
        UsuarioDropDownSearchResponseDTO? usuarioRow =
            row.cells['usuario']!.value is UsuarioDropDownSearchResponseDTO
                ? row.cells['usuario']!.value
                : null;
        event.row.cells['docClasse']!.value = usuario?.docClasse ?? '';
        if (usuario?.cod == usuarioRow?.cod && event.row != row) {
          ToastUtils.showCustomToastWarning(
            context,
            'Usuário já está adicionado a esse turno',
          );
          stateManager.removeRows([event.row]);
          return;
        }
      }
    });
  }
}
