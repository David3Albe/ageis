import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/frm/anormalidade_frm_page.dart';
import 'package:ageiscme_data/services/anormalidade/anormalidade_service.dart';
import 'package:ageiscme_models/dto/anormalidade/query/anormalidade_query_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/remove/anormalidade_remove_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/query/anormalidade_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/query/item/anormalidade_query_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/remove/anormalidade_remove_response_dto.dart';
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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AnormalidadePageWidget extends StatelessWidget {
  const AnormalidadePageWidget({super.key});

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(
          text: 'Cód',
          field: 'cod',
          width: 100,
        ),
        CustomDataColumn(
          text: 'Usuário',
          field: 'nomeUsuario',
        ),
        CustomDataColumn(
          text: 'Data Hora',
          field: 'dataHora',
          type: CustomDataColumnType.DateTime,
        ),
        CustomDataColumn(
          text: 'ID Etiqueta',
          field: 'idEtiqueta',
        ),
        CustomDataColumn(
          text: 'Nome Item',
          field: 'nomeItem',
        ),
        CustomDataColumn(
          text: 'Etapa',
          field: 'nomeProessoEtapa',
          type: CustomDataColumnType.DateTime,
        ),
        CustomDataColumn(
          text: 'Tipo Anormalidade',
          field: 'nomeAnormalidadeTipo',
        ),
        CustomDataColumn(
          text: 'Usuário Liberação',
          field: 'nomeUsuarioLiberacao',
        ),
        CustomDataColumn(
          text: 'Data Liberação',
          field: 'dataLiberacao',
          type: CustomDataColumnType.DateTime,
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
                0,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGridApiWidget<AnormalidadeQueryItemResponseDTO>(
              orderDescendingFieldColumn: 'dataHora',
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
                (json) => AnormalidadeQueryItemResponseDTO.fromJson(json),
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
    AnormalidadeQueryDTO dto = AnormalidadeQueryDTO(gridFilter: filter);
    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeQueryResponseDTO)? result =
        await Modular.get<AnormalidadeService>().query(dto: dto);
    loading.closeDefault();
    return result?.$2.plutoData;
  }

  void remover({
    required AnormalidadeQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a exclusão do registro de anormalidade: \n${item.cod} - feito pelo usuário: ${item.nomeUsuario}',
      onConfirm: () => confirmRemover(
        item: item,
        context: context,
        resetarGrid: resetarGrid,
      ),
    );
  }

  Future confirmRemover({
    required AnormalidadeQueryItemResponseDTO item,
    required BuildContext context,
    required Function() resetarGrid,
  }) async {
    AnormalidadeRemoveDTO dto = AnormalidadeRemoveDTO(
      cod: item.cod,
      tstamp: item.tstamp!,
    );

    LoadingController loading = LoadingController(context: context);
    (String, AnormalidadeRemoveResponseDTO)? result =
        await Modular.get<AnormalidadeService>().delete(dto);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    resetarGrid();
  }

  Future openModalGrid({
    required BuildContext context,
    required Function() resetarGrid,
    required AnormalidadeQueryItemResponseDTO item,
  }) async =>
      await openModal(
        context,
        resetarGrid,
        item.cod,
      );

  Future openModal(
    BuildContext context,
    Function() resetarGrid,
    int cod,
  ) async {
    late int chave;
    ProcessoEtapaCubit cubit = BlocProvider.of<ProcessoEtapaCubit>(context);
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Anormalidade',
      widget: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: cubit,
          ),
        ],
        child: AnormalidadeFrmPage(
          onCancel: () => onCancel(chave),
          onSaved: () => onSaved(chave, resetarGrid),
          cod: cod,
        ),
      ),
    );
  }

  void onSaved(
    int chave,
    Function() resetarGrid,
  ) {
    WindowsHelper.RemoverWidget(chave);
    resetarGrid();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }
}
