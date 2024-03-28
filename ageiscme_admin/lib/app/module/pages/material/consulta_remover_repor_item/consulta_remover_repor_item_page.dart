import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit/kit_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/motivo_remover_repor_item/motivo_remover_repor_item.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_remover_repor_item/consulta_remover_repor_item_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/motivo_remover_repor_item/consulta_remover_repor_item_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/motivo_remover_repor_item/consulta_remover_repor_item_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
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
    ),
    CustomDataColumn(
      text: 'Cód. Kit',
      field: 'kit',
      calculatedField: 'kitCodBarra',
      valueConverter: (kit) => kit == null ? '' : kit['codBarra'],
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
  late final KitCubit kitBloc;
  late final UsuarioCubit usuarioCubit;
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
    kitBloc = KitCubit();
    kitBloc.loadAll();
    usuarioCubit = UsuarioCubit();
    usuarioCubit.loadAll();
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
              BlocBuilder<KitCubit, List<KitModel>>(
                bloc: kitBloc,
                builder: (context, kits) {
                  KitModel? kit = kits
                      .where(
                        (element) => element.codBarra == filter.codBarraKit,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitModel>(
                    textFunction: (kit) => kit.CodBarraDescritorText(),
                    initialValue: kit,
                    sourceList: kits,
                    onChanged: (value) => filter.codBarraKit = value?.codBarra,
                    placeholder: 'Kit',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DropDownSearchApiWidget<ItemModel>(
                textFunction: (item) => item.EtiquetaDescricaoText(),
                initialValue: filter.item,
                search: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
                onChanged: (value) {
                  filter.item = value;
                  filter.codBarraItem = value?.idEtiqueta;
                },
                placeholder: 'Item',
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<UsuarioCubit, UsuarioState>(
                bloc: usuarioCubit,
                builder: (context, state) {
                  List<UsuarioModel> usuarios = state.usuarios;
                  usuarios.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  UsuarioModel? usuario = usuarios
                      .where(
                        (element) => element.cod == filter.codUsuarioAcao,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<UsuarioModel>(
                    textFunction: (usuario) => usuario.CodBarraNomeText(),
                    initialValue: usuario,
                    sourceList: usuarios
                        .where(
                          (element) =>
                              element.ativo == true &&
                              element.colaborador == true,
                        )
                        .toList(),
                    onChanged: (value) => filter.codUsuarioAcao = value?.cod,
                    placeholder: 'Usuário',
                  );
                },
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
