import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/consulta_registro_servico/consulta_registro_servico_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/registro_servico/consulta_registro_servico_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/registro_servico/registro_servico_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/registro_servico/consulta_registro_servico_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
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

class ConsultaRegistroServicoPage extends StatefulWidget {
  const ConsultaRegistroServicoPage({super.key});

  @override
  State<ConsultaRegistroServicoPage> createState() =>
      _ConsultaRegistroServicoPageState();
}

class _ConsultaRegistroServicoPageState
    extends State<ConsultaRegistroServicoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Data Início',
      field: 'dataInicio',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Data Término',
      field: 'dataTermino',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Tipo Serviço',
      field: 'servicoTipo',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Equipamento',
      field: 'equipamento',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'ID Etiqueta',
      field: 'item',
      valueConverter: (value) => value == null ? '' : value['idEtiqueta'],
    ),
    CustomDataColumn(
      text: 'Item',
      field: 'item',
      calculatedField: 'itemDescricao',
      valueConverter: (value) => value == null ? '' : value['descricao'],
    ),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Temperatura',
      field: 'temperatura',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Temperatura Máx.',
      field: 'temperaturaMax',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Temperatura Min.',
      field: 'temperaturaMin',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Umidade',
      field: 'umidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Umidade Máx.',
      field: 'umidadeMax',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Umidade Min.',
      field: 'umidadeMin',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Resultado',
      field: 'resultado',
      valueConverter: (dynamic value) =>
          RegistroServicoResultOption.getOpcaoFromId(value),
    ),
    CustomDataColumn(
      text: 'Resp. Registro',
      field: 'usuario',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(text: 'Desc. Resultado', field: 'indicador'),
    CustomDataColumn(
      text: 'Data Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  late final ConsultaRegistroServicoPageCubit bloc;
  late final EquipamentoCubit equipamentoBloc;
  late final ServicoTipoCubit servicoTipoBloc;
  late final ConsultaRegistroServicoFilter filter;
  late final RegistroServicoService service;

  @override
  void initState() {
    bloc = ConsultaRegistroServicoPageCubit(
      service: ConsultaRegistroServicoService(),
    );
    filter = ConsultaRegistroServicoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    equipamentoBloc = EquipamentoCubit();
    equipamentoBloc.loadAll();
    servicoTipoBloc = ServicoTipoCubit();
    servicoTipoBloc.loadAll();

    service = RegistroServicoService();
    bloc.loadRegistroServico(filter);
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
              onPressed: () => bloc.loadRegistroServico(filter),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaRegistroServicoPageCubit,
            ConsultaRegistroServicoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaRegistroServicoPageCubit,
              ConsultaRegistroServicoPageState>(
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
                    orderDescendingFieldColumn: 'dataInicio',
                    smallRows: true,
                    columns: colunas,
                    items: state.registrosServicos,
                    onDetail: (event, obj) async {
                      var isUserValidConsulta =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.ServicosRegistrosConsulta,
                      );

                      if (isUserValidConsulta == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await getFilter(obj.cod!).then((doc) {
                        if (doc != null) {
                          openModalRedirect(context, obj.cod!);
                        }
                      });
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

  void onError(ConsultaRegistroServicoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            DatePickerWidget(
              placeholder: 'Data Início',
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
            BlocBuilder<EquipamentoCubit, EquipamentoState>(
              bloc: equipamentoBloc,
              builder: (context, equipamentoState) {
                if (equipamentoState.loading) {
                  return const LoadingWidget();
                }
                List<EquipamentoModel> equipamentos = equipamentoState.objs;
                equipamentos.sort(
                  (a, b) => a.nome!.compareTo(b.nome!),
                );
                EquipamentoModel? equipamento = equipamentos
                    .where(
                      (element) => element.cod == filter.codEquipamento,
                    )
                    .firstOrNull;
                return DropDownSearchWidget(
                  textFunction: (equipamento) =>
                      equipamento.EquipamentoNomeText(),
                  initialValue: equipamento,
                  sourceList: equipamentos
                      .where((element) => element.ativo == true)
                      .toList(),
                  onChanged: (value) => filter.codEquipamento = value?.cod,
                  placeholder: 'Equipamento',
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
            BlocBuilder<ServicoTipoCubit, ServicoTipoState>(
              bloc: servicoTipoBloc,
              builder: (context, state) {
                List<ServicoTipoModel> servicosTipos = state.tiposServico;

                servicosTipos.sort(
                  (a, b) => a.nome!.compareTo(b.nome!),
                );
                ServicoTipoModel? servicoTipo = servicosTipos
                    .where(
                      (element) => element.cod == filter.codServicoTipo,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<ServicoTipoModel>(
                  textFunction: (servicoTipo) =>
                      servicoTipo.ServicoTipoNomeText(),
                  initialValue: servicoTipo,
                  sourceList: servicosTipos
                      .where((element) => element.ativo == true)
                      .toList(),
                  onChanged: (value) => filter.codServicoTipo = value?.cod,
                  placeholder: 'Tipo de Serviço',
                );
              },
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadRegistroServico(filter);
  }

  Future<RegistroServicoModel?> getFilter(int cod) async {
    return service.FilterOne(
      RegistroServicoFilter(cod: cod, carregarUsuario: true),
    );
  }

  Future openModalRedirect(
    BuildContext context,
    int cod,
  ) async {
    LoadingController loading = LoadingController(context: context);

    RegistroServicoModel? servico;
    servico = await getFilter(cod);
    if (servico == null) {
      loading.close(context, mounted);
      notFoundError();
      return;
    }
    loading.close(context, mounted);
    late int chave;
    int codigo = cod;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: codigo.toString(),
      title: 'Cadastro/Edição Equipamento',
      widget: RegistroServicoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        equipamentoCubit: equipamentoBloc,
        itemFilter: ItemFilter(),
        registroServico: servico,
      ),
    );
  }

  void onSaved(String message, int chave) {
    ToastUtils.showCustomToastSucess(context, message);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Serviço que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}
