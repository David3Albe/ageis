import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
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
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaEstoqueDisponivelRotuladoPage extends StatefulWidget {
  const ConsultaEstoqueDisponivelRotuladoPage({super.key});

  @override
  State<ConsultaEstoqueDisponivelRotuladoPage> createState() =>
      _ConsultaEstoqueDisponivelRotuladoPageState();
}

class _ConsultaEstoqueDisponivelRotuladoPageState
    extends State<ConsultaEstoqueDisponivelRotuladoPage> {
  late final ConsultaEstoqueDisponivelRotuladoPageCubit bloc;
  late final ArsenalEstoqueCubit arsenalEstoqueBloc;
  late final ProprietarioCubit proprietarioBloc;
  late final ConsultaEstoqueDisponivelRotuladoFilter filter;

  @override
  void initState() {
    bloc = ConsultaEstoqueDisponivelRotuladoPageCubit(
      service: ConsultaEstoqueDisponivelRotuladoService(),
    );
    filter = ConsultaEstoqueDisponivelRotuladoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    arsenalEstoqueBloc = ArsenalEstoqueCubit();
    arsenalEstoqueBloc.loadAll();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();
    bloc.loadEstoqueDisponivelRotulado(filter);
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
              onPressed: () => bloc.loadEstoqueDisponivelRotulado(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaEstoqueDisponivelRotuladoPageCubit,
            ConsultaEstoqueDisponivelRotuladoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaEstoqueDisponivelRotuladoPageCubit,
              ConsultaEstoqueDisponivelRotuladoPageState>(
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
                    orderAscendingFieldColumn: 'dataHora',
                    smallRows: true,
                    columns: _GetColumns(filter.entrada, filter.saida),
                    items: state.estoquesDisponiveisRotulados,
                    onDetail: (event, obj) async {
                      var isUserValid =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.ProcessoLeituraConsulta,
                      );

                      if (isUserValid == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await openModalRedirect(
                        context,
                        obj.dataHora,
                        obj.item?.idEtiqueta,
                        null,
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

  void onError(ConsultaEstoqueDisponivelRotuladoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
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
              BlocBuilder<ArsenalEstoqueCubit, ArsenalEstoqueState>(
                bloc: arsenalEstoqueBloc,
                builder: (context, arsenaisState) {
                  if (arsenaisState.loading) {
                    return const LoadingWidget();
                  }
                  List<ArsenalEstoqueModel> arsenaisEstoques =
                      arsenaisState.arsenaisEstoques;

                  arsenaisEstoques.sort(
                    (a, b) => a.nome!.compareTo(b.nome!),
                  );
                  ArsenalEstoqueModel? arsenalEstoque = arsenaisEstoques
                      .where(
                        (element) => element.cod == filter.codEstoque,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<ArsenalEstoqueModel>(
                    textFunction: (arsenalEstoque) =>
                        arsenalEstoque.ArsenalEstoqueNomeText(),
                    initialValue: arsenalEstoque,
                    sourceList: arsenaisEstoques
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codEstoque = value?.cod,
                    placeholder: 'Arsenal',
                  );
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
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.entrada,
                onClick: (value) => filter.entrada = value,
                text: 'Entrada',
                align: MainAxisAlignment.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.saida,
                onClick: (value) => filter.saida = value,
                text: 'Saída',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    );
    if (confirm != true) return;
    bloc.loadEstoqueDisponivelRotulado(filter);
  }

  _GetColumns(bool? entrada, bool? saida) {
    if (entrada == true || saida == true) {
      final List<CustomDataColumn> colunasCompleta = [
        CustomDataColumn(
          text: 'Data',
          field: 'dataHora',
          type: CustomDataColumnType.DateTime,
        ),
        CustomDataColumn(text: 'Etiqueta', field: 'etiqueta'),
        CustomDataColumn(text: 'Item', field: 'descricaoItem'),
        CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
        CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
        CustomDataColumn(text: 'Equipamento', field: 'equipamentoNome'),
        CustomDataColumn(text: 'Etapa Processo', field: 'etapaProcesso'),
        CustomDataColumn(text: 'Tipo Processo', field: 'tipoProcesso'),
        CustomDataColumn(
          text: 'Prioridade',
          field: 'nivelPrioridade',
          // valueConverter: (dynamic value) =>
          //     PrioridadeOption.getOpcaoFromId(value),
        ),
        CustomDataColumn(text: 'Usuario', field: 'usuario'),
        CustomDataColumn(text: 'Prontuário', field: 'prontuarioRetirada'),
        CustomDataColumn(text: 'Origem', field: 'origem'),
        CustomDataColumn(text: 'Destino', field: 'destino'),
        CustomDataColumn(text: 'Circulante', field: 'circulante'),
        CustomDataColumn(
          text: 'Cod. Item',
          field: 'codItemRotulo',
          type: CustomDataColumnType.Number,
        ),
        CustomDataColumn(text: 'Motivo', field: 'motivo'),
        CustomDataColumn(
          text: 'Motivo Quebra Fluxo',
          field: 'motivoQuebraFluxo',
        ),
        CustomDataColumn(text: 'Observações', field: 'observacao'),
      ];
      return colunasCompleta;
    } else {
      final List<CustomDataColumn> colunasSimples = [
        CustomDataColumn(
          text: 'Arsenal',
          field: 'arsenalEstoque',
          valueConverter: (value) => value == null ? '' : value['nome'],
        ),
        CustomDataColumn(
          text: 'Item',
          field: 'item',
          calculatedField: 'itemDescricao',
          valueConverter: (value) => value == null ? '' : value['descricao'],
        ),
        CustomDataColumn(
          text: 'Cod. Item',
          field: 'codItem',
          type: CustomDataColumnType.Number,
        ),
        CustomDataColumn(
          text: 'ID Etiqueta',
          field: 'item',
          valueConverter: (value) => value == null ? '' : value['idEtiqueta'],
        ),
        CustomDataColumn(text: 'Proprietário', field: 'proprietario'),
        CustomDataColumn(
          text: 'Quantidade',
          field: 'quantidade',
          type: CustomDataColumnType.Number,
        ),
      ];
      return colunasSimples;
    }
  }

  Future openModalRedirect(
    BuildContext context,
    DateTime? startDate,
    String? codBarraKit,
    String? idEtiqueta,
  ) async {
    if (codBarraKit == null && idEtiqueta == null) return;
    WindowsHelper.OpenDefaultWindows(
      title: 'Consulta Processo Leitura',
      widget: ConsultaProcessosLeituraPage(
        filter: ConsultaProcessosLeituraFilter(
          startDate: startDate?.add(const Duration(hours: -24)) ??
              DateTime.now().add(
                const Duration(
                  hours: -24,
                ),
              ),
          finalDate: DateTime.now(),
          codKit: null,
          codItem: null,
          finalTime: null,
          startTime: null,
          biologico: null,
          codEtapaProcesso: null,
          implantavel: null,
          indicador: null,
          lote: null,
          prontuario: null,
          idEtiquetaContem: idEtiqueta,
          codBarraKitContem: codBarraKit,
        ),
      ),
    );
  }
}
