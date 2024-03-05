import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/item_descritor/item_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit/kit_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item_etiqueta/consulta_item_etiqueta_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/item_etiqueta/item_etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item_etiqueta/consulta_item_etiqueta_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaItemEtiquetaPage extends StatefulWidget {
  ConsultaItemEtiquetaPage({super.key});

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
  late final KitCubit kitBloc;
  late final ItemDescritorCubit itemDescritorBloc;
  late final ConsultaItemEtiquetaFilter filter;

  @override
  void initState() {
    bloc = ConsultaItemEtiquetaPageCubit(
      service: ConsultaItemEtiquetaService(),
    );
    filter = ConsultaItemEtiquetaFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();
    kitBloc = KitCubit();
    kitBloc.loadAll();
    itemDescritorBloc = ItemDescritorCubit();
    itemDescritorBloc.loadAll();

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
              BlocBuilder<KitCubit, List<KitModel>>(
                bloc: kitBloc,
                builder: (context, kits) {
                  KitModel? kit = kits
                      .where(
                        (element) => element.cod == filter.codKit,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitModel>(
                    textFunction: (kit) => kit.CodBarraDescritorText(),
                    initialValue: kit,
                    sourceList: kits,
                    onChanged: (value) => filter.codKit = value?.cod,
                    placeholder: 'Kit',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<ItemDescritorCubit, ItemDescritorState>(
                bloc: itemDescritorBloc,
                builder: (context, itensDescritorState) {
                  if (itensDescritorState.loading) {
                    return const LoadingWidget();
                  }
                  List<ItemDescritorModel> itensDescritores =
                      itensDescritorState.itensDescritores;

                  ItemDescritorModel? itemDescritor = itensDescritores
                      .where(
                        (element) => element.cod == filter.codItemDescritor,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ItemDescritorModel>(
                    textFunction: (itemDescritor) =>
                        itemDescritor.ItemDescritorText(),
                    initialValue: itemDescritor,
                    sourceList: itensDescritores,
                    onChanged: (value) => filter.codItemDescritor = value?.cod,
                    placeholder: 'Item',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder: 'DataMatrix Atual do item',
                onChanged: (value) => filter.idEtiqueta = value,
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
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadItemEtiqueta(filter);
      }
    });
  }
}
