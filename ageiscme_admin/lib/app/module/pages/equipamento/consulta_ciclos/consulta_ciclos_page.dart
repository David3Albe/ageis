import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/consulta_ciclos/consulta_ciclos_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/equipamento_ciclos/consulta_ciclos_equipamento_service.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_impressoes/dto/ciclo_print/ciclo_print_dto.dart';
import 'package:ageiscme_impressoes/dto/ciclo_print/items/ciclo_print_items_dto.dart';
import 'package:ageiscme_impressoes/prints/ciclo_printer/ciclo_printer_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/equipamento_ciclo/consulta_equipamento_ciclo_filter.dart';
import 'package:ageiscme_models/query_models/equipamento_ciclos/consulta_ciclos_equipamento_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_list_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaCiclosPage extends StatefulWidget {
  const ConsultaCiclosPage({super.key});

  @override
  State<ConsultaCiclosPage> createState() => _ConsultaCiclosPageState();
}

class _ConsultaCiclosPageState extends State<ConsultaCiclosPage> {
  late void Function() refreshMethod;
  List<CustomDataColumn> getColunas(ConsultaCiclosPageState state) {
    if (filter.detalhar != true) {
      return [
        CustomDataColumn(
          text: 'Data Hora',
          field: 'dataHora',
          type: CustomDataColumnType.DateTime,
          width: 140,
        ),
        CustomDataColumn(
          text: 'Equipamento',
          field: 'nomeEquipamento',
        ),
        CustomDataColumn(
          text: 'Processo',
          field: 'nomeProcesso',
        ),
        CustomDataColumn(
          text: 'Indicador',
          field: 'indicador',
          width: 160,
        ),
        CustomDataColumn(
          text: 'Lote',
          field: 'lote',
          width: 115,
        ),
        CustomDataColumn(
          text: 'Lote Equipamento',
          field: 'loteEquipamento',
          width: 145,
        ),
      ];
    }
    return [
      CustomDataColumn(
        text: 'S',
        field: 'imprimir',
        readonly: false,
        type: CustomDataColumnType.Checkbox,
        onClick: (value, checked) => setAllSameRegisterAsEqual(value, checked),
      ),
      CustomDataColumn(
        text: 'Data Hora',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
        width: 140,
      ),
      CustomDataColumn(
        text: 'Equipamento',
        field: 'nomeEquipamento',
      ),
      CustomDataColumn(
        text: 'Processo',
        field: 'nomeProcesso',
      ),
      CustomDataColumn(
        text: 'Indicador',
        field: 'indicador',
        width: 160,
      ),
      CustomDataColumn(
        text: 'Etiqueta',
        field: 'idEtiqueta',
        width: 110,
      ),
      CustomDataColumn(
        text: 'Item',
        field: 'nomeItem',
      ),
      CustomDataColumn(
        text: 'Cód. Kit',
        field: 'codBarraKit',
        width: 145,
      ),
      CustomDataColumn(
        text: 'Kit',
        field: 'nomeKit',
      ),
      CustomDataColumn(
        text: 'Proprietário',
        field: 'nomeProprietario',
      ),
      CustomDataColumn(
        text: 'Lote',
        field: 'lote',
        width: 115,
      ),
      CustomDataColumn(
        text: 'Lote Equipamento',
        field: 'loteEquipamento',
        width: 145,
      ),
      CustomDataColumn(
        text: 'Usuário',
        field: 'nomeUsuario',
      ),
    ];
  }

  late final ConsultaCiclosPageCubit bloc;
  late final ConsultaEquipamentoCicloFilter filter;
  late final ProcessoEtapaCubit processoEtapaCubit;

