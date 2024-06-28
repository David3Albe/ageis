import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_devolvido/consulta_processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraDevolvidoSubPage extends StatefulWidget {
  const ConsultaProcessosLeituraDevolvidoSubPage({
    super.key,
    this.filter,
  });

  final ConsultaProcessosLeituraDevolvidoSubFilter? filter;

  @override
  State<ConsultaProcessosLeituraDevolvidoSubPage> createState() =>
      _ConsultaProcessosLeituraDevolvidoSubPageState();
}

class _ConsultaProcessosLeituraDevolvidoSubPageState
    extends State<ConsultaProcessosLeituraDevolvidoSubPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Nome Local', field: 'nomeLocal'),
    CustomDataColumn(
      text: 'Data Hora',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(text: 'Entrada / Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Etapa', field: 'nomeEtapa'),
    CustomDataColumn(
      text: 'Cód. Descritor Kit',
      field: 'codDescritorKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(
      text: 'Cód. Descritor Item',
      field: 'codDescritorItem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Item', field: 'descricaoCurtaItem'),
    CustomDataColumn(
      text: 'Saída',
      field: 'saida',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Devolucao',
      field: 'devolucao',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Motivo', field: 'motivo'),
    CustomDataColumn(text: 'Motivo Quebra Fluxo', field: 'motivoQuebraFluxo'),
    CustomDataColumn(text: 'Ação Ocorrência', field: 'acaoOcorrencia'),
    CustomDataColumn(
      text: 'Motivo Remover / Repor Item',
      field: 'motivoReporRemoverItem',
    ),
  ];

  late final ConsultaProcessosLeituraDevolvidoSubPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ConsultaProcessosLeituraDevolvidoSubFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraDevolvidoSubPageCubit(
      service: ConsultaProcessosLeituraDevolvidoSubService(),
    );
    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadProcessosLeituraDevolvidoSub(filter);
    } else {
      filter = ConsultaProcessosLeituraDevolvidoSubFilter.empty();
    }
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();

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
        BlocListener<ConsultaProcessosLeituraDevolvidoSubPageCubit,
            ConsultaProcessosLeituraDevolvidoSubPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraDevolvidoSubPageCubit,
              ConsultaProcessosLeituraDevolvidoSubPageState>(
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
                    items: state.processosLeiturasDevolvidos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraDevolvidoSubPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
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
                readOnly: true,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                placeholder: 'Data Término',
                onDateSelected: (value) => filter.finalDate = value,
                initialValue: filter.finalDate,
                readOnly: true,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoBloc,
                builder: (context, locaisState) {
                  if (locaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalInstituicaoModel> locais =
                      locaisState.locaisInstituicoes;

                  locais.sort(
                    (a, b) => (a.nome ?? '').compareTo(b.nome ?? ''),
                  );
                  LocalInstituicaoModel? local = locais
                      .where(
                        (element) => element.cod == filter.codLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    textFunction: (local) => local.LocalInstituicaoText(),
                    initialValue: local,
                    sourceList: locais
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local',
                    readOnly: true,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadProcessosLeituraDevolvidoSub(filter);
  }
}
