import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/acao_ocorrencia/acao_ocorrencia_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_acao_ocorrencia/processos_leitura_acao_ocorrencia_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_filter.dart';
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

class ConsultaProcessosLeituraAcaoOcorrenciaPage extends StatefulWidget {
  const ConsultaProcessosLeituraAcaoOcorrenciaPage({super.key});

  @override
  State<ConsultaProcessosLeituraAcaoOcorrenciaPage> createState() =>
      _ConsultaProcessosLeituraAcaoOcorrenciaPageState();
}

class _ConsultaProcessosLeituraAcaoOcorrenciaPageState
    extends State<ConsultaProcessosLeituraAcaoOcorrenciaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
      width: 130,
    ),
    CustomDataColumn(text: 'Cód. kit', field: 'codBarraKit'),
    CustomDataColumn(text: 'Kit', field: 'nomeKit'),
    CustomDataColumn(text: 'Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Item', field: 'descricaoItem'),
    CustomDataColumn(text: 'Proprietario', field: 'nomeProprietario'),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Equipamento', field: 'nomeEquipamento'),
    CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
    CustomDataColumn(text: 'Tipo Processo', field: 'nomeTipoProcesso'),
    CustomDataColumn(text: 'Prioridade', field: 'prioridade'),
    CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
    CustomDataColumn(text: 'Usuário Liberação', field: 'nomeUsuarioLiberacao'),
    CustomDataColumn(text: 'Prontuário', field: 'prontuario'),
    CustomDataColumn(text: 'Origem', field: 'origem'),
    CustomDataColumn(text: 'Destino', field: 'destino'),
    CustomDataColumn(text: 'Circulante', field: 'circulante'),
    CustomDataColumn(text: 'Conf. Visual', field: 'confVisual'),
    CustomDataColumn(
      text: 'Resp. Lib. Kit Icompleto',
      field: 'nomeRespKitIncomp',
    ),
    CustomDataColumn(
      text: 'Resp. Lib. Quebra Fluxo',
      field: 'nomeRespQuebFluxo',
    ),
    CustomDataColumn(text: 'Indicador', field: 'indicador'),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(text: 'Embalagem', field: 'embalagem'),
    CustomDataColumn(
      text: 'Cód. Item',
      field: 'codItem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Cód. Kit 1',
      field: 'codKit',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Cód. Etapa Processo',
      field: 'codEtapaProcesso',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Cód. Leitura',
      field: 'codLeitura',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Motivo', field: 'motivo'),
    CustomDataColumn(text: 'Motivo Quebra Fluxo', field: 'motivoQuebraFluxo'),
    CustomDataColumn(text: 'Ação Ocorrência', field: 'acaoOcorrencia'),
    CustomDataColumn(text: 'Tipo Ação Ocorrência', field: 'tipoAcaoOcorrencia'),
    CustomDataColumn(text: 'Observações', field: 'observacao'),
  ];

  late final ConsultaProcessosLeituraAcaoOcorrenciaPageCubit bloc;
  late final ConsultaProcessosLeituraAcaoOcorrenciaFilter filter;
  late final AcaoOcorrenciaCubit acaoOcorrenciaBloc;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraAcaoOcorrenciaPageCubit(
      service: ConsultaProcessosLeituraAcaoOcorrenciaService(),
    );
    filter = ConsultaProcessosLeituraAcaoOcorrenciaFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    acaoOcorrenciaBloc = AcaoOcorrenciaCubit();
    acaoOcorrenciaBloc.loadAll();
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
        BlocListener<ConsultaProcessosLeituraAcaoOcorrenciaPageCubit,
            ConsultaProcessosLeituraAcaoOcorrenciaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraAcaoOcorrenciaPageCubit,
              ConsultaProcessosLeituraAcaoOcorrenciaPageState>(
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
                    orderDescendingFieldColumn: 'dataHora',
                    smallRows: true,
                    columns: colunas,
                    items: state.acoesOcorrencias,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraAcaoOcorrenciaPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
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
            BlocBuilder<AcaoOcorrenciaCubit, List<AcaoOcorrenciaModel>>(
              bloc: acaoOcorrenciaBloc,
              builder: (context, acoes) {
                acoes.sort(
                  (a, b) => a.descricao!.compareTo(b.descricao!),
                );
                AcaoOcorrenciaModel? acao = acoes
                    .where(
                      (element) => element.cod == filter.codAcaoOcorrencia,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<AcaoOcorrenciaModel>(
                  textFunction: (acao) => acao.AcaoOcorrenciaDescricaoText(),
                  initialValue: acao,
                  sourceList:
                      acoes.where((element) => element.ativo == true).toList(),
                  onChanged: (value) => filter.codAcaoOcorrencia = value?.cod,
                  placeholder: 'Ação Ocorrência',
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            DropDownSearchApiWidget<UsuarioDropDownSearchResponseDTO>(
              search: (str) async =>
                  (await UsuarioService().getDropDownSearch(
                    UsuarioDropDownSearchDTO(
                      numeroRegistros: 30,
                      search: str,
                      apenasAtivos: true,
                    ),
                  ))
                      ?.$2 ??
                  [],
              textFunction: (usuario) => usuario.NomeText(),
              initialValue: filter.usuarioAcao,
              onChanged: (value) {
                filter.codUsuarioAcao = value?.cod;
                filter.usuarioAcao = value;
              },
              placeholder: 'Usuário Ação',
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            DropDownSearchApiWidget<UsuarioDropDownSearchResponseDTO>(
              search: (str) async =>
                  (await UsuarioService().getDropDownSearch(
                    UsuarioDropDownSearchDTO(
                      numeroRegistros: 30,
                      search: str,
                      apenasColaboradores: true,
                      apenasAtivos: true,
                    ),
                  ))
                      ?.$2 ??
                  [],
              textFunction: (usuario) => usuario.NomeText(),
              initialValue: filter.usuarioAutorizacao,
              onChanged: (value) {
                filter.codUsuarioAutorizacao = value?.cod;
                filter.usuarioAutorizacao = value;
              },
              placeholder: 'Usuário Autorização',
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadAcaoOcorrencia(filter);
  }
}
