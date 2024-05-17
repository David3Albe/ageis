import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/grupo_material/grupo_material_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item/consulta_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item_inventario/consulta_item_inventario_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/item_inventario/consulta_item_inventario_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_filters/item_inventario/consulta_item_inventario_filter.dart';
import 'package:ageiscme_models/query_models/item_inventario/consulta_item_inventario_model.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_float_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
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

class ConsultaItemInventarioPage extends StatefulWidget {
  ConsultaItemInventarioPage({super.key});

  @override
  State<ConsultaItemInventarioPage> createState() =>
      _ConsultaItemInventarioPageState();
}

class _ConsultaItemInventarioPageState
    extends State<ConsultaItemInventarioPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Nome', field: 'descricaoCurta'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'qtdeCodDescritor',
      footerType: CustomDataColumnFooterType.Number,
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Valor Item',
      field: 'valorItem',
      footerType: CustomDataColumnFooterType.Currency,
      valueConverter: (value) => value == 0 ? '' : value,
      type: CustomDataColumnType.Currency,
    ),
    CustomDataColumn(text: 'Grupo', field: 'nomeGrupo'),
    CustomDataColumn(text: 'Processo Normal', field: 'nomeProcessoNormal'),
    CustomDataColumn(text: 'Processo Urgência', field: 'nomeProcessoUrgencia'),
    CustomDataColumn(
      text: 'Processo Emergência',
      field: 'nomeProcessoEmergencia',
    ),
    CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
  ];

  late final ConsultaItemInventarioPageCubit bloc;
  late final GrupoMaterialCubit grupoMaterialBloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaItemInventarioFilter filter;

  @override
  void initState() {
    bloc = ConsultaItemInventarioPageCubit(
      service: ConsultaItemInventarioService(),
    );
    filter = ConsultaItemInventarioFilter.empty();
    grupoMaterialBloc = GrupoMaterialCubit();
    grupoMaterialBloc.loadAll();
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
        BlocListener<ConsultaItemInventarioPageCubit,
            ConsultaItemInventarioPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaItemInventarioPageCubit,
              ConsultaItemInventarioPageState>(
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

                      openModalRedirect(
                        context,
                        obj.codItemDescritor,
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

  void onError(ConsultaItemInventarioPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
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
              Builder(
                builder: (context) {
                  return DropDownSearchWidget<
                      ConsultaItemInventarioStatusOption>(
                    sourceList:
                        ConsultaItemInventarioStatusOption.situacaoOptions,
                    initialValue:
                        ConsultaItemInventarioStatusOption.situacaoOptions
                            .where(
                              (element) => element.cod == filter.situacao,
                            )
                            .firstOrNull,
                    placeholder: 'Situação',
                    onChanged: (value) => filter.situacao = value?.cod,
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<GrupoMaterialCubit, List<GrupoMaterialModel>>(
                bloc: grupoMaterialBloc,
                builder: (context, gruposMateriais) {
                  gruposMateriais.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  GrupoMaterialModel? grupoMaterial = gruposMateriais
                      .where(
                        (element) => element.cod == filter.codGrupoItem,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<GrupoMaterialModel>(
                    textFunction: (grupoMaterial) =>
                        grupoMaterial.GetGrupoNomeText(),
                    initialValue: grupoMaterial,
                    sourceList: gruposMateriais
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codGrupoItem = value?.cod,
                    placeholder: 'Grupo',
                  );
                },
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
                    const SizedBox(width: 50.0),
                    Expanded(
                      child: TextFieldNumberFloatWidget(
                        placeholder: 'Até (CM)',
                        onChanged: (value) =>
                            filter.cmFinal = double.parse(value),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.repositorio,
                onClick: (value) => filter.repositorio = value,
                text: 'Função Armazenar Itens',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.descartado,
                onClick: (value) => filter.descartado = value,
                text: 'Descartados',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.implantavel,
                onClick: (value) => filter.implantavel = value,
                text: 'Implántaveis',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.complementar,
                onClick: (value) => filter.complementar = value,
                text: 'Itens Complementares',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadItemInventario(filter);
      }
    });
  }

  void openModalRedirect(
    BuildContext context,
    int? codItem,
  ) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaItemPage(
            filter: ConsultaItemFilter(
              cmInicio: null,
              cmTermino: null,
              codGrupo: filter.codGrupoItem,
              codItem: null,
              codItemDescritor: codItem,
              codKit: null,
              codProprietario: null,
              codSituacao: filter.situacao,
              considerarRepositorio: null,
              descricaoCurtaItem: null,
              numeroPatrimonio: null,
              repositorio: filter.repositorio,
              descarte: filter.descartado,
              implantavel: null,
              rotulado: null,
              codBarraKitContem: null,
              idEtiquetaContem: null,
            ),
          ),
        );
      },
    );
  }
}
