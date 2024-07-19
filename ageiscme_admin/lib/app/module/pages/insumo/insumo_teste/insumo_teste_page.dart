import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/insumo/insumo_filter.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:flutter/material.dart';

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/cubit/insumo_movimento_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page_frm/insumo_teste_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_teste/insumo_teste_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_data/services/insumo_teste/insumo_teste_service.dart';
import 'package:ageiscme_models/dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/insumo_teste/insumo_teste_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';
import 'package:ageiscme_models/response_dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoTestePage extends StatefulWidget {
  const InsumoTestePage({super.key});

  @override
  State<InsumoTestePage> createState() => _InsumoTestePageState();
}

class _InsumoTestePageState extends State<InsumoTestePage> {
  late final InsumoTestePageCubit bloc;
  late final InsumoTesteService service;
  late final InsumoTesteFilter filter;
  late final InsumoCubit insumoBloc;
  late final UsuarioDropDownSearchCubit usuarioCubit;
  late final DepositoInsumoCubit depositoInsumoBloc;

  @override
  void initState() {
    depositoInsumoBloc = DepositoInsumoCubit();
    depositoInsumoBloc.loadAll();
    usuarioCubit = UsuarioDropDownSearchCubit();
    usuarioCubit.loadDropDownSearch(
      UsuarioDropDownSearchDTO(
        numeroRegistros: 10000,
      ),
    );
    insumoBloc = InsumoCubit();
    insumoBloc.loadFilter(InsumoFilter());
    filter = InsumoTesteFilter.empty();
    service = InsumoTesteService();
    bloc = InsumoTestePageCubit(service: service);
    bloc.filter(filter);
    super.initState();
  }

  List<CustomDataColumn> getColunas() {
    List<InsumoModel> insumos = insumoBloc.state.objs;
    List<DepositoInsumoModel> depositos = depositoInsumoBloc.state.objs;
    List<UsuarioDropDownSearchResponseDTO> usuarios =
        usuarioCubit.state.usuarios;
    return [
      CustomDataColumn(
        text: 'Cód',
        field: 'cod',
        type: CustomDataColumnType.Number,
        width: 100,
      ),
      CustomDataColumn(
        text: 'Insumo',
        field: 'codInsumo',
        calculatedField: 'nomeInsumo',
        valueConverter: (value) =>
            insumos.where((e) => e.cod == value).firstOrNull?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Depósito',
        field: 'codDeposito',
        calculatedField: 'nomeDeposito',
        valueConverter: (value) =>
            depositos.where((e) => e.cod == value).firstOrNull?.nome ?? '',
      ),
      CustomDataColumn(text: 'Lote', field: 'lote'),
      CustomDataColumn(text: 'Descrição', field: 'indicador'),
      CustomDataColumn(
        text: 'Usuário',
        field: 'codUsuario',
        calculatedField: 'nomeUsuario',
        valueConverter: (value) =>
            usuarios.where((e) => e.cod == value).firstOrNull?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Data',
        field: 'data',
        type: CustomDataColumnType.DateTime,
      ),
    ];
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
              onPressed: () => bloc.filter(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModalFilter(context),
              },
            ),
            const Padding(padding: EdgeInsets.only(right: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  InsumoTesteModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocBuilder<InsumoCubit, InsumoState>(
          bloc: insumoBloc,
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: const LoadingWidget());
            }
            return BlocConsumer<InsumoTestePageCubit, InsumoTestePageState>(
              bloc: bloc,
              listener: (context, state) {
                if (state.deleted) deleted(state);
                if (state.error.isNotEmpty) onError(state);
              },
              builder: (context, state) {
                if (state.loading) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: PlutoGridWidget(
                      orderDescendingFieldColumn: 'data',
                      onEdit: (InsumoTesteModel objeto) =>
                          {openModal(context, InsumoTesteModel.copy(objeto))},
                      onDelete: (InsumoTesteModel objeto) =>
                          {delete(context, objeto)},
                      columns: getColunas(),
                      items: state.insumosTestes,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Future openModalFilter(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 2)),
            BlocBuilder<InsumoCubit, InsumoState>(
              bloc: insumoBloc,
              builder: (context, insumoState) {
                if (insumoState.loading) {
                  return const LoadingWidget();
                }
                List<InsumoModel> insumos = insumoState.objs;

                insumos.sort(
                  (a, b) => a.nome!.compareTo(b.nome!),
                );

                InsumoModel? insumo = insumos
                    .where(
                      (element) => element.cod == filter.codInsumo,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<InsumoModel>(
                  textFunction: (insumo) => insumo.GetNomeInsumoText(),
                  initialValue: insumo,
                  sourceList: insumos,
                  onChanged: (value) => filter.codInsumo = value?.cod,
                  placeholder: 'Insumo',
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            DropDownSearchApiWidget<InsumoMovimentoDropDownSearchResponseDTO>(
              textFunction: (insumoMovimento) =>
                  insumoMovimento.InsumoMovimentoText(),
              initialValue: filter.codMovimentoInsumo == null
                  ? null
                  : InsumoMovimentoDropDownSearchResponseDTO(
                      cod: filter.codMovimentoInsumo!,
                      data: DateTime.now(),
                      flagEntradaSaida: '1',
                      lote: '',
                      nomeInsumo: '',
                    ),
              search: (str) async =>
                  (await InsumoMovimentoService()
                          .getDropDownSearchInsumoMovimento(
                    InsumoMovimentoDropDownSearchDTO(
                      numeroRegistros: 30,
                      search: str,
                    ),
                  ))
                      ?.$2 ??
                  [],
              onChanged: (value) {
                InsumoMovimentoFilterCubit().setInsumoMovimento(value);
                filter.codMovimentoInsumo = value!.cod;
              },
              placeholder: 'Movimento',
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    await bloc.filter(filter);
  }

  Future openModal(
    BuildContext context,
    InsumoTesteModel insumoTeste,
  ) async {
    InsumoTesteModel? insumoTesteForm = insumoTeste;
    if (insumoTeste.cod != null && insumoTeste.cod! > 0) {
      LoadingController loading = LoadingController(context: context);
      insumoTesteForm = await InsumoTesteService().FilterOne(
        InsumoTesteFilter(
          cod: insumoTesteForm.cod,
          carregarMovimentacao: true,
        ),
      );
      if (insumoTesteForm == null) {
        ToastUtils.showCustomToastWarning(
          context,
          'Não foi possível encontrar a movimentação selecionada, tente novamente ou entre em contato com o suporte',
        );
        return;
      }
      print(insumoTesteForm.insumoMovimento);
      loading.closeDefault();
    }
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Teste de Insumo',
      widget: InsumoTestePageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        insumoReadOnly: false,
        depositoInsumoCubit: depositoInsumoBloc,
        insumoTeste: insumoTesteForm,
        usuarioCubit: usuarioCubit,
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    await bloc.filter(filter);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    InsumoTesteModel insumoTeste,
  ) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Confirma a remoção da teste de insumo\n${insumoTeste.cod}',
      onConfirm: () => confirmDelete(insumoTeste),
    );
  }

  void confirmDelete(
    InsumoTesteModel insumoTeste,
  ) {
    bloc.delete(insumoTeste);
  }

  void deleted(InsumoTestePageState state) {
    print(1);
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.filter(filter);
  }

  void onError(InsumoTestePageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
