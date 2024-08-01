import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraRetiradosDivLocalPage extends StatefulWidget {
  const ConsultaProcessosLeituraRetiradosDivLocalPage({super.key});

  @override
  State<ConsultaProcessosLeituraRetiradosDivLocalPage> createState() =>
      _ConsultaProcessosLeituraRetiradosDivLocalPageState();
}

class _ConsultaProcessosLeituraRetiradosDivLocalPageState
    extends State<ConsultaProcessosLeituraRetiradosDivLocalPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Cód. Kit',
      field: 'codKit',
      type: CustomDataColumnType.Text,
    ),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(text: 'ID Item', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Item', field: 'nomeDescritorItem'),
    CustomDataColumn(text: 'Entrda/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
    CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
    CustomDataColumn(text: 'Circulante', field: 'circulante'),
    CustomDataColumn(text: 'Destino', field: 'destino'),
    CustomDataColumn(text: 'Proprietário Item', field: 'proprietarioItem'),
    CustomDataColumn(text: 'Proprietário Kit', field: 'proprietarioKit'),
  ];

  late final ConsultaProcessosLeituraRetiradosDivLocalPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaProcessosLeituraRetiradosDivLocalFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraRetiradosDivLocalPageCubit(
      service: ConsultaProcessosLeituraRetiradosDivLocalService(),
    );
    filter = ConsultaProcessosLeituraRetiradosDivLocalFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();

    bloc.loadMotivoProcessosLeituraRetiradosDivLocal(filter);
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
              onPressed: () =>
                  bloc.loadMotivoProcessosLeituraRetiradosDivLocal(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaProcessosLeituraRetiradosDivLocalPageCubit,
            ConsultaProcessosLeituraRetiradosDivLocalPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraRetiradosDivLocalPageCubit,
              ConsultaProcessosLeituraRetiradosDivLocalPageState>(
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
                    items: state.processosLeiturasRetiradosDivLocais,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraRetiradosDivLocalPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
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
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoBloc,
                builder: (context, locaisState) {
                  if (locaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalInstituicaoModel> locaisInstituicoes =
                      locaisState.locaisInstituicoes;
                  locaisInstituicoes.sort(
                    (a, b) => (a.nome ?? '').compareTo(b.nome ?? ''),
                  );
                  LocalInstituicaoModel? localInstituicao = locaisInstituicoes
                      .where(
                        (element) => element.cod == filter.codLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    textFunction: (localInstituicao) =>
                        localInstituicao.LocalInstituicaoText(),
                    initialValue: localInstituicao,
                    sourceList: locaisInstituicoes
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local Destino',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<ProprietarioCubit, ProprietarioState>(
                bloc: proprietarioBloc,
                builder: (context, proprietarioState) {
                  if (proprietarioState.loading) return const LoadingWidget();
                  List<ProprietarioModel> proprietarios =
                      proprietarioState.proprietarios;
                  proprietarios.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  ProprietarioModel? proprietario = proprietarios
                      .where(
                        (element) => element.cod == filter.codProprietario,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ProprietarioModel>(
                    textFunction: (localInstituicao) =>
                        localInstituicao.ProprietarioText(),
                    initialValue: proprietario,
                    sourceList: proprietarios
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codProprietario = value?.cod,
                    placeholder: 'Proprietário',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadMotivoProcessosLeituraRetiradosDivLocal(filter);
  }
}
