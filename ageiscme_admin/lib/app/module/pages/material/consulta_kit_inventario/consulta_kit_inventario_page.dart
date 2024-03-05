import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_descritor/kit_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit/consulta_kit_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_kit_inventario/consulta_kit_inventario_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/query_dialog/query_dialog_widget.dart';
import 'package:ageiscme_data/query_services/kit_inventario/consulta_kit_inventario_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/kit/consulta_kit_filter.dart';
import 'package:ageiscme_models/query_filters/kit_inventario/consulta_kit_inventario_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_footer_type.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaKitInventarioPage extends StatefulWidget {
  ConsultaKitInventarioPage({super.key});

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
    CustomDataColumn(
      text: 'Qtde. Itens Padrão',
      field: 'qtdeItensPadrao',
      valueConverter: (value) => value == 0 ? '' : value,
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Qtde. Itens Físico',
      field: 'qtdeItensFisico',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaKitInventarioPageCubit bloc;
  late final KitDescritorCubit kitDescritorBloc;
  late final ConsultaKitInventarioFilter filter;

  @override
  void initState() {
    bloc = ConsultaKitInventarioPageCubit(
      service: ConsultaKitInventarioService(),
    );
    filter = ConsultaKitInventarioFilter.empty();
    kitDescritorBloc = KitDescritorCubit();
    kitDescritorBloc.loadAll();

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

                      openModalRedirect(
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

  void openModal(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              BlocBuilder<KitDescritorCubit, KitDescritorState>(
                bloc: kitDescritorBloc,
                builder: (context, kitsDescritoresState) {
                  if (kitsDescritoresState.loading) {
                    return const LoadingWidget();
                  }
                  List<KitDescritorModel> kitsDescritores =
                      kitsDescritoresState.kitDescritores;
                  kitsDescritores.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  KitDescritorModel? kitDescritor = kitsDescritores
                      .where(
                        (element) => element.cod == filter.codKitDescritor,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitDescritorModel>(
                    textFunction: (item) => item.GetDropDownText(),
                    initialValue: kitDescritor,
                    sourceList: kitsDescritores
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codKitDescritor = value?.cod,
                    placeholder: 'Kit Descritor',
                  );
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
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadKitInventario(filter);
      }
    });
  }

  void openModalRedirect(
    BuildContext context,
    int? codKit,
  ) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaKitPage(
            filter: ConsultaKitFilter(
              codKit: null,
              codKitDescritor: codKit,
              codProprietario: null,
              codSituacao: null,
            ),
          ),
        );
      },
    );
  }
}
