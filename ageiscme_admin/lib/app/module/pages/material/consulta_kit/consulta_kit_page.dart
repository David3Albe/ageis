import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/grupo_material/grupo_material_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tamanho/tamanho_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item/consulta_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit/consulta_kit_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/kit/consulta_kit_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_filters/kit/consulta_kit_filter.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
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

class ConsultaKitPage extends StatefulWidget {
  const ConsultaKitPage({
    super.key,
    this.filter,
  });

  final ConsultaKitFilter? filter;

  @override
  State<ConsultaKitPage> createState() => _ConsultaKitPageState();
}

class _ConsultaKitPageState extends State<ConsultaKitPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Cod. Barra', field: 'codBarra'),
    CustomDataColumn(text: 'Descritor', field: 'nomeKitDescritor'),
    CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
    CustomDataColumn(text: 'Tamanho Kit', field: 'tamanhoKit'),
    CustomDataColumn(text: 'Grupo', field: 'grupo'),
    CustomDataColumn(
      text: 'Qtde. Itens Físico',
      field: 'qtdeItensFisico',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Cor 1', field: 'nomeCor1'),
    CustomDataColumn(text: 'Cor 2', field: 'nomeCor2'),
    CustomDataColumn(text: 'Cor 3', field: 'nomeCor3'),
    CustomDataColumn(text: 'Cor 4', field: 'nomeCor4'),
    CustomDataColumn(text: 'Conjunto', field: 'nomeConjunto'),
    CustomDataColumn(text: 'Situação', field: 'situacao'),
    CustomDataColumn(text: 'Restrição', field: 'restricao'),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Local Entrega', field: 'localEntrega'),
    CustomDataColumn(text: 'Local Retirada', field: 'localRetirada'),
    CustomDataColumn(text: 'Ultima Etapa', field: 'ultimaEtapa'),
    CustomDataColumn(
      text: 'Ultima Revisão',
      field: 'ultimaRevisao',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  late final ConsultaKitPageCubit bloc;
  late final ProprietarioCubit proprietarioBloc;
  late final TamanhoCubit tamanhoBloc;
  late final GrupoMaterialCubit grupoMaterialBloc;
  late final KitCorCubit kitCorBloc;
  late final ConsultaKitFilter filter;

  @override
  void initState() {
    bloc = ConsultaKitPageCubit(service: ConsultaKitService());
    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadKitConsulta(filter);
    } else {
      filter = ConsultaKitFilter.empty();
    }
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();
    tamanhoBloc = TamanhoCubit();
    tamanhoBloc.loadAll();
    grupoMaterialBloc = GrupoMaterialCubit();
    grupoMaterialBloc.loadAll();
    kitCorBloc = KitCorCubit();
    kitCorBloc.loadAll();

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
              onPressed: () => bloc.loadKitConsulta(filter),
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
        BlocListener<ConsultaKitPageCubit, ConsultaKitPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaKitPageCubit, ConsultaKitPageState>(
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
                    orderDescendingFieldColumn: 'cod',
                    smallRows: true,
                    columns: colunas,
                    items: state.kits,
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

                      await openModalRedirect(
                        context,
                        obj.codBarra,
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

  void onError(ConsultaKitPageState state) =>
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
      ),
    );
    if (confirm != true) return;
    bloc.loadKitConsulta(filter);
  }

  Future openModalRedirect(
    BuildContext context,
    String? codBarraKit,
  ) async {
    WindowsHelper.OpenDefaultWindows(
      identificador: '',
      title: 'Consulta Item',
      widget: ConsultaItemPage(
        filter: ConsultaItemFilter(
          codKit: null,
          implantavel: null,
          cmInicio: null,
          cmTermino: null,
          codGrupo: null,
          codItem: null,
          codItemDescritor: null,
          codProprietario: null,
          codSituacao: null,
          considerarRepositorio: null,
          descarte: null,
          descricaoCurtaItem: null,
          numeroPatrimonio: null,
          repositorio: null,
          rotulado: null,
          codBarraKitContem: codBarraKit,
          idEtiquetaContem: null,
        ),
      ),
    );
  }
}
