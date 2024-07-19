import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_frm/epi_descritor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_state.dart';
import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_models/filters/epi_descritor/epi_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EpiDescritorPage extends StatefulWidget {
  const EpiDescritorPage({super.key});

  @override
  State<EpiDescritorPage> createState() => _EpiDescritorPageState();
}

class _EpiDescritorPageState extends State<EpiDescritorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Número CA',
      field: 'numeroCA',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Tipo EPI',
      field: 'tipoEpi',
      valueConverter: (dynamic value) =>
          EpiDescritorTipoEpiOption.getOpcaoFromId(value),
    ),
    // CustomDataColumn(
    //   text: 'Prazo Validade',
    //   field: 'prazoValidade',
    //   type: CustomDataColumnType.Date,
    // ),
    CustomDataColumn(
      text: 'Conferência Visual',
      field: 'conferenciaVisual',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final EpiDescritorPageCubit bloc;
  late final EpiDescritorService service;

  @override
  void initState() {
    service = EpiDescritorService();
    bloc = EpiDescritorPageCubit(service: service);
    bloc.loadEpiDescritor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: bloc.loadEpiDescritor,
            ),
            const Padding(padding: EdgeInsets.only(left: 4)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  EpiDescritorModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<EpiDescritorPageCubit, EpiDescritorPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<EpiDescritorPageCubit, EpiDescritorPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    orderDescendingFieldColumn: 'cod',
                    filterOnlyActives: true,
                    onEdit: (EpiDescritorModel objeto) =>
                        {openModal(context, EpiDescritorModel.copy(objeto))},
                    onDelete: (EpiDescritorModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.episDescritor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<EpiDescritorModel?> getFilter(
    EpiDescritorModel epiDescritor,
  ) async {
    return service.FilterOne(
      EpiDescritorFilter(
        cod: epiDescritor.cod,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    EpiDescritorModel epiDescritor,
  ) async {
    LoadingController loading = LoadingController(context: context);

    EpiDescritorModel? epi = epiDescritor;
    if (epiDescritor.cod != 0) {
      epi = await getFilter(
        epiDescritor,
      );
      if (epi == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Descritor de Epi',
      widget: EpiDescritorPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        epiDescritor: epi,
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    await bloc.loadEpiDescritor();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, EpiDescritorModel epiDescritor) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Descritor de EPI\n${epiDescritor.cod} - ${epiDescritor.descricao}',
      onConfirm: () => onConfirmDelete(epiDescritor),
    );
  }

  void onConfirmDelete(EpiDescritorModel epiDescritor) {
    bloc.delete(epiDescritor);
  }

  void deleted(EpiDescritorPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadEpiDescritor();
  }

  void onError(EpiDescritorPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Descritor de EPI que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
