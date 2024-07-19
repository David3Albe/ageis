import 'package:ageiscme_admin/app/module/pages/colaborador/turno/frm/turno_frm_page.dart';
import 'package:ageiscme_data/services/turno/turno_service.dart';
import 'package:ageiscme_models/dto/turno/query/turno_query_dto.dart';
import 'package:ageiscme_models/dto/turno/remove/turno_remove_dto.dart';
import 'package:ageiscme_models/response_dto/turno/query/item/turno_query_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/query/turno_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/remove/turno_remove_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/pluto_grid_api_widget.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class TurnoPageWidget extends StatelessWidget {
  const TurnoPageWidget({super.key});

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(
          text: 'Descrição',
          field: 'descricao',
        ),
        CustomDataColumn(
          text: 'Ativo',
          field: 'ativo',
          type: CustomDataColumnType.Checkbox,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    late void Function() resetarGrid;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: () => resetarGrid(),
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            AddButtonWidget(
              onPressed: () => openModal(
                context: context,
                resetarGrid: resetarGrid,
                cod: -1,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGridApiWidget<TurnoQueryItemResponseDTO>(
              onEdit: (objeto) => openModalGrid(
                context: context,
                resetarGrid: resetarGrid,
                item: objeto,
              ),
              onDelete: (objeto) => remover(
                item: objeto,
                context: context,
                resetarGrid: resetarGrid,
              ),
              fromJson: (objectsSerialized) => objectsSerialized.map(
                (json) => TurnoQueryItemResponseDTO.fromJson(json),
              ),
              resetGridPagionationBuilder:
                  (context, resetGridPaginationBuilder) =>
                      resetarGrid = resetGridPaginationBuilder,
              onFetch: (filter) => onFetch(filter: filter, context: context),
              filterOnlyActives: true,
              columns: _getColunas(),
            ),
          ),
        ),
      ],
    );
  }

  Future<PlutoGridInfiniteScrollModel?> onFetch({
    required PlutoGridApiModel filter,
    required BuildContext context,
  }) async {
    TurnoQueryDTO dto = TurnoQueryDTO(gridFilter: filter);
    LoadingController loading = LoadingController(context: context);
    (String, TurnoQueryResponseDTO)? result =
        await Modular.get<TurnoService>().query(dto: dto);
    loading.closeDefault();
    return result?.$2.plutoData;
  }

  Future remover({
    required TurnoQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a exclusão do Turno: \n${item.cod} - ${item.descricao}',
      onConfirm: () => onConfirmRemover(
        context: context,
        item: item,
        resetarGrid: resetarGrid,
      ),
    );
  }

  void onConfirmRemover({
    required TurnoQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    TurnoRemoveDTO dto = TurnoRemoveDTO(cod: item.cod, tstamp: item.tstamp);

    LoadingController loading = LoadingController(context: context);
    (String, TurnoRemoveResponseDTO)? result =
        await Modular.get<TurnoService>().delete(dto);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    resetarGrid();
  }

  Future openModalGrid({
    required BuildContext context,
    required Function() resetarGrid,
    required TurnoQueryItemResponseDTO item,
  }) async =>
      await openModal(
        context: context,
        resetarGrid: resetarGrid,
        cod: item.cod,
      );

  Future openModal({
    required BuildContext context,
    required Function() resetarGrid,
    int? cod,
  }) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Turno',
      widget: TurnoFrmPage(
        cod: cod,
        onCancel: () => onCancel(chave),
        onSaved: () => onSaved(chave, context, resetarGrid),
      ),
    );
  }

  void onSaved(
    int chave,
    BuildContext context,
    Function() resetarGrid,
  ) {
    WindowsHelper.RemoverWidget(chave);
    resetarGrid();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }
}
