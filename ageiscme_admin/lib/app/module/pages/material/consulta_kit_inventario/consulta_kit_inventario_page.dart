import 'package:ageiscme_admin/app/module/pages/material/consulta_kit/consulta_kit_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit_inventario/consulta_kit_inventario_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/kit_inventario/consulta_kit_inventario_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/kit/consulta_kit_filter.dart';
import 'package:ageiscme_models/query_filters/kit_inventario/consulta_kit_inventario_filter.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
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

class ConsultaKitInventarioPage extends StatefulWidget {
  const ConsultaKitInventarioPage({super.key});

  @override
  State<ConsultaKitInventarioPage> createState() =>
      _ConsultaKitInventarioPageState();
}

class _ConsultaKitInventarioPageState extends State<ConsultaKitInventarioPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'codDescritorKit',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Nome',
      field: 'kitDescritor',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Descrição',
      field: 'kitDescritor',
      calculatedField: 'kitDescritorDescricao',
      valueConverter: (value) => value == null ? '' : value['descricao'],
    ),
    CustomDataColumn(
      text: 'Qtde. Kits',
      field: 'qtdeKits',
      type: CustomDataColumnType.Number,
      footerType: CustomDataColumnFooterType.Number,
    ),
    // CustomDataColumn(
    //   text: 'Qtde. Itens Padrão',
    //   field: 'qtdeItensPadrao',
    //   valueConverter: (value) => value == 0 ? '' : value,
    //   type: CustomDataColumnType.Number,
    // ),
    CustomDataColumn(
      text: 'Qtde. Itens Físico',
      field: 'qtdeItensFisico',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaKitInventarioPageCubit bloc;
  late final ConsultaKitInventarioFilter filter;

  @override
  void initState() {
    bloc = ConsultaKitInventarioPageCubit(
      service: ConsultaKitInventarioService(),
    );
    filter = ConsultaKitInventarioFilter.empty();

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
              onPressed: () => bloc.loadKitInventario(filter),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaKitInventarioPageCubit,
            ConsultaKitInventarioPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaKitInventarioPageCubit,
              ConsultaKitInventarioPageState>(
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
                    orderDescendingFieldColumn: 'codDescritorKit',
                    smallRows: true,
                    columns: colunas,
                    items: state.kitsInventarios,
                    onDetail: (event, obj) async {
                      var isUserValidConsulta =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.KitsConsulta,
                      );

                      var isUserValidManutencao =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.KitsManutencao,
                      );

                      if (isUserValidConsulta == false &&
                          isUserValidManutencao == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await openModalRedirect(
                        context,
                        obj.codDescritorKit,
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

  void onError(ConsultaKitInventarioPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            DropDownSearchApiWidget<KitDescritorDropDownSearchResponseDTO>(
              search: (str) async =>
                  (await KitDescritorService().getDropDownSearch(
                    KitDescritorDropDownSearchDTO(
                      numeroRegistros: 30,
                      termoPesquisa: str,
                      apenasAtivos: true,
                    ),
                  ))
                      ?.$2 ??
                  [],
              textFunction: (kitDescritor) => kitDescritor.Nome(),
              initialValue: filter.kitDescritor == null
                  ? null
                  : KitDescritorDropDownSearchResponseDTO(
                      cod: filter.kitDescritor!.cod,
                      nome: filter.kitDescritor?.nome,
                    ),
              onChanged: (value) {
                filter.codKitDescritor = value?.cod;
                filter.kitDescritor = value;
              },
              placeholder: 'Descritor do Kit',
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            Builder(
              builder: (context) {
                return DropDownSearchWidget<KitSituacaoOption>(
                  sourceList: KitSituacaoOption.situacaoOptions,
                  initialValue: KitSituacaoOption.situacaoOptions
                      .where(
                        (element) => element.cod == filter.codSituacao,
                      )
                      .firstOrNull,
                  placeholder: 'Situação',
                  onChanged: (value) => filter.codSituacao = value?.cod,
                );
              },
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadKitInventario(filter);
  }

  Future openModalRedirect(
    BuildContext context,
    int? codKit,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      identificador: (codKit ?? 0).toString(),
      title: 'Consulta Kit',
      widget: ConsultaKitPage(
        filter: ConsultaKitFilter(
          codKit: null,
          codKitDescritor: codKit,
          codProprietario: null,
          codSituacao: null,
        ),
      ),
    );
  }
}
