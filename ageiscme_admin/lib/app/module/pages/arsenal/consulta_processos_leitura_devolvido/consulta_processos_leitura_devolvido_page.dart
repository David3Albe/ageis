import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_devolvido/consulta_processos_leitura_devolvido_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_devolvido/consulta_processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_devolvido/consulta_processos_leitura_devolvido_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido/consulta_processos_leitura_devolvido_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_footer_type.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraDevolvidoPage extends StatefulWidget {
  const ConsultaProcessosLeituraDevolvidoPage({super.key});

  @override
  State<ConsultaProcessosLeituraDevolvidoPage> createState() =>
      _ConsultaProcessosLeituraDevolvidoPageState();
}

class _ConsultaProcessosLeituraDevolvidoPageState
    extends State<ConsultaProcessosLeituraDevolvidoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Nome Local', field: 'nomeLocal'),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'qtde',
      footerType: CustomDataColumnFooterType.Number,
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaProcessosLeituraDevolvidoPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ConsultaProcessosLeituraDevolvidoFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraDevolvidoPageCubit(
      service: ConsultaProcessosLeituraDevolvidoService(),
    );
    filter = ConsultaProcessosLeituraDevolvidoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();

    bloc.loadProcessosLeituraDevolvido(filter);
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
              onPressed: () => bloc.loadProcessosLeituraDevolvido(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaProcessosLeituraDevolvidoPageCubit,
            ConsultaProcessosLeituraDevolvidoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraDevolvidoPageCubit,
              ConsultaProcessosLeituraDevolvidoPageState>(
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
                    items: state.processosLeiturasDevolvidos,
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

  Future openModalRedirect(
    BuildContext context,
    int? codLocal,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      title: 'Consulta Processo Leitura - Devolvidos - Sub',
      widget: ConsultaProcessosLeituraDevolvidoSubPage(
        filter: ConsultaProcessosLeituraDevolvidoSubFilter(
          startDate: filter.startDate,
          finalDate: filter.finalDate,
          codLocal: codLocal,
        ),
      ),
    );
  }

  void onError(ConsultaProcessosLeituraDevolvidoPageState state) =>
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
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadProcessosLeituraDevolvido(filter);
  }
}
