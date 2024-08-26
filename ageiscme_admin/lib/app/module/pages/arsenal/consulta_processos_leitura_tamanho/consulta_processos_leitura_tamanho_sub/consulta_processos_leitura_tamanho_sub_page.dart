import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tamanho/tamanho_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_tamanho/consulta_processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_tamanho_sub/processos_leitura_tamanho_sub_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_filter.dart';
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
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraTamanhoSubPage extends StatefulWidget {
  const ConsultaProcessosLeituraTamanhoSubPage({
    super.key,
    this.filter,
  });

  final ConsultaProcessosLeituraTamanhoSubFilter? filter;
  @override
  State<ConsultaProcessosLeituraTamanhoSubPage> createState() =>
      _ConsultaProcessosLeituraTamanhoSubPageState();
}

class _ConsultaProcessosLeituraTamanhoSubPageState
    extends State<ConsultaProcessosLeituraTamanhoSubPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data Hora',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
      width: 130,
    ),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(text: 'Item', field: 'nomeItem'),
    CustomDataColumn(
      text: 'Qtde',
      field: 'qtde',
      type: CustomDataColumnType.Integer,
      footerType: CustomDataColumnFooterType.Number,
      width: 95,
    ),
  ];

  late final ConsultaProcessosLeituraTamanhoSubPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ConsultaProcessosLeituraTamanhoSubFilter filter;
  late final TamanhoCubit tamanhoCubit;

  @override
  void initState() {
    tamanhoCubit = TamanhoCubit();
    tamanhoCubit.loadAll();
    bloc = ConsultaProcessosLeituraTamanhoSubPageCubit(
      service: ConsultaProcessosLeituraTamanhoSubService(),
    );
    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadProcessosLeituraTamanho(filter);
    } else {
      filter = ConsultaProcessosLeituraTamanhoSubFilter.empty();
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
        BlocConsumer<ConsultaProcessosLeituraTamanhoSubPageCubit,
            ConsultaProcessosLeituraTamanhoSubPageState>(
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
                  orderDescendingFieldColumn: 'dataHora',
                  smallRows: true,
                  columns: colunas,
                  items: state.processosLeiturasTamanhos,
                  onDetail: (event, obj) async {
                    var isUserValid =
                        await AccessUserService.validateUserHasRight(
                      DireitoEnum.ProcessoLeituraConsulta,
                    );

                    if (isUserValid == false) {
                      ToastUtils.showCustomToastWarning(
                        context,
                        'O Seu usuário não tem permissão para esta tela!',
                      );
                      return;
                    }

                    await openModalRedirect(
                      context,
                      obj.dataHora,
                      obj.codDescritorKit,
                      obj.codDescritorItem,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraTamanhoSubPageState state) =>
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
                readOnly: widget.filter != null,
                placeholder: 'Data Inicio',
                onDateSelected: (value) => filter.startDate = value,
                initialValue: filter.startDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                readOnly: widget.filter != null,
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
                    readOnly: widget.filter != null,
                    textFunction: (local) => local.LocalInstituicaoText(),
                    initialValue: local,
                    sourceList: locais,
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<TamanhoCubit, TamanhoState>(
                bloc: tamanhoCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }

                  TamanhoModel? tamanho = state.tamanhos
                      .where(
                        (element) => element.sigla == filter.tamanho,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<TamanhoModel>(
                    readOnly: widget.filter != null,
                    textFunction: (centroCusto) =>
                        centroCusto.GetDropDownText(),
                    initialValue: tamanho,
                    sourceList: state.tamanhos,
                    onChanged: (value) => filter.tamanho = value?.sigla,
                    placeholder: 'Tamanho',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadProcessosLeituraTamanho(filter);
  }

  Future openModalRedirect(
    BuildContext context,
    DateTime? date,
    int? codDescritorKit,
    int? codDescritorItem,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      identificador: '',
      title: 'Consulta Processo Leitura - Retirados Sub Consulta',
      widget: ConsultaProcessosLeituraPage(
        filter: ConsultaProcessosLeituraFilter(
          startDate: date,
          finalDate: date,
          codKit: null,
          codItem: null,
          finalTime: date,
          startTime: date,
          biologico: null,
          codEtapaProcesso: null,
          implantavel: null,
          indicador: null,
          lote: null,
          prontuario: null,
          idEtiquetaContem: null,
          codBarraKitContem: null,
          codDescritorItem: codDescritorItem,
          codDescritorKit: codDescritorKit,
        ),
      ),
    );
  }
}
