import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_frm/local_instituicao_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_state.dart';
import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
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

class LocalInstituicaoPage extends StatefulWidget {
  const LocalInstituicaoPage({super.key});

  @override
  State<LocalInstituicaoPage> createState() => _LocalInstituicaoPageState();
}

class _LocalInstituicaoPageState extends State<LocalInstituicaoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Código de Barras', field: 'codBarra'),
    CustomDataColumn(text: 'Contato', field: 'contato'),
    CustomDataColumn(text: 'Localização Física', field: 'localizacao'),
    CustomDataColumn(text: 'Responsável', field: 'responsavel'),
    CustomDataColumn(
      text: 'Centro De Custo',
      field: 'centroCusto',
      valueConverter: (value) => value == null ? '' : value['descricao'],
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Exige Prontuário',
      field: 'exigeProntuario',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Local Conferência',
      field: 'localConferencia',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final LocalInstituicaoPageCubit bloc =
      LocalInstituicaoPageCubit(service: LocalInstituicaoService());

  @override
  void initState() {
    bloc.loadLocalInstituicao();
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
              LocalInstituicaoModel.empty(),
            ),
          },
        ),
        BlocListener<LocalInstituicaoPageCubit, LocalInstituicaoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child:
              BlocBuilder<LocalInstituicaoPageCubit, LocalInstituicaoPageState>(
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
                    onEdit: (LocalInstituicaoModel objeto) {
                      openModal(
                        context,
                        LocalInstituicaoModel.copy(objeto),
                      );
                    },
                    onDelete: (LocalInstituicaoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.locaisInstituicao,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, LocalInstituicaoModel localInstituicao) {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      theme: Theme.of(context),
      title: 'Cadastro/Edição Locais da Instituição',
      widget: LocalInstituicaoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        localInstituicao: localInstituicao,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadLocalInstituicao();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    LocalInstituicaoModel localInstituicao,
  ) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Local da Instituição\n${localInstituicao.cod} - ${localInstituicao.nome}',
      onConfirm: () => onConfirmDelete(localInstituicao),
    );
  }

  void onConfirmDelete(LocalInstituicaoModel obj) {
    bloc.delete(obj);
  }

  void deleted(LocalInstituicaoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadLocalInstituicao();
  }

  void onError(LocalInstituicaoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
