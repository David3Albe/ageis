import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/grupo_material/grupo_material_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item/consulta_item_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm/item_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/item/consulta_item_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_models/item/consulta_item_model.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaItemPage extends StatefulWidget {
  const ConsultaItemPage({
    super.key,
    this.filter,
  });

  final ConsultaItemFilter? filter;

  @override
  State<ConsultaItemPage> createState() => _ConsultaItemPageState();
}

class _ConsultaItemPageState extends State<ConsultaItemPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'ID Etiqueta',
      field: 'idEtiqueta',
      width: 120,
    ),
    CustomDataColumn(text: 'Item', field: 'item'),
    CustomDataColumn(text: 'Descritor', field: 'descricaoCurta'),
    CustomDataColumn(text: 'Tamanho', field: 'tamanhoSigla'),
    CustomDataColumn(text: 'Grupo', field: 'nomeGrupo'),
    CustomDataColumn(
      text: 'Qtde. Processos',
      field: 'qtdeProcessos',
      type: CustomDataColumnType.Number,
      width: 120,
    ),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
    CustomDataColumn(
      text: 'Validade',
      field: 'rmsValidade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(text: 'Implantável', field: 'implantavel'),
    CustomDataColumn(
      text: 'Aquisição',
      field: 'dataAquisicao',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Vida Útil',
      field: 'vidaUtil',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(text: 'Lote Produto', field: 'loteProduto'),
    CustomDataColumn(
      text: 'Descarte',
      field: 'dataDescarte',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(text: 'Situação', field: 'situacao'),
    CustomDataColumn(text: 'Restrição', field: 'restricao'),
    CustomDataColumn(
      text: 'Valor Item',
      field: 'valorItem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Peso G',
      field: 'pesoG',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Fabricante', field: 'fabricante'),
    CustomDataColumn(text: 'Fornecedor', field: 'fornecedor'),
    CustomDataColumn(text: 'Reg. Anvisa', field: 'regAnvisa'),
    CustomDataColumn(
      text: 'Número Patrimônio',
      field: 'numeroPatrimonio',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Número Nota',
      field: 'numeroNota',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Local Entrega', field: 'localEntrega'),
    CustomDataColumn(text: 'Local Retirada', field: 'localRetirada'),
    CustomDataColumn(text: 'Última Etapa', field: 'ultimaEtapa'),
    CustomDataColumn(
      text: 'Última Revisão',
      field: 'ultimaAlteracao',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  late final ConsultaItemPageCubit bloc;
  late final GrupoMaterialCubit grupoMaterialBloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaItemFilter filter;
  late final ItemService service;

  @override
  void initState() {
    bloc = ConsultaItemPageCubit(
      service: ConsultaItemService(),
    );
    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadItem(filter);
    } else {
      filter = ConsultaItemFilter.empty();
    }
    filter.numeroRegistros = 500;
    grupoMaterialBloc = GrupoMaterialCubit();
    grupoMaterialBloc.loadAll();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();
    service = ItemService();

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
              onPressed: () => bloc.loadItem(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaItemPageCubit, ConsultaItemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaItemPageCubit, ConsultaItemPageState>(
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
                    items: state.itens,
                    onDetail: (event, obj) async {
                      var isUserValidConsulta =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.ItensConsulta,
                      );

                      var isUserValidManutencao =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.ItensManutencao,
                      );

                      if (isUserValidConsulta == false &&
                          isUserValidManutencao == false) {
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
        ),
      ],
    );
  }

  void onError(ConsultaItemPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropDownSearchApiWidget<ItemDescritorDropDownSearchResponseDTO>(
                search: (str) async =>
                    (await ItemDescritorService().getDropDownSearch(
                      ItemDescritorDropDownSearchDTO(
                        numeroRegistros: 30,
                        termoPesquisa: str,
                        apenasAtivos: true,
                      ),
                    ))
                        ?.$2 ??
                    [],
                textFunction: (itemDescritor) => itemDescritor.Nome(),
                initialValue: filter.itemDescritor,
                onChanged: (value) {
                  filter.codItemDescritor = value?.cod;
                  filter.itemDescritor = value;
                },
                placeholder: 'Item Descritor',
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
              DropDownSearchWidget<ConsultaItemStatusOption>(
                initialValue: ConsultaItemStatusOption.situacaoOptions
                    .where(
                      (element) => element.cod == filter.codSituacao,
                    )
                    .firstOrNull,
                sourceList: ConsultaItemStatusOption.situacaoOptions,
                onChanged: (value) => filter.codSituacao = value?.cod,
                placeholder: 'Situação',
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<GrupoMaterialCubit, GrupoMaterialState>(
                bloc: grupoMaterialBloc,
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  List<GrupoMaterialModel> grupos = state.grupoMateriais;
                  grupos.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  GrupoMaterialModel? grupo = grupos
                      .where(
                        (element) => element.cod == filter.codGrupo,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<GrupoMaterialModel>(
                    textFunction: (grupo) => grupo.GetGrupoNomeText(),
                    initialValue: grupo,
                    sourceList: grupos
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codGrupo = value?.cod,
                    placeholder: 'Grupo',
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
              BlocBuilder<ProprietarioCubit, ProprietarioState>(
                bloc: proprietarioBloc,
                builder: (context, proprietarioState) {
                  if (proprietarioState.loading) return const LoadingWidget();
                  List<ProprietarioModel> proprietarios =
                      proprietarioState.proprietarios;
                  ProprietarioModel? proprietario = proprietarios
                      .where(
                        (element) => element.cod == filter.codProprietario,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ProprietarioModel>(
                    textFunction: (proprietario) =>
                        proprietario.ProprietarioText(),
                    initialValue: proprietario,
                    sourceList: proprietarios,
                    onChanged: (value) => filter.codProprietario = value?.cod,
                    placeholder: 'Proprietário',
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldNumberWidget(
                        placeholder: 'Número Patrimônio',
                        onChanged: (value) =>
                            filter.numeroPatrimonio = int.parse(value),
                      ),
                    ),
                    const SizedBox(width: 36.0),
                    Expanded(
                      child: TextFieldStringWidget(
                        placeholder: 'Descrição Item',
                        onChanged: (value) => filter.descricaoCurtaItem = value,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldNumberFloatWidget(
                        placeholder: 'De (CM)',
                        onChanged: (value) =>
                            filter.cmInicio = double.parse(value),
                      ),
                    ),
                    const SizedBox(width: 36.0),
                    Expanded(
                      child: TextFieldNumberFloatWidget(
                        placeholder: 'Até (CM)',
                        onChanged: (value) =>
                            filter.cmTermino = double.parse(value),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldNumberWidget(
                      placeholder: 'Número Registros',
                      startValue: filter.numeroRegistros,
                      onChanged: (value) => filter.numeroRegistros =
                          value.isEmpty ? null : int.parse(value),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 2.0),
              ),
              CustomCheckboxWidget(
                checked: filter.repositorio,
                onClick: (value) => filter.repositorio = value,
                text: 'Apenas Função Armazenar Itens',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              CustomCheckboxWidget(
                checked: filter.considerarRepositorio,
                onClick: (value) => filter.considerarRepositorio = value,
                text: 'Considerar Função Armazenar Itens',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              CustomCheckboxWidget(
                checked: filter.descarte,
                onClick: (value) => filter.descarte = value,
                text: 'Descartados',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              CustomCheckboxWidget(
                checked: filter.rotulado,
                onClick: (value) => filter.rotulado = value,
                text: 'Rotulados',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              CustomCheckboxWidget(
                checked: filter.implantavel,
                onClick: (value) => filter.implantavel = value,
                text: 'Apenas Implantáveis',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadItem(filter);
  }

  Future<ItemModel?> getFilter(int cod) async {
    return service.FilterOne(
      ItemFilter(
        cod: cod,
        carregarKit: true,
        carregarDescritor: true,
        carregarUsuarios: true,
        carregarProprietario: true,
        carregarItensConsignado: true,
      ),
    );
  }

  Future openModalRedirect(
    BuildContext context,
    int cod,
  ) async {
    LoadingController loading = LoadingController(context: context);

    ItemModel? item;
    item = await getFilter(cod);
    if (item == null) {
      loading.close(context, mounted);
      notFoundError();
      return;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Item',
      widget: ItemPageFrm(
        onCancel: () => onCancel(chave),
        proprietarioCubit: proprietarioBloc,
        item: item,
        frmType: ItemPageFrmtype.Items,
      ),
    );
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Item que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
