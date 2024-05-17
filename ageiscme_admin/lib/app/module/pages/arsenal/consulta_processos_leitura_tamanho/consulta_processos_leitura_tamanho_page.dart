import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_tamanho/consulta_processos_leitura_tamanho_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_tamanho/processos_leitura_tamanho_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho/consulta_processos_leitura_tamanho_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_footer_type.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/query_dialog/query_dialog_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraTamanhoPage extends StatefulWidget {
  ConsultaProcessosLeituraTamanhoPage({
    super.key,
    this.filter,
  });

  final ConsultaProcessosLeituraTamanhoFilter? filter;

  @override
  State<ConsultaProcessosLeituraTamanhoPage> createState() =>
      _ConsultaProcessosLeituraTamanhoPageState();
}

class _ConsultaProcessosLeituraTamanhoPageState
    extends State<ConsultaProcessosLeituraTamanhoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Centro de Custo', field: 'nomeCentroCusto'),
    CustomDataColumn(text: 'Nome Local', field: 'nomeLocal'),
    CustomDataColumn(text: 'Tamanho', field: 'tamanho'),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'qtde',
      type: CustomDataColumnType.Number,
      footerType: CustomDataColumnFooterType.Number,
    ),
  ];

  late final ConsultaProcessosLeituraTamanhoPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final CentroCustoCubit centroCustoBloc;
  late final ConsultaProcessosLeituraTamanhoFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraTamanhoPageCubit(
      service: ConsultaProcessosLeituraTamanhoService(),
    );
    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadProcessosLeituraTamanho(filter);
    } else {
      filter = ConsultaProcessosLeituraTamanhoFilter.empty();
      filter.startDate = DateTime.now().add(const Duration(days: -1));
      filter.finalDate = DateTime.now();
    }
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();
    centroCustoBloc = CentroCustoCubit();
    centroCustoBloc.loadAll();

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
        BlocListener<ConsultaProcessosLeituraTamanhoPageCubit,
            ConsultaProcessosLeituraTamanhoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraTamanhoPageCubit,
              ConsultaProcessosLeituraTamanhoPageState>(
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
                    smallRows: true,
                    columns: colunas,
                    items: state.processosLeiturasTamanhos,
                    onDetail: (event, obj) async {
                      var isUserValid =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.EstoquesConsulta,
                      );

                      if (isUserValid == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await openModalRedirect(
                        context,
                        obj.codLocal,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraTamanhoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
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
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoBloc,
                builder: (context, locaisState) {
                  if (locaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalInstituicaoModel> locais =
                      locaisState.locaisInstituicoes;

                  locais.sort(
                    (a, b) => a.nome.compareTo(b.nome),
                  );
                  LocalInstituicaoModel? local = locais
                      .where(
                        (element) => element.cod == filter.codLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    textFunction: (local) => local.LocalInstituicaoText(),
                    initialValue: local,
                    sourceList: locais,
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<CentroCustoCubit, List<CentroCustoModel>>(
                bloc: centroCustoBloc,
                builder: (context, centrosCustos) {
                  CentroCustoModel? centroCusto = centrosCustos
                      .where(
                        (element) => element.cod == filter.codCentroCusto,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<CentroCustoModel>(
                    textFunction: (centroCusto) =>
                        centroCusto.CentroCustoText(),
                    initialValue: centroCusto,
                    sourceList: centrosCustos,
                    onChanged: (value) => filter.codCentroCusto = value?.cod,
                    placeholder: 'Centro Custo',
                  );
                },
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadProcessosLeituraTamanho(filter);
      }
    });
  }

  Future<void> openModalRedirect(
    BuildContext context,
    int? codLocal,
  ) async {
    await showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaProcessosLeituraTamanhoPage(
            filter: ConsultaProcessosLeituraTamanhoFilter(
              startDate: filter.startDate,
              finalDate: filter.finalDate,
              codLocal: codLocal,
              codCentroCusto: null,
            ),
          ),
        );
      },
    );
  }
}
