import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_retirado/consulta_processos_leitura_retirado_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/material/consulta_item/consulta_item_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_retirado/consulta_processos_leitura_retirado_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/item/consulta_item_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirado/consulta_processos_leitura_retirado_filter.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/query_dialog/query_dialog_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraRetiradoPage extends StatefulWidget {
  ConsultaProcessosLeituraRetiradoPage({super.key});

  @override
  State<ConsultaProcessosLeituraRetiradoPage> createState() =>
      _ConsultaProcessosLeituraRetiradoPageState();
}

class _ConsultaProcessosLeituraRetiradoPageState
    extends State<ConsultaProcessosLeituraRetiradoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Cod. Kit',
      field: 'codKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(
      text: 'Itens Pendente',
      field: 'nroItemFaltantes',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'ID Item', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Item', field: 'nomeItem'),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
    CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
    CustomDataColumn(text: 'Prontuário', field: 'prontuarioRetirada'),
    CustomDataColumn(text: 'Origem', field: 'origem'),
    CustomDataColumn(text: 'Destino', field: 'destino'),
    CustomDataColumn(text: 'Circulante', field: 'circulante'),
    CustomDataColumn(
      text: 'Data Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Cod. Reg. Processo',
      field: 'codRegistroProcesso',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaProcessosLeituraRetiradoPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ConsultaProcessosLeituraRetiradoFilter filter;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraRetiradoPageCubit(
      service: ConsultaProcessosLeituraRetiradoService(),
    );
    filter = ConsultaProcessosLeituraRetiradoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();

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
        BlocListener<ConsultaProcessosLeituraRetiradoPageCubit,
            ConsultaProcessosLeituraRetiradoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraRetiradoPageCubit,
              ConsultaProcessosLeituraRetiradoPageState>(
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
                    items: state.processosLeiturasRetirados,
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
                        obj.codKit,
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

  void onError(ConsultaProcessosLeituraRetiradoPageState state) =>
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
              BlocBuilder<LocalInstituicaoCubit, LocalInstituicaoState>(
                bloc: localInstituicaoBloc,
                builder: (context, locaisState) {
                  if (locaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<LocalInstituicaoModel> locaisInstituicoes =
                      locaisState.locaisInstituicoes;

                  locaisInstituicoes.sort(
                    (a, b) => a.nome.compareTo(b.nome),
                  );
                  LocalInstituicaoModel? local = locaisInstituicoes
                      .where(
                        (element) => element.cod == filter.codLocal,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<LocalInstituicaoModel>(
                    textFunction: (local) => local.LocalInstituicaoText(),
                    initialValue: local,
                    sourceList: locaisInstituicoes
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codLocal = value?.cod,
                    placeholder: 'Local',
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
              CustomCheckboxWidget(
                checked: filter.rotulado,
                onClick: (value) => filter.rotulado = value,
                text: 'Rotulado',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadProcessosLeituraRetirado(filter);
      }
    });
  }

  void openModalRedirect(BuildContext context, int? codKit) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaItemPage(
            filter: ConsultaItemFilter(
              codKit: codKit,
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
              implantavel: null,
              numeroPatrimonio: null,
              repositorio: null,
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
