import 'package:ageiscme_admin/app/module/pages/processo/acao_ocorrencia/acao_ocorrencia_page_frm/acao_ocorrencia_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/acao_ocorrencia/acao_ocorrencia_page_state.dart';
import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
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

class AcaoOcorrenciaPage extends StatefulWidget {
  const AcaoOcorrenciaPage({super.key});

  @override
  State<AcaoOcorrenciaPage> createState() => _AcaoOcorrenciaPageState();
}

class _AcaoOcorrenciaPageState extends State<AcaoOcorrenciaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 110,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Ação Corretiva (SIM)',
      field: 'acaoCorretiva',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Motivo de Não Correção',
      field: 'motivoNaoCorrecao',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final AcaoOcorrenciaPageCubit bloc =
      AcaoOcorrenciaPageCubit(service: AcaoOcorrenciaService());

  @override
  void initState() {
    bloc.loadAcaoOcorrencia();
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
              onPressed: () => bloc.loadAcaoOcorrencia,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  AcaoOcorrenciaModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<AcaoOcorrenciaPageCubit, AcaoOcorrenciaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<AcaoOcorrenciaPageCubit, AcaoOcorrenciaPageState>(
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
                    onEdit: (AcaoOcorrenciaModel objeto) =>
                        {openModal(context, AcaoOcorrenciaModel.copy(objeto))},
                    onDelete: (AcaoOcorrenciaModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.acoesOcorrencia,
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
    AcaoOcorrenciaModel acaoOcorrencia,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Ação Ocorrência',
      widget: AcaoOcorrenciaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        acaoOcorrencia: acaoOcorrencia,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadAcaoOcorrencia();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, AcaoOcorrenciaModel acaoOcorrencia) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Ação de Ocorrência\n${acaoOcorrencia.cod} - ${acaoOcorrencia.descricao}',
      onConfirm: () => confirmDelete(acaoOcorrencia),
    );
  }

  void confirmDelete(AcaoOcorrenciaModel acaoOcorrencia) async {
    bloc.delete(acaoOcorrencia);
  }

  void deleted(AcaoOcorrenciaPageState state) {
    ToastUtils.showCustomToastSucess(context, state.message);
    bloc.loadAcaoOcorrencia();
  }

  void onError(AcaoOcorrenciaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
