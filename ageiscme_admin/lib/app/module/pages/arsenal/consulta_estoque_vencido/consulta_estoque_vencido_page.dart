import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/localizacao_arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_vencido/consulta_estoque_vencido_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/estoque_vencido/consulta_estoque_vencido_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/estoque_vencido/consulta_estoque_vencido_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaEstoqueVencidoPage extends StatefulWidget {
  const ConsultaEstoqueVencidoPage({super.key});

  @override
  State<ConsultaEstoqueVencidoPage> createState() =>
      _ConsultaEstoqueVencidoPageState();
}

class _ConsultaEstoqueVencidoPageState
    extends State<ConsultaEstoqueVencidoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.DateTime,
      width: 130,
    ),
    CustomDataColumn(text: 'Arsenal', field: 'nomeArsenalEstoque'),
    CustomDataColumn(text: 'Local', field: 'nomeLocalEstoque'),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(
      text: 'Cod. Kit',
      field: 'codKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Cod. Barra', field: 'codBarra'),
    CustomDataColumn(text: 'Item', field: 'nomeItem'),
    CustomDataColumn(
      text: 'Cod. Item',
      field: 'codItem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(
      text: 'Data Entrada',
      field: 'dataEntrada',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  late final ConsultaEstoqueVencidoPageCubit bloc;
  late final ArsenalEstoqueCubit arsenalEstoqueBloc;
  late final LocalizacaoArsenalCubit localizacaoArsenalBloc;
  late final ConsultaEstoqueVencidoFilter filter;

  @override
  void initState() {
    bloc = ConsultaEstoqueVencidoPageCubit(
      service: ConsultaEstoqueVencidoService(),
    );
    filter = ConsultaEstoqueVencidoFilter.empty();
    arsenalEstoqueBloc = ArsenalEstoqueCubit();
    arsenalEstoqueBloc.loadAll();
    localizacaoArsenalBloc = LocalizacaoArsenalCubit();
    localizacaoArsenalBloc.loadAll();

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
        BlocListener<ConsultaEstoqueVencidoPageCubit,
            ConsultaEstoqueVencidoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaEstoqueVencidoPageCubit,
              ConsultaEstoqueVencidoPageState>(
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
                    orderAscendingFieldColumn: 'dataValidade',
                    smallRows: true,
                    columns: colunas,
                    items: state.estoquesVencidos,
                    onDetail: (event, obj) async {
                      var isUserValid =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.ProcessoLeituraConsulta,
                      );

                      if (isUserValid == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await openModalRedirect(
                        context,
                        obj.dataEntrada,
                        obj.codBarra,
                        obj.idEtiqueta,
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

  void onError(ConsultaEstoqueVencidoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              BlocBuilder<ArsenalEstoqueCubit, ArsenalEstoqueState>(
                bloc: arsenalEstoqueBloc,
                builder: (context, arsenaisState) {
                  if (arsenaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<ArsenalEstoqueModel> arsenalEstoques =
                      arsenaisState.arsenaisEstoques;

                  arsenalEstoques.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  ArsenalEstoqueModel? arsenalEstoque = arsenalEstoques
                      .where(
                        (element) => element.cod == filter.codEstoque,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ArsenalEstoqueModel>(
                    textFunction: (arsenalEstoque) =>
                        arsenalEstoque.ArsenalEstoqueNomeText(),
                    initialValue: arsenalEstoque,
                    sourceList: arsenalEstoques
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codEstoque = value?.cod,
                    placeholder: 'Arsenal',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<LocalizacaoArsenalCubit, LocalizacaoArsenalState>(
                bloc: localizacaoArsenalBloc,
                builder: (context, localizacoesArsenaisState) {
                  if (localizacoesArsenaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalizacaoArsenalModel> localizacaoArsenais =
                      localizacoesArsenaisState.objs;

                  localizacaoArsenais.sort(
                    (a, b) => a.local!.compareTo(b.local!),
                  );
                  LocalizacaoArsenalModel? localizacaoArsenal =
                      localizacaoArsenais
                          .where(
                            (element) => element.cod == filter.codLocalEstoque,
                          )
                          .firstOrNull;
                  return DropDownSearchWidget<LocalizacaoArsenalModel>(
                    textFunction: (localizacaoArsenal) =>
                        localizacaoArsenal.ArsenalEstoqueLocalText(),
                    initialValue: localizacaoArsenal,
                    sourceList: localizacaoArsenais
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codLocalEstoque = value?.cod,
                    placeholder: 'Localizações',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
                initialValue: filter.codBarraKitContem,
                onChange: (str) => filter.codBarraKitContem = str,
                onItemSelectedText: (kit) => kit.codBarra,
                label: 'Kit',
                title: (p0) => Text(p0.CodBarraDescritorText()),
                suggestionsCallback: (str) async {
                  return (await KitService().getDropDownSearchKits(
                        KitDropDownSearchDTO(
                          search: str,
                          numeroRegistros: 30,
                        ),
                      ))
                          ?.$2 ??
                      [];
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomAutocompleteWidget<ItemModel>(
                initialValue: filter.idEtiquetaContem,
                onChange: (str) => filter.idEtiquetaContem = str,
                onItemSelectedText: (item) => item.idEtiqueta ?? null,
                label: 'Item',
                title: (p0) => Text(p0.EtiquetaDescricaoText()),
                suggestionsCallback: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.rotulado,
                onClick: (value) => filter.rotulado = value,
                text: 'Rotulado',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadEstoqueVencido(filter);
  }

  Future openModalRedirect(
    BuildContext context,
    DateTime? startDate,
    String? codBarra,
    String? idEtiqueta,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      title: 'Consulta Processo Leitura',
      widget: ConsultaProcessosLeituraPage(
        filter: ConsultaProcessosLeituraFilter(
          startDate: startDate?.add(const Duration(hours: -24)),
          finalDate: DateTime.now(),
          finalTime: null,
          codItem: null,
          codKit: null,
          startTime: null,
          biologico: null,
          codEtapaProcesso: null,
          implantavel: null,
          indicador: null,
          lote: null,
          prontuario: null,
          idEtiquetaContem: idEtiqueta,
          codBarraKitContem: codBarra,
        ),
      ),
    );
  }
}
