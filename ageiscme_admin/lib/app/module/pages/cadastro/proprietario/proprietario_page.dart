import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/proprietario/proprietario_page_frm/proprietario_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/proprietario/proprietario_page_state.dart';
import 'package:ageiscme_data/services/proprietario/proprietario_service.dart';
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

class ProprietarioPage extends StatefulWidget {
  const ProprietarioPage({super.key});

  @override
  State<ProprietarioPage> createState() => _ProprietarioPageState();
}

class _ProprietarioPageState extends State<ProprietarioPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 90,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Cod. Barra', field: 'codBarra'),
    CustomDataColumn(text: 'Contato', field: 'contato'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Manutenção Liberada',
      field: 'manutencaoLiberada',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final ProprietarioPageCubit bloc;
  late final ProprietarioService service;
  late final LocalInstituicaoCubit localInstituicaoCubit;
  late final ArsenalEstoqueCubit arsenalEstoqueCubit;

  @override
  void initState() {
    service = ProprietarioService();
    localInstituicaoCubit = LocalInstituicaoCubit();
    arsenalEstoqueCubit = ArsenalEstoqueCubit();
    bloc = ProprietarioPageCubit(service: service);
    bloc.loadProprietario();
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
              onPressed: bloc.loadProprietario,
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  ProprietarioModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<ProprietarioPageCubit, ProprietarioPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ProprietarioPageCubit, ProprietarioPageState>(
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
                    onEdit: (ProprietarioModel objeto) =>
                        {openModal(context, ProprietarioModel.copy(objeto))},
                    onDelete: (ProprietarioModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.proprietarios,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadLocaisInstituicoesCubit() {
    if (!localInstituicaoCubit.state.loaded) {
      localInstituicaoCubit.loadFilter(
        LocalInstituicaoFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  void loadArsenalEstoqueCubit() {
    if (!arsenalEstoqueCubit.state.loaded) {
      arsenalEstoqueCubit.loadFilter(
        ArsenalEstoqueFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future openModal(BuildContext context, ProprietarioModel proprietario) async {
    loadLocaisInstituicoesCubit();
    loadArsenalEstoqueCubit();
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      theme: Theme.of(context),
      title: 'Cadastro/Edição Proprietário',
      widget: ProprietarioPageFrm(
        localInstituicaoCubit: localInstituicaoCubit,
        arsenalEstoqueCubit: arsenalEstoqueCubit,
        proprietario: proprietario,
        onSaved: (str) => onSaved(str, chave),
        onCancel: () => onCancel(chave),
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadProprietario();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ProprietarioModel proprietario) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do  Proprietário\n${proprietario.cod} - ${proprietario.nome}',
      onConfirm: () => onConfirmDelete(proprietario),
    );
  }

  void onConfirmDelete(ProprietarioModel proprietario) {
    bloc.delete(proprietario);
  }

  void deleted(ProprietarioPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadProprietario();
  }

  void onError(ProprietarioPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