  @override
  void initState() {
    filter = ConsultaEquipamentoCicloFilter();
    filter.codProcessos = [];
    filter.codEquipamentos = [];
    bloc = ConsultaCiclosPageCubit(
      service: ConsultaCiclosEquipamentoService(),
    );
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();

    processoEtapaCubit = ProcessoEtapaCubit();
    processoEtapaCubit.loadAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessoEtapaCubit, ProcessoEtapaState>(
      bloc: processoEtapaCubit,
      builder: (context, state) {
        if (state.loading) {
          if (state.loading) {
            return const Center(
              child: LoadingWidget(),
            );
          }
        }
        return BlocConsumer<ConsultaCiclosPageCubit, ConsultaCiclosPageState>(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: PrintButtonWidget(
                        readonly: filter.detalhar != true,
                        onPressed: printItems,
                      ),
                    ),
                    Visibility(
                      visible: filter.detalhar != true,
                      child: const Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Apenas consulta detalhada',
                          style: TextStyle(fontSize: 13, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                    child: PlutoGridWidget(
                      refreshWidgetBuilder: (context, refreshWidget) =>
                          refreshMethod = refreshWidget,
                      orderDescendingFieldColumn: 'dataHora',
                      smallRows: true,
                      columns: getColunas(state),
                      items: items(state),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<ConsultaCiclosEquipamentoDTO> items(ConsultaCiclosPageState state) {
    if (filter.detalhar == true) return state.ciclos;
    List<ConsultaCiclosEquipamentoDTO> items = [];
    for (ConsultaCiclosEquipamentoDTO item in state.ciclos) {
      if (items
              .where(
                (element) =>
                    element.dataHora == item.dataHora &&
                    element.nomeEquipamento == item.nomeEquipamento &&
                    element.nomeProcesso == item.nomeProcesso &&
                    element.indicador == item.indicador &&
                    element.lote == item.lote &&
                    element.loteEquipamento == item.loteEquipamento,
              )
              .firstOrNull !=
          null) continue;
      items.add(item);
    }
    return items;
  }

  void onError(ConsultaCiclosPageState state) =>
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
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              Row(
                children: [
                  Expanded(
                    child: DatePickerWidget(
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
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 4)),
              Row(
                children: [
                  Expanded(
                    child: CustomCheckboxWidget(
                      text: 'Detalhar Ciclos',
                      onClick: (value) => filter.detalhar = value,
                      align: MainAxisAlignment.start,
                      checked: filter.detalhar,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder: 'Indicador',
                onChanged: (value) =>
                    filter.indicador = value.isEmpty ? null : value,
                initialValue: filter.indicador,
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              const Row(
                children: [
                  Expanded(child: Center(child: Text('Processos'))),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(child: Center(child: Text('Equipamentos'))),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<ProcessoEtapaCubit, ProcessoEtapaState>(
                      bloc: processoEtapaCubit,
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                            child: LoadingWidget(),
                          );
                        }

                        Set<String> etapas = state.processosEtapas
                            .where(
                              (element) => element.exigeTesteIndicador == true,
                            )
                            .map(
                              (e) => (e.nome ?? '')
                                  .substring(
                                    ((e.nome ?? '').contains('(')
                                        ? (e.nome ?? '').indexOf('(')
                                        : 0),
                                    (e.nome ?? '').length,
                                  )
                                  .replaceAll("'", ''),
                            )
                            .toSet();
                        List<String> etapasSort = etapas.toList();
                        etapasSort.sort((a, b) => a.compareTo(b));
                        var checkedList =
                            List<bool>.filled(etapas.length, false);
                        for (var i = 0; i < etapas.length; i++) {
                          checkedList[i] =
                              filter.codProcessos!.contains(etapasSort[i]);
                        }

                        return CheckboxListWidget(
                          items: etapasSort,
                          checkedList: checkedList,
                          onChecked: (values) {
                            filter.codProcessos = [];
                            for (var i = 0; i < etapas.length; i++) {
                              if (values[i]) {
                                filter.codProcessos!.add(etapasSort[i]);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: BlocBuilder<ProcessoEtapaCubit, ProcessoEtapaState>(
                      bloc: processoEtapaCubit,
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                            child: LoadingWidget(),
                          );
                        }

                        Set<String> etapas = state.processosEtapas
                            .where(
                              (element) => element.exigeTesteIndicador == true,
                            )
                            .map(
                              (e) => (e.nome ?? '')
                                  .substring(
                                    0,
                                    ((e.nome ?? '').contains('(')
                                        ? (e.nome ?? '').indexOf('(')
                                        : (e.nome ?? '').length),
                                  )
                                  .replaceAll("'", ''),
                            )
                            .toSet();
                        List<String> etapasSort = etapas.toList();
                        etapasSort.sort((a, b) => a.compareTo(b));
                        var checkedList =
                            List<bool>.filled(etapas.length, false);

                        for (var i = 0; i < etapas.length; i++) {
                          checkedList[i] =
                              filter.codEquipamentos!.contains(etapasSort[i]);
                        }
                        return CheckboxListWidget(
                          items: etapasSort,
                          checkedList: checkedList,
                          onChecked: (values) {
                            filter.codEquipamentos = [];
                            for (var i = 0; i < etapas.length; i++) {
                              if (values[i]) {
                                filter.codEquipamentos!.add(etapasSort[i]);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadManutencao(filter);
  }

  void setAllSameRegisterAsEqual(
    ConsultaCiclosEquipamentoDTO obj,
    bool checked,
  ) {
    for (ConsultaCiclosEquipamentoDTO item in bloc.state.ciclos) {
      if (obj.indicador == item.indicador) {
        item.imprimir = checked;
      }
    }
    refreshMethod.call();
  }

  void printItems() async {
    List<ConsultaCiclosEquipamentoDTO> processosMarcados = bloc.state.ciclos
        .where(
          (entrada) => entrada.imprimir == true,
        )
        .toList();
        processosMarcados.sort((a,b)=>a.dataHora!.compareTo(b.dataHora!));
    InstituicaoModel? instituicao = await InstituicaoService().findFirst();
    if (instituicao == null) {
      ToastUtils.showCustomToastError(
        context,
        'É necessário configurar uma instituição para realizar a impressão',
      );
      return;
    }

    List<CicloPrintItemsDTO> items = processosMarcados
        .map(
          (e) => CicloPrintItemsDTO(
            instituicao: instituicao.nome!,
            dataHora: e.dataHora!,
            equipamento: e.nomeEquipamento!,
            processo: e.nomeProcesso!,
            indicador: e.indicador!,
            lote: e.lote!,
            usuario: e.nomeUsuario!,
            codKit: e.codKit?.toString(),
            idEtiqueta: e.idEtiqueta,
            loteEquipamento: e.loteEquipamento,
            nomeItem: e.nomeItem,
            nomeKit: e.nomeKit,
            proprietario: e.nomeProprietario,
          ),
        )
        .toList();

    CicloPrintDTO dto = CicloPrintDTO(
      instituicao: instituicao.nome!,
      items: items,
    );

    LoadingController loading = LoadingController(context: context);
    await CicloPrinterController(context: context, dto: dto).print();
    loading.closeDefault();
  }
}
