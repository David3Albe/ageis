import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/cubits/atestado_saude_ocupacional_exame_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/frm/atestado_saude_ocupacional_exame_frm_page.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/states/atestado_saude_ocupacional_exame_page_state.dart';
import 'package:ageiscme_data/services/anormalidade/anormalidade_service.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional_exame/atestado_saude_ocupacional_exame_service.dart';
import 'package:ageiscme_models/dto/anormalidade/query/anormalidade_query_dto.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/remove/atestado_saude_ocupacional_exame_remove_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/query/anormalidade_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/query/item/atestado_saude_ocupacional_exame_query_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/remove/atestado_saude_ocupacional_exame_remove_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalExamePageWidget extends StatelessWidget {
  const AtestadoSaudeOcupacionalExamePageWidget({super.key});

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(
          text: 'Cód',
          field: 'cod',
          width: 100,
        ),
        CustomDataColumn(
          text: 'Exame',
          field: 'exame',
        ),
        CustomDataColumn(
          text: 'Data Realização',
          field: 'dataRealizacao',
          type: CustomDataColumnType.Date,
          width: 130,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddButtonWidget(
          onPressed: () => openModal(
            context,
            0,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: BlocBuilder<AtestadoSaudeOcupacionalExamePageCubit,
                AtestadoSaudeOcupacionalExamePageState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: LoadingWidget());
                }
                return PlutoGridWidget(
                  orderDescendingFieldColumn: 'cod',
                  onEdit: (objeto) => openModalGrid(
                    context: context,
                    item: objeto,
                  ),
                  onDelete: (objeto) => remover(
                    item: objeto,
                    context: context,
                  ),
                  items: state.response?.itens ?? [],
                  columns: _getColunas(),
                );
              },
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
    required AtestadoSaudeOcupacionalExameQueryItemResponseDTO item,
    required BuildContext context,
  }) {
    DateFormat format = DateFormat('dd/MM/yyyy');
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a exclusão do registro de exame: ${item.cod} - ${item.exame}\nFeito em: ${format.format(item.dataRealizacao)}',
      onConfirm: () => confirmRemover(
        item: item,
        context: context,
      ),
    );
  }

  Future confirmRemover({
    required AtestadoSaudeOcupacionalExameQueryItemResponseDTO item,
    required BuildContext context,
  }) async {
    AtestadoSaudeOcupacionalExameRemoveDTO dto =
        AtestadoSaudeOcupacionalExameRemoveDTO(
      cod: item.cod,
      tstamp: item.tstamp,
    );

    LoadingController loading = LoadingController(context: context);
    (String, AtestadoSaudeOcupacionalExameRemoveResponseDTO)? result =
        await Modular.get<AtestadoSaudeOcupacionalExameService>().delete(dto);
    loading.closeDefault();
    if (result == null) return;
    ToastUtils.showCustomToastSucess(context, result.$1);
    await BlocProvider.of<AtestadoSaudeOcupacionalExamePageCubit>(context)
        .load();
  }

  Future openModalGrid({
    required BuildContext context,
    required AtestadoSaudeOcupacionalExameQueryItemResponseDTO item,
  }) async =>
      await openModal(
        context,
        item.cod,
      );

  Future openModal(
    BuildContext context,
    int cod,
  ) async {
    late int chave;
    AtestadoSaudeOcupacionalExamePageCubit asoExameCubit =
        BlocProvider.of<AtestadoSaudeOcupacionalExamePageCubit>(context);
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Exame ASO ${asoExameCubit.aso.cod!}',
      widget: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: asoExameCubit),
        ],
        child: AtestadoSaudeOcupacionalExameFrmPage(
          codExame: cod,
          onCancel: () => onCancel(chave),
          onSaved: () => onSaved(chave, context),
          aso: asoExameCubit.aso,
        ),
      ),
    );
  }

  void onSaved(
    int chave,
    BuildContext context,
  ) {
    WindowsHelper.RemoverWidget(chave);
    BlocProvider.of<AtestadoSaudeOcupacionalExamePageCubit>(context).load();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }
}
