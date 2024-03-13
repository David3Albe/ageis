import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/registro_servico/registro_servico_filter.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class RegistroServicoPage extends StatefulWidget {
  RegistroServicoPage({super.key});

  @override
  State<RegistroServicoPage> createState() => _RegistroServicoPageState();
}

class _RegistroServicoPageState extends State<RegistroServicoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Técnico', field: 'tecnico'),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Data Início',
      field: 'dataInicio',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Data Fim',
      field: 'dataTermino',
      type: CustomDataColumnType.Date,
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
  late final UsuarioCubit usuarioCubit;

  @override
  void initState() {
    filter = RegistroServicoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    equipamentoCubit = EquipamentoCubit();
    usuarioCubit = UsuarioCubit();
    service = RegistroServicoService();
    bloc = RegistroServicoPageCubit(service: service);
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
                    onEdit: (RegistroServicoModel objeto) =>
                        {openModal(context, RegistroServicoModel.copy(objeto))},
                    onDelete: (RegistroServicoModel objeto) =>
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
    );
  }

  void openModalFilter(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
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
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadRegistroServicoFilter(filter);
      }
    });
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

  void loadUserCubit() {
    if (!usuarioCubit.state.loaded) {
      usuarioCubit.loadFilter(
        UsuarioFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
          apenasColaboradores: true,
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
        tStamp: registroServico.tstamp,
        carregarImagens: true,
        carregarUsuario: true,
      ),
    );
  }

  Future<void> openModal(
    BuildContext context,
    RegistroServicoModel registroServico,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadEquipamentoCubit();
    loadUserCubit();

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
    }
    loading.close(context, mounted);

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return RegistroServicoPageFrm(
          equipamentoCubit: equipamentoCubit,
          usuarioCubit: usuarioCubit,
          itemFilter: ItemFilter(
            apenasAtivos: true,
            ordenarPorNomeCrescente: true,
          ),
          registroServico: registroServicoModel!,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadRegistroServicoFilter(filter);
  }

  void delete(
    BuildContext context,
    RegistroServicoModel registroServico,
  ) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Registro do Serviço\n${registroServico.cod}',
    );
    if (confirmacao) bloc.delete(registroServico);
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
