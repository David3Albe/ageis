import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/cubits/readonly_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/registro_servico/registro_servico_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
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
import 'package:flutter/material.dart';

class RegistroServicoPage extends StatefulWidget {
  const RegistroServicoPage({this.cod, super.key});
  final int? cod;

  @override
  State<RegistroServicoPage> createState() => _RegistroServicoPageState();
}

class _RegistroServicoPageState extends State<RegistroServicoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Técnico', field: 'tecnico'),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Data Início',
      field: 'dataInicio',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Data Fim',
      field: 'dataTermino',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Temperatura',
      field: 'temperatura',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Umidade',
      field: 'umidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Data Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Resultado',
      field: 'resultado',
      valueConverter: (dynamic value) =>
          RegistroServicoResultOption.getOpcaoFromId(value),
    ),
  ];

  late final RegistroServicoPageCubit bloc;
  late final RegistroServicoService service;
  late final RegistroServicoFilter filter;
  late final EquipamentoCubit equipamentoCubit;
  late final ReadonlyCubit readonlyCubit;

  @override
  void initState() {
    readonlyCubit = ReadonlyCubit();
    readonlyCubit.setarReadonly();
    filter = RegistroServicoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    filter.numeroRegistros = 500;
    equipamentoCubit = EquipamentoCubit();
    equipamentoCubit.loadAll();
    service = RegistroServicoService();
    bloc = RegistroServicoPageCubit(service: service);
    bloc.loadRegistroServicoFilter(filter);
    super.initState();
    if (widget.cod == null) return;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => openModal(
        context,
        RegistroServicoModel(cod: widget.cod!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: readonlyCubit)],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RefreshButtonWidget(
                onPressed: () => bloc.loadRegistroServicoFilter(filter),
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
                    RegistroServicoModel.empty(),
                  ),
                },
              ),
            ],
          ),
          BlocListener<RegistroServicoPageCubit, RegistroServicoPageState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.deleted) deleted(state);
              if (state.error.isNotEmpty) onError(state);
            },
            child:
                BlocBuilder<RegistroServicoPageCubit, RegistroServicoPageState>(
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
                      orderDescendingFieldColumn: 'dataInicio',
                      onEdit: (RegistroServicoModel objeto) => {
                        openModal(context, RegistroServicoModel.copy(objeto)),
                      },
                      onDelete: context.select(
                                (ReadonlyCubit readonlyCubit) =>
                                    readonlyCubit.state.botaoSalvarReadonly,
                              ) ==
                              true
                          ? null
                          : (RegistroServicoModel objeto) =>
                              {delete(context, objeto)},
                      columns: colunas,
                      items: state.registrosServicos,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future openModalFilter(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            DatePickerWidget(
              placeholder: 'Data Inicio',
              onDateSelected: (value) => filter.startDate = value,
              initialValue: filter.startDate,
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            DatePickerWidget(
              placeholder: 'Data Término',
              onDateSelected: (value) => filter.finalDate = value,
              initialValue: filter.finalDate,
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            BlocBuilder<EquipamentoCubit, EquipamentoState>(
              bloc: equipamentoCubit,
              builder: (context, equipamentoState) {
                if (equipamentoState.loading) {
                  return const LoadingWidget();
                }
                List<EquipamentoModel> equipamentos = equipamentoState.objs;
                equipamentos.sort(
                  (a, b) => a.nome!.compareTo(b.nome!),
                );
                EquipamentoModel? equipamento = equipamentos
                    .where(
                      (element) => element.cod == filter.codEquipamento,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<EquipamentoModel>(
                  textFunction: (equipamento) =>
                      equipamento.EquipamentoNomeText(),
                  initialValue: equipamento,
                  sourceList: equipamentos,
                  onChanged: (value) => filter.codEquipamento = value?.cod,
                  placeholder: 'Equipamento',
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 4)),
            TextFieldNumberWidget(
              startValue: filter.numeroRegistros,
              placeholder: 'Número Registros',
              onChanged: (str) => {
                filter.numeroRegistros = str.isEmpty ? null : int.parse(str),
              },
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadRegistroServicoFilter(filter);
  }

  void loadEquipamentoCubit() {
    if (!equipamentoCubit.state.loaded) {
      equipamentoCubit.loadFilter(
        EquipamentoFilter(
          incluirTipoServicos: true,
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future<RegistroServicoModel?> getFilter(
    RegistroServicoModel registroServico,
  ) async {
    return service.FilterOne(
      RegistroServicoFilter(
        cod: registroServico.cod,
        carregarImagens: true,
        carregarUsuario: true,
        carregarItem: true,
      ),
    );
  }

  Future setTecnico(RegistroServicoModel registroServico) async {
    if (registroServico.tecnico == null) return;
    registroServico.usuarioDropDown = (await UsuarioService().getDropDownSearch(
      UsuarioDropDownSearchDTO(
        numeroRegistros: 1,
        codigos: [
          int.parse(registroServico.tecnico!),
        ],
      ),
    ))
        ?.$2
        .firstOrNull;
  }

  Future openModal(
    BuildContext context,
    RegistroServicoModel registroServico,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadEquipamentoCubit();

    RegistroServicoModel? registroServicoModel = registroServico;
    if (registroServico.cod != 0) {
      registroServicoModel = await getFilter(
        registroServico,
      );
      if (registroServicoModel == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
      await setTecnico(registroServicoModel);
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Monitoramento',
      widget: RegistroServicoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        equipamentoCubit: equipamentoCubit,
        itemFilter: ItemFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
        registroServico: registroServicoModel,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadRegistroServicoFilter(filter);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    RegistroServicoModel registroServico,
  ) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Registro do Serviço\n${registroServico.cod}',
      onConfirm: () => confirmDelete(registroServico),
    );
  }

  void confirmDelete(
    RegistroServicoModel registroServico,
  ) async {
    bloc.delete(registroServico);
  }

  void deleted(RegistroServicoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadRegistroServicoFilter(filter);
  }

  void onError(RegistroServicoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Serviço que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
