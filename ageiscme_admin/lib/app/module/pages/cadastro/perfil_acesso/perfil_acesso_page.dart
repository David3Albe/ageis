import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/direito/direito_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/perfil_acesso/perfil_acesso_page_frm/perfil_acesso_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/perfil_acesso/perfil_acesso_page_state.dart';
import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/filters/direito/direito_filter.dart';
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

class PerfilAcessoPage extends StatefulWidget {
  PerfilAcessoPage({super.key});

  @override
  State<PerfilAcessoPage> createState() => _PerfilAcessoPageState();
}

class _PerfilAcessoPageState extends State<PerfilAcessoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Perfil Restrito',
      field: 'perfilRestrito',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final PerfilAcessoPageCubit bloc;
  late final PerfilAcessoService service;
  late final DireitoCubit direitoCubit;

  @override
  void initState() {
    service = PerfilAcessoService();
    direitoCubit = DireitoCubit();
    bloc = PerfilAcessoPageCubit(service: service);
    bloc.loadPerfilAcesso();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
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
              PerfilAcessoModel.empty(),
            ),
          },
        ),
        BlocListener<PerfilAcessoPageCubit, PerfilAcessoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<PerfilAcessoPageCubit, PerfilAcessoPageState>(
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
                    onEdit: (PerfilAcessoModel objeto) =>
                        {openModal(context, PerfilAcessoModel.copy(objeto))},
                    onDelete: (PerfilAcessoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.perfisAcessos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadDireitoCubit() {
    if (!direitoCubit.state.loaded) {
      direitoCubit.loadFilter(
        DireitoFilter(
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future<void> openModal(
    BuildContext context,
    PerfilAcessoModel perfilAcesso,
  ) async {
    loadDireitoCubit();

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PerfilAcessoPageFrm(
          direitoCubit: direitoCubit,
          perfilAcesso: perfilAcesso,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadPerfilAcesso();
  }

  void delete(BuildContext context, PerfilAcessoModel perfilAcesso) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Perfil de Acesso\n${perfilAcesso.cod} - ${perfilAcesso.descricao}',
    );
    if (confirmacao) bloc.delete(perfilAcesso);
  }

  void deleted(PerfilAcessoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadPerfilAcesso();
  }

  void onError(PerfilAcessoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
