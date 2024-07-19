// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_consulta/processo_tipo_consulta_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_fluxo/presenter/processo_tipo_fluxo_page_presenter.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/processo_etapa/search_materials/processo_etapa_search_materials_dto.dart';
import 'package:ageiscme_models/dto/processo_tipo/ultima_leitura/processo_tipo_ultima_leitura_item_kit_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_etapa/search_materials/processo_etapa_search_materials_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_tipo/ultima_leitura/processo_tipo_ultima_leitura_item_kit_response_dto.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoTipoConsultaPage extends StatefulWidget {
  const ProcessoTipoConsultaPage({super.key});

  @override
  State<ProcessoTipoConsultaPage> createState() =>
      _ProcessoTipoConsultaPageState();
}

class _ProcessoTipoConsultaPageState extends State<ProcessoTipoConsultaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 110,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Nível Prioridade',
      field: 'nivelPrioridade',
      valueConverter: (value) =>
          ProcessoTipoPrioriodadeOption.getOpcaoFromId(value),
    ),
    CustomDataColumn(
      text: 'Prazo Validade',
      field: 'prazoValidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Limite Vigência',
      field: 'limiteVigencia',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final ProcessoTipoConsultaPageCubit bloc;
  late final ProcessoTipoService service;
  String? kit;
  String? item;

  @override
  void initState() {
    service = ProcessoTipoService();
    bloc = ProcessoTipoConsultaPageCubit(service: ProcessoTipoService());
    bloc.loadProcessoTipo();
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
            Flexible(
              child: CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
                initialValue: kit,
                onChange: (str) => kit = str,
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
            ),
            const Padding(padding: EdgeInsets.only(left: 24)),
            Flexible(
              child: CustomAutocompleteWidget<ItemModel>(
                initialValue: item,
                onChange: (str) => item = str,
                onItemSelectedText: (item) => item.idEtiqueta ?? null,
                label: 'Item',
                title: (p0) => Text(p0.EtiquetaDescricaoText()),
                suggestionsCallback: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Flexible(
                child: DefaultButtonWidget(
                  text: 'Consultar',
                  onPressed: _consultar,
                  cor: Colors.blue.shade400,
                  corHovered: Colors.blue.shade600,
                  icon: Icons.search,
                ),
              ),
            ),
          ],
        ),
        BlocConsumer<ProcessoTipoConsultaPageCubit,
            ProcessoTipoConsultaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
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
                  filterOnlyActives: true,
                  onOpen: (ProcessoTipoModel objeto) => {
                    openModal(context, ProcessoTipoModel.copy(objeto), null),
                  },
                  columns: colunas,
                  items: state.processosTipos,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future _consultar() async {
    if (kit == null && item == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não é possível consultar sem filtrar item e kit, filtre um dos dois',
      );
      return;
    }
    if (kit != null && item != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não é possível consultar filtrando item e kit, filtre apenas um deles',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);
    (String, ProcessoTipoUltimaLeituraItemKitResponseDTO)? result =
        await ProcessoTipoService().ultimoLocal(
      ProcessoTipoUltimaLeituraItemKitDTO(
        codBarraKit: kit,
        idEtiqueta: item,
      ),
    );
    loading.closeDefault();
    if (result == null) {
      return;
    }
    if (result.$2.ultimoLocal != null) {
      ToastUtils.showCustomToastNoticeBig(context, result.$2.ultimoLocal!);
    }
    if (result.$2.codTipoProcesso == null) return;
    ProcessoTipoModel? tipoProcesso = bloc.state.processosTipos
        .where((element) => element.cod == result.$2.codTipoProcesso)
        .firstOrNull;
    if (tipoProcesso == null) return;
    await openModal(context, tipoProcesso, result.$2.codEtapaProcesso);
  }

  Future<bool?> _carregarFluxoEtapas(ProcessoTipoModel processoTipo) async {
    if (processoTipo.etapas != null) return true;
    ProcessoTipoModel? processoTipoFluxo =
        await ProcessoTipoService().FilterOneV2(
      ProcessoTipoFilter(
        carregarEquipamentosEtapas: true,
        carregarEtapas: true,
        carregarSequenciasEtapas: true,
        cod: processoTipo.cod,
      ),
    );

    if (processoTipoFluxo == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Tipo de processo não encontrado, revise seu procedimento, entre em contato com a cordenação!',
      );
      return false;
    }

    processoTipo.etapas = processoTipoFluxo.etapas;
    return true;
  }

  Future openModal(
    BuildContext context,
    ProcessoTipoModel processoTipo,
    int? codEtapa,
  ) async {
    if (processoTipo.cod == 0 || processoTipo.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que o tipo de processo esteja criado para editar o fluxo',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);

    bool? carregouEtapas = await _carregarFluxoEtapas(processoTipo);
    if (carregouEtapas != true) {
      loading.close(context, mounted);
      return;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Fluxo Tipo de Processo',
      widget: ProcessoTipoFluxoPagePresenter(
        onCancel: () => onCancel(chave),
        canEdit: false,
        processoTipo: processoTipo,
        initialClickOn: codEtapa,
        onDetailSearchItems: findMaterials,
      ),
    );
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void onError(ProcessoTipoConsultaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  Future<List<String>> findMaterials({required int id}) async {
    LoadingController loading = LoadingController(context: context);
    (String, ProcessoEtapaSearchMaterialsResponseDTO)? result =
        await ProcessoEtapaService().searchMaterials(
      ProcessoEtapaSearchMaterialsDTO(codEtapaProcesso: id),
    );
    loading.closeDefault();
    return result?.$2.materiais ?? [];
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Tipo de Processo que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
