import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_processo_resposta_epcepi/consulta_processo_resposta_epcepi_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processo_resposta_epcepi/consulta_processo_resposta_epcepi_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processo_resposta_epcepi/consulta_processo_resposta_epcepi_filter.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessoRespostaEPCEPIPage extends StatefulWidget {
  ConsultaProcessoRespostaEPCEPIPage({super.key});

  @override
  State<ConsultaProcessoRespostaEPCEPIPage> createState() =>
      _ConsultaProcessoRespostaEPCEPIPageState();
}

class _ConsultaProcessoRespostaEPCEPIPageState
    extends State<ConsultaProcessoRespostaEPCEPIPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Cod. Equipamento',
      field: 'codEquipamento',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Equipamento', field: 'nomeEquipamento'),
    CustomDataColumn(text: 'Usuario', field: 'nomeUsuario'),
    CustomDataColumn(text: 'Resposta', field: 'resposta'),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
  ];

  late final ConsultaProcessoRespostaEPCEPIPageCubit bloc;
  late final EquipamentoCubit equipamentoBloc;
  late final ConsultaProcessoRespostaEPCEPIFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessoRespostaEPCEPIPageCubit(
      service: ConsultaProcessoRespostaEPCEPIService(),
    );
    filter = ConsultaProcessoRespostaEPCEPIFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    equipamentoBloc = EquipamentoCubit();
    equipamentoBloc.loadAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButtonWidget(
          onPressed: () => {
            openModal(context),
          },
        ),
        BlocListener<ConsultaProcessoRespostaEPCEPIPageCubit,
            ConsultaProcessoRespostaEPCEPIPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessoRespostaEPCEPIPageCubit,
              ConsultaProcessoRespostaEPCEPIPageState>(
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
                    orderDescendingFieldColumn: 'dataHora',
                    smallRows: true,
                    columns: colunas,
                    items: state.processosRespostas,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessoRespostaEPCEPIPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
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
                        print(selectedTime);
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
              const Padding(padding: EdgeInsets.only(top: 2)),
              DropDownSearchApiWidget<UsuarioDropDownSearchResponseDTO>(
                search: (str) async =>
                    (await UsuarioService().getDropDownSearch(
                      UsuarioDropDownSearchDTO(
                        numeroRegistros: 30,
                        search: str,
                      ),
                    ))
                        ?.$2 ??
                    [],
                textFunction: (usuario) => usuario.NomeText(),
                initialValue: filter.usuario,
                onChanged: (value) {
                  filter.codUsuario = value?.cod;
                  filter.usuario = value;
                },
                placeholder: 'Usuário Ação',
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<EquipamentoCubit, EquipamentoState>(
                bloc: equipamentoBloc,
                builder: (context, equipamentoState) {
                  if (equipamentoState.loading) {
                    return const LoadingWidget();
                  }
                  List<EquipamentoModel> equipamentos = equipamentoState.objs;
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 5.0)),
                        Text(
                          'Resposta',
                          style: Fontes.getRoboto(),
                        ),
                        CustomCheckboxWidget(
                          checked: filter.respostaNao,
                          onClick: (value) => filter.respostaNao = value,
                          text: 'Não',
                          align: MainAxisAlignment.start,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5.0)),
                        CustomCheckboxWidget(
                          checked: filter.respostaSim,
                          onClick: (value) => filter.respostaSim = value,
                          text: 'Sim',
                          align: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 5.0)),
                        Text(
                          'Tipo',
                          style: Fontes.getRoboto(),
                        ),
                        CustomCheckboxWidget(
                          checked: filter.entrada,
                          onClick: (value) => filter.entrada = value,
                          text: 'Entrada',
                          align: MainAxisAlignment.start,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5.0)),
                        CustomCheckboxWidget(
                          checked: filter.saida,
                          onClick: (value) => filter.saida = value,
                          text: 'Saída',
                          align: MainAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadMotivoRemoverReporItem(filter);
      }
    });
  }
}
