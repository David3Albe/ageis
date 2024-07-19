import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/cubits/treinamento_registro_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/filter/treinamento_registro_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page_frm/treinamento_registro_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page_state.dart';
import 'package:ageiscme_data/services/treinamento_registro/treinamento_registro_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class TreinamentoRegistroPage extends StatefulWidget {
  const TreinamentoRegistroPage({super.key});

  @override
  State<TreinamentoRegistroPage> createState() =>
      _TreinamentoRegistroPageState();
}

class _TreinamentoRegistroPageState extends State<TreinamentoRegistroPage> {
  Widget getCustomRendererCargaHoraria(
    PlutoColumnRendererContext renderContext,
  ) {
    double? cargaHoraria = renderContext.cell.value;
    String value = '';
    if (cargaHoraria != null) {
      value = decimalToString(cargaHoraria);
    }

    return Text(
      value,
      textAlign: TextAlign.start,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: renderContext.stateManager.style.cellTextStyle.fontSize,
      ),
    );
  }

  static String decimalToString(double decimal) {
    int hours = decimal.truncate();
    int minutes = ((decimal - hours) * 60).round();
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr';
  }

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Entidade', field: 'entidade'),
    CustomDataColumn(
      text: 'Data',
      field: 'data',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Carga Horária',
      field: 'cargaHoraria',
      type: CustomDataColumnType.Text,
      customRenderer: getCustomRendererCargaHoraria,
    ),
  ];

  late final TreinamentoRegistroPageCubit bloc;
  late final TreinamentoRegistroService service;
  late final UsuarioCubit usuarioCubit;

  @override
  void initState() {
    service = TreinamentoRegistroService();
    usuarioCubit = UsuarioCubit();
    bloc = TreinamentoRegistroPageCubit(service: service);
    carregar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TreinamentoRegistroCubitFilter(),
        ),
        BlocProvider.value(value: bloc),
      ],
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RefreshButtonWidget(
                    onPressed: () => refresh(context),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 4)),
                  const TreinamentoRegistroFilterButtonWidget(),
                  const Padding(padding: EdgeInsets.only(left: 4)),
                  AddButtonWidget(
                    onPressed: () => {
                      openModal(
                        context,
                        TreinamentoRegistroModel.empty(),
                      ),
                    },
                  ),
                ],
              ),
              BlocConsumer<TreinamentoRegistroPageCubit,
                  TreinamentoRegistroPageState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state.deleted) deleted(state);
                },
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
                        orderDescendingFieldColumn: 'data',
                        onEdit: (TreinamentoRegistroModel objeto) => {
                          openModal(
                            context,
                            TreinamentoRegistroModel.copy(
                              objeto,
                            ),
                          ),
                        },
                        onDelete: (TreinamentoRegistroModel objeto) =>
                            {delete(context, objeto)},
                        columns: colunas,
                        items: state.treinamentosRegistros,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future refresh(BuildContext context) async{
      TreinamentoRegistroPageCubit treinamentoCubit =
        context.read<TreinamentoRegistroPageCubit>();
    TreinamentoRegistroCubitFilter filterCubit = context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroFilter dto = filterCubit.state;
    await treinamentoCubit.filterScreen(dto);
  }

  void loadUserCubit() {
    if (!usuarioCubit.state.loaded) {
      usuarioCubit.loadFilter(
        UsuarioFilter(
          ordenarPorNomeCrescente: true,
          apenasColaboradores: true,
          carregarFoto: false,
          tipoQuery: UsuarioFilterTipoQuery.SemFoto,
        ),
      );
    }
  }

  Future<TreinamentoRegistroModel?> getFilter(
    TreinamentoRegistroModel treinamentoRegistro,
  ) async {
    return service.FilterOne(
      TreinamentoRegistroFilter(
        cod: treinamentoRegistro.cod,
        carregarUsuario: true,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    TreinamentoRegistroModel treinamentoRegistro,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadUserCubit();

    TreinamentoRegistroModel? treinamento = treinamentoRegistro;
    if (treinamentoRegistro.cod != 0) {
      treinamento = await getFilter(
        treinamentoRegistro,
      );
      if (treinamento == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Registro de Treinamento',
      widget: TreinamentoRegistroPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave, context),
        usuarioCubit: usuarioCubit,
        treinamentoRegistro: treinamento,
      ),
    );
  }

  Future onSaved(String message, int chave, BuildContext context) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    TreinamentoRegistroCubitFilter filterCubit =
        context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroPageCubit treinamentoCubit =
        context.read<TreinamentoRegistroPageCubit>();
    filterCubit = context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroFilter dto = filterCubit.state;
    await treinamentoCubit.filterScreen(dto);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  Future carregar() async {
    TreinamentoRegistroFilter filter = TreinamentoRegistroFilter(
      numeroRegistros: 500,
      carregarUsuario: true,
      ordenarPorDataDecrescente: true,
    );
    await bloc.filterScreen(filter);
  }

  void delete(
    BuildContext context,
    TreinamentoRegistroModel treinamentoRegistro,
  ) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Treinamento\n${treinamentoRegistro.cod} - ${treinamentoRegistro.nome}',
      onConfirm: () => onConfirmDelete(treinamentoRegistro),
    );
  }

  void onConfirmDelete(
    TreinamentoRegistroModel treinamentoRegistro,
  ) async {
    bloc.delete(treinamentoRegistro);
  }

  Future deleted(TreinamentoRegistroPageState state) async {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    TreinamentoRegistroCubitFilter filterCubit =
        context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroPageCubit treinamentoCubit =
        context.read<TreinamentoRegistroPageCubit>();
    filterCubit = context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroFilter dto = filterCubit.state;
    await treinamentoCubit.filterScreen(dto);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Treinamento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
