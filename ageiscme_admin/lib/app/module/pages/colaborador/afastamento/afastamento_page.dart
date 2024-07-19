import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/afastamento_page_frm/afastamento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/afastamento_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/filter/afastamento_filter_button_widget.dart';
import 'package:ageiscme_data/services/afastamento/afastamento_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/filters/afastamento/afastamento_filter.dart';
import 'package:ageiscme_models/models/afastamento/afastamento_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
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
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AfastamentoPage extends StatefulWidget {
  const AfastamentoPage({
    this.cod,
    super.key,
  });
  final int? cod;

  @override
  State<AfastamentoPage> createState() => _AfastamentoPageState();
}

class _AfastamentoPageState extends State<AfastamentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 105,
    ),
    CustomDataColumn(
      text: 'Colaborador',
      field: 'usuario',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Tipo Afastamento',
      field: 'tipoAfastamento',
      valueConverter: (dynamic value) => value['motivo'] ?? '',
    ),
    CustomDataColumn(
      text: 'Registrado por',
      field: 'usuarioRegistro',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Data Registro',
      field: 'dataRegistro',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Data Ínicio',
      field: 'dataInicio',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Dias Afastamento',
      field: 'diasAfastamento',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Tipo Cat',
      field: 'tipoCat',
      valueConverter: (dynamic value) {
        return value == null
            ? ''
            : TipoCatOption.getTipoCatFromOpcao(
                value,
              );
      },
    ),
  ];

  late final AfastamentoPageCubit bloc;
  late final AfastamentoService service;
  late final UsuarioDropDownSearchCubit usuarioCubit;
  late final AfastamentoFilter filter;

  @override
  void initState() {
    filter = AfastamentoFilter(numeroRegistros: 500);
    service = AfastamentoService();
    usuarioCubit = UsuarioDropDownSearchCubit();
    bloc = AfastamentoPageCubit(
      service: service,
    );
    bloc.getScreenData(filter).then((value) {
      if (widget.cod == null) return;
      AfastamentoModel? obj = bloc.state.afastamentos
          .where((element) => element.cod == widget.cod)
          .firstOrNull;
      if (obj == null) return;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => openModal(
          context,
          obj,
        ),
      );
    });
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
              onPressed: () => bloc.getScreenData(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            AfastamentoFilterButtonWidget(
              cubit: bloc,
              filter: filter,
            ),
            const Padding(padding: EdgeInsets.only(left: 8)),
            AddButtonWidget(
              onPressed: () async => {
                await openModal(
                  context,
                  AfastamentoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocConsumer<AfastamentoPageCubit, AfastamentoPageState>(
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
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: PlutoGridWidget(
                  orderDescendingFieldColumn: 'cod',
                  onEdit: (AfastamentoModel objeto) => {
                    openModal(
                      context,
                      AfastamentoModel.copy(objeto),
                    ),
                  },
                  onDelete: (AfastamentoModel objeto) =>
                      {delete(context, objeto)},
                  columns: colunas,
                  items: state.afastamentos,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void loadData() {}

  Future<AfastamentoModel?> getFilter(
    AfastamentoModel atestado,
  ) async {
    return service.FilterOne(
      AfastamentoFilter(
        cod: atestado.cod,
        carregarUsuario: true,
        carregarUsuarioRegistro: true,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    AfastamentoModel afastamentoBase,
  ) async {
    LoadingController loading = LoadingController(context: context);

    AfastamentoModel? afastamento = afastamentoBase;
    if (afastamento.cod != 0) {
      afastamento = await getFilter(
        afastamento,
      );
      if (afastamento == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    } else {
      final AuthenticationResultDTO? authentication =
          await Modular.get<AuthenticationStore>().GetAuthenticated();
      afastamento.usuarioRegistro = UsuarioDropDownSearchResponseDTO(
        ativo: authentication?.usuario?.ativo ?? false,
        cod: authentication?.usuario?.cod ?? 0,
        codBarra: authentication?.usuario?.codBarra ?? 0,
        nome: authentication?.usuario?.nome ?? '',
      );
      afastamento.codUsuarioRegistro = authentication?.usuario?.cod ?? 0;
      afastamento.dataRegistro = DateTime.now();
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Afastamento',
      widget: AfastamentoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        afastamento: afastamento,
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    await bloc.getScreenData(filter);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    AfastamentoModel afastamento,
  ) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Afastamento\n${afastamento.cod} - Do Usuário: ${afastamento.usuario?.nome ?? ''} Registrado por: ${afastamento.usuarioRegistro?.nome ?? ''}',
      onConfirm: () => onConfirmDelete(afastamento),
    );
  }

  void onConfirmDelete(
    AfastamentoModel afastamento,
  ) {
    bloc.delete(afastamento);
  }

  void deleted(AfastamentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.getScreenData(filter);
  }

  void onError(AfastamentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Afastamento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
