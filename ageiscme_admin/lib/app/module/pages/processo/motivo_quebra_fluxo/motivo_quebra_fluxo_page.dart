import 'package:ageiscme_admin/app/module/pages/processo/motivo_quebra_fluxo/motivo_quebra_fluxo_page_frm/motivo_quebra_fluxo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/motivo_quebra_fluxo/motivo_quebra_fluxo_page_state.dart';
import 'package:ageiscme_data/services/motivo_quebra_fluxo/motivo_quebra_fluxo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class MotivoQuebraFluxoPage extends StatefulWidget {
  const MotivoQuebraFluxoPage({super.key});

  @override
  State<MotivoQuebraFluxoPage> createState() => _MotivoQuebraFluxoPageState();
}

class _MotivoQuebraFluxoPageState extends State<MotivoQuebraFluxoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final MotivoQuebraFluxoPageCubit bloc =
      MotivoQuebraFluxoPageCubit(service: MotivoQuebraFluxoService());

  @override
  void initState() {
    bloc.loadMotivoQuebraFluxo();
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
              onPressed: bloc.loadMotivoQuebraFluxo,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  MotivoQuebraFluxoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<MotivoQuebraFluxoPageCubit, MotivoQuebraFluxoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<MotivoQuebraFluxoPageCubit,
              MotivoQuebraFluxoPageState>(
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
                    onEdit: (MotivoQuebraFluxoModel objeto) => {
                      openModal(context, MotivoQuebraFluxoModel.copy(objeto)),
                    },
                    onDelete: (MotivoQuebraFluxoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.motivosQuebrasFluxo,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future openModal(
    BuildContext context,
    MotivoQuebraFluxoModel motivoQuebraFluxo,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (motivoQuebraFluxo.cod ?? 0).toString(),
      title: 'Cadastro/Edição Motivo Quebra de Fluxo',
      widget: MotivoQuebraFluxoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        motivoQuebraFluxo: motivoQuebraFluxo,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadMotivoQuebraFluxo();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    MotivoQuebraFluxoModel motivoQuebraFluxo,
  ) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Motivo de Quebra de Fluxo\n${motivoQuebraFluxo.cod} - ${motivoQuebraFluxo.descricao}',
      onConfirm: () => confirmDelete(motivoQuebraFluxo),
    );
  }

  void confirmDelete(
    MotivoQuebraFluxoModel motivoQuebraFluxo,
  ) async {
    bloc.delete(motivoQuebraFluxo);
  }

  void deleted(MotivoQuebraFluxoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadMotivoQuebraFluxo();
  }

  void onError(MotivoQuebraFluxoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
