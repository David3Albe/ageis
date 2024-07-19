import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/localizacao_arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_disponivel/consulta_estoque_disponivel_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/estoque_disponivel/consulta_estoque_disponivel_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel/consulta_estoque_disponivel_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaEstoqueDisponivelPage extends StatefulWidget {
  const ConsultaEstoqueDisponivelPage({super.key});

  @override
  State<ConsultaEstoqueDisponivelPage> createState() =>
      _ConsultaEstoqueDisponivelPageState();
}

class _ConsultaEstoqueDisponivelPageState
    extends State<ConsultaEstoqueDisponivelPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(text: 'Arsenal', field: 'nomeArsenal'),
    CustomDataColumn(text: 'Local', field: 'local'),
    CustomDataColumn(text: 'Proprietario', field: 'nomeProprietario'),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(
      text: 'Cod Kit',
      field: 'codKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Cod. Barras', field: 'codBarraKit'),
    CustomDataColumn(text: 'Item', field: 'nomeItem'),
    CustomDataColumn(text: 'Cod Item', field: 'codItem'),
    CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(
      text: 'Data Entrada',
      field: 'dataEntrada',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  late final ConsultaEstoqueDisponivelPageCubit bloc;
  late final ArsenalEstoqueCubit arsenalEstoqueBloc;
  late final LocalizacaoArsenalCubit localizacaoArsenalBloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaEstoqueDisponivelFilter filter;

  @override
  void initState() {
    bloc = ConsultaEstoqueDisponivelPageCubit(
      service: ConsultaEstoqueDisponivelService(),
    );
    filter = ConsultaEstoqueDisponivelFilter.empty();
    filter.ignorarRemovidos = true;
    arsenalEstoqueBloc = ArsenalEstoqueCubit();
    arsenalEstoqueBloc.loadAll();
    localizacaoArsenalBloc = LocalizacaoArsenalCubit();
    localizacaoArsenalBloc.loadAll();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();

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
              onPressed: () => bloc.loadEstoqueDisponivel(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaEstoqueDisponivelPageCubit,
            ConsultaEstoqueDisponivelPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaEstoqueDisponivelPageCubit,
              ConsultaEstoqueDisponivelPageState>(
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
                    items: state.estoquesDisponiveis,
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
                        obj.codBarraKit,
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

  void onError(ConsultaEstoqueDisponivelPageState state) =>
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
                    textFunction: (arsenal) => arsenal.ArsenalEstoqueNomeText(),
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
                  List<LocalizacaoArsenalModel> locaisArsenais =
                      localizacoesArsenaisState.objs;

                  locaisArsenais.sort(
                    (a, b) => a.local!.compareTo(b.local!),
                  );
                  LocalizacaoArsenalModel? localizacaoArsenal = locaisArsenais
                      .where(
                        (element) => element.cod == filter.codEstoqueLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalizacaoArsenalModel>(
                    textFunction: (localArsenal) =>
                        localArsenal.ArsenalEstoqueLocalText(),
                    initialValue: localizacaoArsenal,
                    sourceList: locaisArsenais
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codEstoqueLocal = value?.cod,
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
                    textFunction: (proprietario) =>
                        proprietario.ProprietarioText(),
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
    bloc.loadEstoqueDisponivel(filter);
  }

  Future openModalRedirect(
    BuildContext context,
    DateTime? startDate,
    String? codBarraKit,
    String? idEtiqueta,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      title: 'Consulta Processo Leitura - Estoque',
      widget: ConsultaProcessosLeituraPage(
        filter: ConsultaProcessosLeituraFilter(
          startDate: startDate?.add(const Duration(hours: -24)),
          finalDate: DateTime.now(),
          codKit: null,
          codItem: null,
          finalTime: null,
          startTime: null,
          biologico: null,
          codEtapaProcesso: null,
          implantavel: null,
          indicador: null,
          lote: null,
          prontuario: null,
          idEtiquetaContem: idEtiqueta,
          codBarraKitContem: codBarraKit,
        ),
      ),
    );
  }
}
