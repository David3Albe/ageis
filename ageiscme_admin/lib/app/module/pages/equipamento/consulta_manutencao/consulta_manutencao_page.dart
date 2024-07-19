import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/peca/peca_subit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/consulta_manutencao/consulta_manutencao_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_frm/equipamento_manutencao_page_frm.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/equipamento_manutencao/consulta_manutencao_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/equipamento_manutencao/equipamento_manutencao_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/equipamento_manutencao/consulta_manutencao_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConsultaManutencaoPage extends StatefulWidget {
  const ConsultaManutencaoPage({super.key});

  @override
  State<ConsultaManutencaoPage> createState() => _ConsultaManutencaoPageState();
}

class _ConsultaManutencaoPageState extends State<ConsultaManutencaoPage> {
  late Function(bool, bool) setReadonlyDataTermino;
  late Function(bool) setReadonlyHoraTermino;

  static Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    if ((renderContext.row.cells['dataTermino']?.value.toString() ?? '') ==
        '') {
      cor = Cores.corTextoVermelho;
    }

    return Text(
      renderContext.cell.value.toString(),
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
        fontSize: renderContext.stateManager.style.cellTextStyle.fontSize,
      ),
    );
  }

  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Equipamento',
      field: 'equipamento',
      valueConverter: (value) => value == null ? '' : value['nome'],
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Tipo Serviço',
      field: 'servicoTipo',
      customRenderer: getCustomRenderer,
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Peça',
      field: 'peca',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'QTDE',
      field: 'qtde',
      type: CustomDataColumnType.Number,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Valor',
      field: 'valor',
      type: CustomDataColumnType.Number,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Data Início',
      field: 'dataInicio',
      type: CustomDataColumnType.DateTime,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Data Término',
      field: 'dataTermino',
      type: CustomDataColumnType.DateTime,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Data Parada',
      field: 'dataParada',
      type: CustomDataColumnType.DateTime,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Num. NF',
      field: 'numNF',
      type: CustomDataColumnType.Number,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Descricao',
      field: 'descricao',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Problema',
      field: 'problema',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Resultado',
      field: 'resultado',
      valueConverter: (dynamic value) =>
          EquipamentoManutencaoResultOption.getOpcaoFromId(value),
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Data Registro',
      field: 'dataRegistro',
      type: CustomDataColumnType.DateTime,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Garantia',
      field: 'garantia',
      type: CustomDataColumnType.Date,
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Serie',
      field: 'serie',
      customRenderer: getCustomRenderer,
    ),
  ];

  late final ConsultaManutencaoPageCubit bloc;
  late final EquipamentoCubit equipamentoBloc;
  late final ServicoTipoCubit servicoTipoBloc;
  late final PecaCubit pecaBloc;
  late final ConsultaManutencaoFilter filter;
  late final EquipamentoManutencaoService service;

  @override
  void initState() {
    bloc = ConsultaManutencaoPageCubit(
      service: ConsultaManutencaoService(),
    );
    filter = ConsultaManutencaoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    equipamentoBloc = EquipamentoCubit();
    equipamentoBloc.loadAll();
    servicoTipoBloc = ServicoTipoCubit();
    servicoTipoBloc.loadAll();
    pecaBloc = PecaCubit();
    pecaBloc.loadAll();
    service = EquipamentoManutencaoService();

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
              onPressed: () => bloc.loadManutencao(filter),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocConsumer<ConsultaManutencaoPageCubit, ConsultaManutencaoPageState>(
          bloc: bloc,
          listener: (context, state) {
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
                  orderDescendingFieldColumn: 'dataInicio',
                  smallRows: true,
                  columns: colunas,
                  items: state.manutencoes,
                  onDetail: (event, obj) async {
                    var isUserValid =
                        await AccessUserService.validateUserHasRight(
                      DireitoEnum.Manutencao,
                    );

                    if (isUserValid == false) {
                      return ToastUtils.showCustomToastWarning(
                        context,
                        'O Seu usuário não tem permissão para esta tela!',
                      );
                    }

                    await getFilter(obj.cod!).then((doc) {
                      if (doc != null) {
                        openModalRedirect(context, obj.cod!);
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void onError(ConsultaManutencaoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DatePickerWidget(
                      placeholder: 'Data Inicio',
                      onDateSelected: (value) => filter.startDate = value,
                      initialValue: filter.startDate,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  Expanded(
                    child: TimePickerWidget(
                      placeholder: 'Hora Início',
                      initialValue: filter.startTime == null
                          ? null
                          : TimeOfDay(
                              hour: filter.startTime!.hour,
                              minute: filter.startTime!.minute,
                            ),
                      onTimeSelected: (selectedTime) {
                        if (selectedTime == null) {
                          filter.startTime = null;
                          return;
                        }
                        filter.startTime = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              Row(
                children: [
                  Expanded(
                    child: DatePickerWidget(
                      readOnly: filter.apenasSemTermino == true,
                      setReadonlyBuilder: (context, setReadonlyBuilder) =>
                          setReadonlyDataTermino = setReadonlyBuilder,
                      placeholder: 'Data Término',
                      onDateSelected: (value) => filter.finalDate = value,
                      initialValue: filter.finalDate,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  Expanded(
                    child: TimePickerWidget(
                      setReadonlyBuilder: (context, setReadonlyBuilder) =>
                          setReadonlyHoraTermino = setReadonlyBuilder,
                      placeholder: 'Hora Fim',
                      initialValue: filter.finalTime == null
                          ? null
                          : TimeOfDay(
                              hour: filter.finalTime!.hour,
                              minute: filter.finalTime!.minute,
                            ),
                      onTimeSelected: (selectedTime) {
                        if (selectedTime == null) {
                          filter.finalTime = null;
                          return;
                        }
                        filter.finalTime = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 6),
                      child: CustomCheckboxWidget(
                        checked: filter.apenasSemTermino,
                        onClick: (value) {
                          filter.apenasSemTermino = value;
                          setReadonlyDataTermino(
                            filter.apenasSemTermino == true,
                            false,
                          );
                          setReadonlyHoraTermino(
                            filter.apenasSemTermino == true,
                          );
                        },
                        text: 'Apenas sem término',
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<EquipamentoCubit, EquipamentoState>(
                bloc: equipamentoBloc,
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
                  return DropDownSearchWidget(
                    textFunction: (equipamento) =>
                        equipamento.EquipamentoNomeText(),
                    initialValue: equipamento,
                    sourceList: equipamentos
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codEquipamento = value?.cod,
                    placeholder: 'Equipamento',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<ServicoTipoCubit, ServicoTipoState>(
                bloc: servicoTipoBloc,
                builder: (context, state) {
                  List<ServicoTipoModel> servicosTipos = state.tiposServico;

                  servicosTipos.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  ServicoTipoModel? servicoTipo = servicosTipos
                      .where(
                        (element) => element.cod == filter.codServicosTipo,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ServicoTipoModel>(
                    textFunction: (servicoTipo) =>
                        servicoTipo.ServicoTipoNomeText(),
                    initialValue: servicoTipo,
                    sourceList: servicosTipos
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codServicosTipo = value?.cod,
                    placeholder: 'Tipo de Serviço',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<PecaCubit, PecaState>(
                bloc: pecaBloc,
                builder: (context, state) {
                  if (state.loading == true) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  List<PecaModel> pecas = state.pecas;
                  pecas.sort(
                    (a, b) => a.peca!.compareTo(b.peca!),
                  );
                  PecaModel? peca = pecas
                      .where(
                        (element) => element.cod == filter.codPeca,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<PecaModel>(
                    textFunction: (peca) => peca.PecaNomeText(),
                    initialValue: peca,
                    sourceList: pecas,
                    onChanged: (value) => filter.codPeca = value?.cod,
                    placeholder: 'Peça',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder: 'Num. Nf',
                onChanged: (value) => filter.numNF = value,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder: 'Num. Série',
                onChanged: (value) => filter.numSerie = value,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              Builder(
                builder: (context) {
                  return DropDownSearchWidget<RegistroServicoResultOption>(
                    sourceList: RegistroServicoResultOption.resultOptions,
                    initialValue: RegistroServicoResultOption.resultOptions
                        .where(
                          (element) => element.cod == filter.codEquipamento,
                        )
                        .firstOrNull,
                    placeholder: 'Resultado',
                    onChanged: (value) => filter.codResultado = value?.cod,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadManutencao(filter);
  }

  Future<EquipamentoManutencaoModel?> getFilter(int cod) async {
    return service.FilterOne(
      EquipamentoManutencaoFilter(
        cod: cod,
      ),
    );
  }

  Future openModalRedirect(
    BuildContext context,
    int cod,
  ) async {
    LoadingController loading = LoadingController(context: context);

    EquipamentoManutencaoModel? manutencao;
    manutencao = await getFilter(cod);
    if (manutencao == null) {
      loading.close(context, mounted);
      notFoundError();
      return;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Manutenção',
      widget: EquipamentoManutencaoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        equipamentoCubit: equipamentoBloc,
        equipamentoManutencao: manutencao,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Equipamento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
