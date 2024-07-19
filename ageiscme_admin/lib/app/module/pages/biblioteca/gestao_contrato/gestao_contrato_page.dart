import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page_frm/gestao_contrato_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page_state.dart';
import 'package:ageiscme_data/services/gestao_contrato/gestao_contrato_service.dart';
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
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GestaoContratoPage extends StatefulWidget {
  const GestaoContratoPage({super.key});

  @override
  State<GestaoContratoPage> createState() => _GestaoContratoPageState();
}

class _GestaoContratoPageState extends State<GestaoContratoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'descricao'),
    CustomDataColumn(text: 'Link', field: 'link'),
  ];

  final GestaoContratoPageCubit bloc =
      GestaoContratoPageCubit(service: GestaoContratoService());

  @override
  void initState() {
    bloc.loadGestaoContrato();
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
              onPressed: () => bloc.loadGestaoContrato(),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  GestaoContratoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<GestaoContratoPageCubit, GestaoContratoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<GestaoContratoPageCubit, GestaoContratoPageState>(
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
                    onEdit: (GestaoContratoModel objeto) =>
                        {openModal(context, GestaoContratoModel.copy(objeto))},
                    onDelete: (GestaoContratoModel objeto) =>
                        {delete(context, objeto)},
                    onOpen: (GestaoContratoModel objeto) =>
                        {acessar(context, objeto)},
                    columns: colunas,
                    items: state.gestoesContrato,
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
    GestaoContratoModel gestaoContrato,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Gestão Contrato',
      widget: GestaoContratoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        gestaoContrato: gestaoContrato,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadGestaoContrato();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void acessar(BuildContext context, GestaoContratoModel gestaoContrato) async {
    final Uri linkUri = Uri.parse(gestaoContrato.link!);

    if (await canLaunchUrl(linkUri)) {
      await launchUrl(linkUri);
    } else {
      ToastUtils.showCustomToastError(
        context,
        'Não foi possível abrir o link.',
      );
    }
  }

  void delete(BuildContext context, GestaoContratoModel gestaoContrato) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Gestão de Documento\n${gestaoContrato.cod} - ${gestaoContrato.descricao}',
      onConfirm: () => onConfirmDelete(gestaoContrato),
    );
  }

  void onConfirmDelete(GestaoContratoModel obj) {
    bloc.delete(obj);
  }

  void deleted(GestaoContratoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadGestaoContrato();
  }

  void onError(GestaoContratoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
