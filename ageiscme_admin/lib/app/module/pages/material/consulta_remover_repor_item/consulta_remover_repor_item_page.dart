import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/motivo_remover_repor_item/motivo_remover_repor_item.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_remover_repor_item/consulta_remover_repor_item_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/motivo_remover_repor_item/consulta_remover_repor_item_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/motivo_remover_repor_item/consulta_remover_repor_item_filter.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
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

class ConsultaRemoverReporItemPage extends StatefulWidget {
  ConsultaRemoverReporItemPage({super.key});

  @override
  State<ConsultaRemoverReporItemPage> createState() =>
      _ConsultaRemoverReporItemPageState();
}

class _ConsultaRemoverReporItemPageState
    extends State<ConsultaRemoverReporItemPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
      width: 130,
    ),
    CustomDataColumn(
      text: 'Cód. Kit',
      field: 'kit',
      calculatedField: 'kitCodBarra',
      valueConverter: (kit) => kit == null ? '' : kit['codBarra'],
      width: 140,
    ),
    CustomDataColumn(
      text: 'Kit',
      field: 'kit',
      valueConverter: (kit) => kit == null || kit['descritor'] == null
          ? ''
          : kit['descritor']['nome'],
    ),
    CustomDataColumn(
      text: 'Etiqueta',
      width: 100,
      field: 'item',
      valueConverter: (value) => value == null ? '' : value['idEtiqueta'],
    ),
    CustomDataColumn(
      text: 'Item',
      field: 'item',
      calculatedField: 'itemDescricao',
      valueConverter: (value) => value == null ? '' : value['descricao'],
    ),
    CustomDataColumn(
      text: 'Usuário',
      field: 'usuario',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Autorizado Por',
      field: 'autorizadoPor',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Motivo Repor Remover Item',
      field: 'motivoReporRemoverItem',
      valueConverter: (value) => value == null ? '' : value['descricao'],
    ),
    CustomDataColumn(
      text: 'Tipo',
      field: 'tipo',
    ),
  ];

  late final ConsultaRemoverReporItemPageCubit bloc;
  late final MotivoRemoverReporItemCubit motivoRemoverReporItemCubit;
  late final ConsultaRemoverReporItemFilter filter;

  @override
  void initState() {
    bloc = ConsultaRemoverReporItemPageCubit(
      service: ConsultaRemoverReporItemService(),
    );
    filter = ConsultaRemoverReporItemFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    motivoRemoverReporItemCubit = MotivoRemoverReporItemCubit();
    motivoRemoverReporItemCubit.loadAll();

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
        BlocListener<ConsultaRemoverReporItemPageCubit,
            ConsultaRemoverReporItemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaRemoverReporItemPageCubit,
              ConsultaRemoverReporItemPageState>(
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
                    orderDescendingFieldColumn: 'dataHora',
                    columns: colunas,
                    items: state.itens,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaRemoverReporItemPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
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
              DropDownSearchApiWidget<UsuarioDropDownSearchResponseDTO>(
                search: (str) async =>
                    (await UsuarioService().getDropDownSearch(
                      UsuarioDropDownSearchDTO(
                        numeroRegistros: 30,
                        search: str,
                      ),
                    ))
                        ?.$2 ??
                    [],
                textFunction: (usuario) => usuario.NomeText(),
                initialValue: filter.usuario,
                onChanged: (value) {
                  filter.codUsuarioAcao = value?.cod;
                  filter.usuario = value;
                },
                placeholder: 'Usuário',
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<MotivoRemoverReporItemCubit,
                  MotivoRemoverReporItemState>(
                bloc: motivoRemoverReporItemCubit,
                builder: (context, state) {
                  if (state.loading) {
                    return const LoadingWidget();
                  }
                  List<MotivoRemoverReporItemModel> motivos = state.motivos;
                  motivos.sort(
                    (a, b) => a.descricao!.compareTo(b.descricao!),
                  );
                  MotivoRemoverReporItemModel? motivo = motivos
                      .where(
                        (element) => element.cod == filter.codMotivo,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<MotivoRemoverReporItemModel>(
                    textFunction: (motivo) => motivo.DescricaoText(),
                    initialValue: motivo,
                    sourceList: motivos
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codMotivo = value?.cod,
                    placeholder: 'Motivo',
                  );
                },
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadMotivoRemoverReporItem(filter);
      }
    });
  }
}
