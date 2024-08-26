import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/frm/anormalidade_tipo_frm_page.dart';
import 'package:ageiscme_data/services/anormalidade_tipo/anormalidade_tipo_service.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/query/anormalidade_tipo_query_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/remove/anormalidade_tipo_remove_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/query/anormalidade_tipo_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/query/item/anormalidade_tipo_query_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/remove/anormalidade_tipo_remove_response_dto.dart';
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

class AnormalidadeTipoPageWidget extends StatelessWidget {
  const AnormalidadeTipoPageWidget({super.key});

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(
          text: 'Nome',
          field: 'nome',
        ),
        CustomDataColumn(
          text: 'Bloquear Equipamento da Etapa',
          field: 'bloqueioEtapa',
          type: CustomDataColumnType.Checkbox,
        ),
        CustomDataColumn(
          text: 'Bloquear Itens Processados da Etapa de Processo',
          field: 'bloqueioItens',
          type: CustomDataColumnType.Checkbox,
        ),
        CustomDataColumn(
          text: 'Bloquear os Itens Processados e subsequentes',
          field: 'bloqueioTotal',
          type: CustomDataColumnType.Checkbox,
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
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => openModal(
                context,
                resetarGrid,
                -1,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGridApiWidget<AnormalidadeTipoQueryItemResponseDTO>(
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
                (json) => AnormalidadeTipoQueryItemResponseDTO.fromJson(json),
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
    AnormalidadeTipoQueryDTO dto = AnormalidadeTipoQueryDTO(gridFilter: filter);
    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeTipoQueryResponseDTO)? result =
        await Modular.get<AnormalidadeTipoService>().query(dto: dto);
    loading.closeDefault();
    return result?.$2.plutoData;
  }

  void remover({
    required AnormalidadeTipoQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a exclusão do tipo de anormalidade: \n${item.cod} - ${item.nome}',
      onConfirm: () => confirmRemover(
        item: item,
        context: context,
        resetarGrid: resetarGrid,
      ),
    );
  }

  Future confirmRemover({
    required AnormalidadeTipoQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    AnormalidadeTipoRemoveDTO dto =
        AnormalidadeTipoRemoveDTO(cod: item.cod, tstamp: item.tstamp);

    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeTipoRemoveResponseDTO)? result =
        await Modular.get<AnormalidadeTipoService>().delete(dto);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    resetarGrid();
  }

  Future openModalGrid({
    required BuildContext context,
    required Function() resetarGrid,
    required AnormalidadeTipoQueryItemResponseDTO item,
  }) async =>
      await openModal(
        context,
        resetarGrid,
        item.cod,
      );

  Future openModal(
    BuildContext context,
    Function() resetarGrid,
    int? cod,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (cod ?? 0).toString(),
      title: 'Cadastro/Edição Tipo de Anormalidade',
      widget: AnormalidadeTipoFrmPage(
        onCancel: () => onCancel(chave),
        onSaved: () => onSaved(resetarGrid, chave),
        cod: cod,
      ),
    );
  }

  void onSaved(
    Function() resetarGrid,
    int chave,
  ) {
    WindowsHelper.RemoverWidget(chave);
    resetarGrid();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }
}
