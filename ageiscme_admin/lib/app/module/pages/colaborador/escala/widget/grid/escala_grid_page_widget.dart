import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_grid_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/states/escala_page_grid_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/grid/escala_grid_page_header_widget.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/exporters/pluto_grid_csv_export.dart';
import 'package:compartilhados/exporters/pluto_grid_pdf_export.dart';
import 'package:compartilhados/exporters/pluto_grid_xml_export.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/font_awesome_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class EscalaPageGridWidget extends StatefulWidget {
  const EscalaPageGridWidget({
    super.key,
  });

  @override
  State<EscalaPageGridWidget> createState() => _EscalaPageGridWidgetState();
}

class _EscalaPageGridWidgetState extends State<EscalaPageGridWidget> {
  @override
  Widget build(BuildContext context) {
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
                    context: context,
                  ),
                ),
                ContextMenuButtonConfig(
                  'CSV',
                  icon: const FaIcon(FontAwesomeIcons.fileCsv),
                  onPressed: () => exportCSV(
                    context: context,
                  ),
                ),
                ContextMenuButtonConfig(
                  'PDF',
                  icon: const FaIcon(FontAwesomeIcons.filePdf),
                  onPressed: () => exportPDF(
                    context: context,
                  ),
                ),
              ],
            ),
            child: PlutoGrid(
              configuration: const PlutoGridConfiguration(
                localeText: PlutoGridLocaleText.brazilianPortuguese(),
                style: PlutoGridStyleConfig(
                  cellTextStyle: TextStyle(
                    color: Colors.black,
                  ),
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
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    PlutoGridXmlExport xmlExport = PlutoGridXmlExport(
      context: context,
      stateManager: stateManager,
      columnsToIgnore: [],
    );
    xmlExport.export();
  }

  void exportCSV({
    required BuildContext context,
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    PlutoGridCsvExport csvExport = PlutoGridCsvExport(
      context: context,
      stateManager: stateManager,
    );
    csvExport.export();
  }

  void exportPDF({
    required BuildContext context,
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
      title: 'Escala $anoMes',
      colorByData: (data) => BlocProvider.of<EscalaPageGridCubit>(context)
          .getPdfColorFromData(data: data, context: context),
      context: context,
      stateManager: stateManager,
    );
    pdfExport.export();
  }

  void onChanged({
    required PlutoGridOnChangedEvent event,
    required BuildContext context,
  }) {
    PlutoGridStateManager? stateManager =
        BlocProvider.of<EscalaPageGridCubit>(context).state.stateManager;
    if (stateManager == null) return;
    if (event.oldValue == event.value) return;
    if (event.column.field != 'usuario') return;
    for (PlutoRow row in stateManager.iterateRowAndGroup) {
      TurnoShortResponseDTO? turno = event.row.cells['turno']!.value;
      TurnoShortResponseDTO? turnoRow = row.cells['turno']!.value;
      if (turnoRow?.descricao != turno?.descricao) {
        continue;
      }

      UsuarioDropDownSearchResponseDTO? usuario = event.value;
      UsuarioDropDownSearchResponseDTO? usuarioRow =
          row.cells['usuario']!.value;
      if (usuario?.cod == usuarioRow?.cod && event != row) {
        ToastUtils.showCustomToastWarning(
          context,
          'Usuário já está adicionado a esse turno',
        );
        stateManager.removeRows([event.row]);
      }
    }
  }
}
