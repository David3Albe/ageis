import 'package:ageiscme_admin/app/module/pages/colaborador/sigla/frm/sigla_frm_page.dart';
import 'package:ageiscme_data/services/sigla/sigla_service.dart';
import 'package:ageiscme_models/dto/sigla/query/sigla_query_dto.dart';
import 'package:ageiscme_models/dto/sigla/remove/sigla_remove_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/query/item/sigla_query_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/query/sigla_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/remove/sigla_remove_response_dto.dart';
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

class SiglaPageWidget extends StatelessWidget {
  const SiglaPageWidget({super.key});

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(
          text: 'Sigla',
          field: 'sigla',
        ),
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
            child: PlutoGridApiWidget<SiglaQueryItemResponseDTO>(
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
                (json) => SiglaQueryItemResponseDTO.fromJson(json),
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
    SiglaQueryDTO dto = SiglaQueryDTO(gridFilter: filter);
    LoadingController loading = LoadingController(context: context);
    (String, SiglaQueryResponseDTO)? result =
        await Modular.get<SiglaService>().query(dto: dto);
    loading.closeDefault();
    return result?.$2.plutoData;
  }

  Future remover({
    required SiglaQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Confirma a exclusão da Sigla: \n${item.cod} - ${item.sigla}',
      onConfirm: () => onConfirmRemover(
        context: context,
        item: item,
        resetarGrid: resetarGrid,
      ),
    );
  }

  void onConfirmRemover({
    required SiglaQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    SiglaRemoveDTO dto = SiglaRemoveDTO(cod: item.cod, tstamp: item.tstamp);

    LoadingController loading = LoadingController(context: context);
    (String, SiglaRemoveResponseDTO)? result =
        await Modular.get<SiglaService>().delete(dto);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    resetarGrid();
  }

  Future openModalGrid({
    required BuildContext context,
    required Function() resetarGrid,
    required SiglaQueryItemResponseDTO item,
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
    int codigo = cod ?? 0;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: codigo.toString(),
      title: 'Cadastro/Edição Sigla',
      widget: SiglaFrmPage(
        onCancel: () => onCancel(chave),
        onSaved: () => onSaved(resetarGrid: resetarGrid, chave: chave),
        cod: cod,
      ),
    );
  }

  void onSaved({
    required Function() resetarGrid,
    required int chave,
  }) {
    WindowsHelper.RemoverWidget(chave);
    resetarGrid();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }
}
