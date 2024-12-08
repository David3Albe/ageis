import 'package:ageiscme_admin/app/module/pages/processo/liberacao_leituras/cubit/liberacao_leituras_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/liberacao_leituras/detalhamento/presenter/liberacao_leituras_detalhamento_presenter_page.dart';
import 'package:ageiscme_data/services/processo_leitura_andamento/processo_leitura_andamento_service.dart';
import 'package:ageiscme_models/models/processo_leitura_andamento/processo_leitura_andamento_model.dart';
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
import 'package:dependencias_comuns/uuid_export.dart';
import 'package:flutter/material.dart';

class LiberacaoLeiturasPresenterPage extends StatefulWidget {
  const LiberacaoLeiturasPresenterPage({super.key});

  @override
  State<LiberacaoLeiturasPresenterPage> createState() =>
      _LiberacaoLeiturasPresenterPageState();
}

class _LiberacaoLeiturasPresenterPageState
    extends State<LiberacaoLeiturasPresenterPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Usuário',
      field: 'usuario',
      valueConverter: (value) => value?['nome'] ?? '',
    ),
    CustomDataColumn(
      text: 'Data Hora',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Máquina',
      field: 'maquina',
    ),
  ];

  final LiberacaoLeiturasPageCubit bloc =
      LiberacaoLeiturasPageCubit(service: ProcessoLeituraAndamentoService());

  @override
  void initState() {
    bloc.loadLeiturasEmAndamento();
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
              onPressed: bloc.loadLeiturasEmAndamento,
            ),
          ],
        ),
        BlocListener<LiberacaoLeiturasPageCubit, LiberacaoLeiturasPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<LiberacaoLeiturasPageCubit,
              LiberacaoLeiturasPageState>(
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
                    onDelete: (ProcessoLeituraAndamentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.leiturasEmAndamento,
                    onDetail: (event, obj) async {
                      await detail(
                        context,
                        obj.cod!,
                        obj.codUsuario!,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future detail(
    BuildContext context,
    int cod,
    int codUsuario,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      identificador: const Uuid().v4(),
      title: 'Consulta Liberação Leitura - Detalhamento',
      widget: LiberacaoLeiturasDetalhamentoPresenterPage(
        cod: cod,
        codUsuario: codUsuario,
      ),
    );
  }

  void delete(
    BuildContext context,
    ProcessoLeituraAndamentoModel leituraEmAndamento,
  ) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da leitura em andamento: ${leituraEmAndamento.cod}\nEm execução por: Usuário: ${leituraEmAndamento.usuario?.nome}',
      onConfirm: () => onConfirmDelete(leituraEmAndamento),
    );
  }

  void onConfirmDelete(
    ProcessoLeituraAndamentoModel leituraEmAndamento,
  ) {
    bloc.delete(leituraEmAndamento);
  }

  void deleted(LiberacaoLeiturasPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadLeiturasEmAndamento();
  }

  void onError(LiberacaoLeiturasPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
