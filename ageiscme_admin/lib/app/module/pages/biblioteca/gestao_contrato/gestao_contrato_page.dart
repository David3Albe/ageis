import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page_frm/gestao_contrato_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page_state.dart';
import 'package:ageiscme_data/services/gestao_contrato/gestao_contrato_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GestaoContratoPage extends StatefulWidget {
  GestaoContratoPage({super.key});

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
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              GestaoContratoModel.empty(),
            ),
          },
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

  void openModal(BuildContext context, GestaoContratoModel gestaoContrato) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: GestaoContratoPageFrm(
            gestaoContrato: gestaoContrato,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadGestaoContrato();
    });
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

  void delete(BuildContext context, GestaoContratoModel gestaoContrato) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da Gestão de Documento\n${gestaoContrato.cod} - ${gestaoContrato.descricao}',
    );
    if (confirmacao) bloc.delete(gestaoContrato);
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
