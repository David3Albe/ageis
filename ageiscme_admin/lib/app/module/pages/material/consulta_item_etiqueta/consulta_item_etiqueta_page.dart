import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item_etiqueta/consulta_item_etiqueta_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/item_etiqueta/item_etiqueta_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item_etiqueta/consulta_item_etiqueta_filter.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaItemEtiquetaPage extends StatefulWidget {
  const ConsultaItemEtiquetaPage({super.key});

  @override
  State<ConsultaItemEtiquetaPage> createState() =>
      _ConsultaItemEtiquetaPageState();
}

class _ConsultaItemEtiquetaPageState extends State<ConsultaItemEtiquetaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód. Item',
      field: 'codItem',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Etiqueta Atual', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
    CustomDataColumn(
      text: 'Cód. Kit',
      field: 'codKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome Kit', field: 'nomeKit'),
    CustomDataColumn(
      text: 'Total Etiqueta',
      field: 'totalEtiquetas',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Total Processos',
      field: 'totalProcessos',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiquetaItensEtiqueta'),
    CustomDataColumn(
      text: 'Qtde. Processos',
      field: 'qtdeProcessos',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Descarte',
      field: 'dataDescarte',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Usuário Alteração',
      field: 'usuarioAlteracaoEtiqueta',
    ),
    CustomDataColumn(
      text: 'Durab. Dias',
      field: 'durabDias',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaItemEtiquetaPageCubit bloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaItemEtiquetaFilter filter;

  @override
  void initState() {
    bloc = ConsultaItemEtiquetaPageCubit(
      service: ConsultaItemEtiquetaService(),
    );
    filter = ConsultaItemEtiquetaFilter.empty();
    filter.numeroRegistros = 500;
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
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
        FilterButtonWidget(
          onPressed: () => {
            openModal(context),
          },
        ),
        BlocListener<ConsultaItemEtiquetaPageCubit,
            ConsultaItemEtiquetaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaItemEtiquetaPageCubit,
              ConsultaItemEtiquetaPageState>(
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
                    orderDescendingFieldColumn: 'codItem',
                    smallRows: true,
                    columns: colunas,
                    items: state.itensEtiquetas,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaItemEtiquetaPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
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
            BlocBuilder<ProprietarioCubit, ProprietarioState>(
              bloc: proprietarioBloc,
              builder: (context, proprietarioState) {
                if (proprietarioState.loading) return const LoadingWidget();
                List<ProprietarioModel> proprietarios =
                    proprietarioState.proprietarios;
                proprietarios.sort((a, b) => a.nome!.compareTo(b.nome!));
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
            const Padding(padding: EdgeInsets.only(top: 2)),
            CustomAutocompleteWidget<ItemModel>(
              initialValue: filter.idEtiqueta,
              onChange: (str) {
                filter.idEtiqueta = str;
              },
              onItemSelectedText: (item) => item.idEtiqueta ?? null,
              label: 'Item',
              title: (p0) => Text(p0.EtiquetaDescricaoText()),
              suggestionsCallback: (str) => ItemService().Filter(
                ItemFilter(numeroRegistros: 30, termoPesquisa: str),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
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
              initialValue: filter.itemDescritor == null
                  ? null
                  : ItemDescritorDropDownSearchResponseDTO(
                      cod: filter.itemDescritor!.cod,
                      nome: filter.itemDescritor?.nome,
                    ),
              onChanged: (value) {
                filter.codItemDescritor = value?.cod;
                filter.itemDescritor = value;
              },
              placeholder: 'Item Descritor',
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            TextFieldNumberWidget(
              placeholder: 'Número Registros',
              startValue: filter.numeroRegistros,
              onChanged: (value) => filter.numeroRegistros =
                  value.isEmpty ? null : int.parse(value),
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            CustomCheckboxWidget(
              checked: filter.descartar,
              onClick: (value) => filter.descartar = value,
              text: 'Descartar Itens sem troca',
              align: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadItemEtiqueta(filter);
  }
}
