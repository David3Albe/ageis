import 'package:ageiscme_admin/app/module/pages/equipamento/servico_tipo/servico_tipo_page_frm/servico_tipo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/servico_tipo/servico_tipo_page_state.dart';
import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
import 'package:ageiscme_models/models/servico_tipo/servico_tipo_model.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ServicoTipoPage extends StatefulWidget {
  ServicoTipoPage({super.key});

  @override
  State<ServicoTipoPage> createState() => _ServicoTipoPageState();
}

class _ServicoTipoPageState extends State<ServicoTipoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Monitoramento',
      field: 'monitoramento',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Serviços em Equipamentos',
      field: 'servicosEquipamentos',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final ServicoTipoPageCubit bloc =
      ServicoTipoPageCubit(service: ServicoTipoService());

  @override
  void initState() {
    bloc.loadServicoTipo();
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
              ServicoTipoModel.empty(),
            ),
          },
        ),
        BlocListener<ServicoTipoPageCubit, ServicoTipoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ServicoTipoPageCubit, ServicoTipoPageState>(
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
                    onEdit: (ServicoTipoModel objeto) =>
                        {openModal(context, ServicoTipoModel.copy(objeto))},
                    onDelete: (ServicoTipoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.servicosTipo,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, ServicoTipoModel servicoTipo) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ServicoTipoPageFrm(
            servicoTipo: servicoTipo,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadServicoTipo();
    });
  }

  void delete(BuildContext context, ServicoTipoModel servicoTipo) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Tipo de Serviço\n${servicoTipo.cod} - ${servicoTipo.nome}',
    );
    if (confirmacao) bloc.delete(servicoTipo);
  }

  void deleted(ServicoTipoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadServicoTipo();
  }

  void onError(ServicoTipoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
