import 'package:ageiscme_admin/app/module/pages/colaborador/consulta_historico_colaborador/consulta_historico_colaborador_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/historico_colaborador/consulta_historico_colaborador_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/query_filters/historico_colaborador/consulta_historico_colaborador_filter.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaHistoricoColaboradorPage extends StatefulWidget {
  ConsultaHistoricoColaboradorPage({super.key});

  @override
  State<ConsultaHistoricoColaboradorPage> createState() =>
      _ConsultaHistoricoColaboradorPageState();
}

class _ConsultaHistoricoColaboradorPageState
    extends State<ConsultaHistoricoColaboradorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Código',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Colaborador', field: 'colaborador'),
    CustomDataColumn(text: 'Tipo', field: 'tipo'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(text: 'Detalhe', field: 'detalhe'),
  ];

  late final ConsultaHistoricoColaboradorPageCubit bloc;
  late final ConsultaHistoricoColaboradorFilter filter;

  @override
  void initState() {
    bloc = ConsultaHistoricoColaboradorPageCubit(
      service: ConsultaHistoricoColaboradorService(),
    );
    filter = ConsultaHistoricoColaboradorFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();

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
        BlocListener<ConsultaHistoricoColaboradorPageCubit,
            ConsultaHistoricoColaboradorPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaHistoricoColaboradorPageCubit,
              ConsultaHistoricoColaboradorPageState>(
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
                    items: state.historicosColaboradores,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaHistoricoColaboradorPageState state) =>
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
              DropDownSearchApiWidget<UsuarioDropDownSearchResponseDTO>(
                search: (str) async =>
                    (await UsuarioService().getDropDownSearch(
                      UsuarioDropDownSearchDTO(
                        numeroRegistros: 30,
                        search: str,
                      ),
                    ))
                        ?.$2 ??
                    [],
                textFunction: (usuario) => usuario.CodBarraNome(),
                initialValue: filter.usuario,
                onChanged: (value) {
                  filter.codUsuario = value?.cod;
                  filter.usuario = value;
                },
                placeholder: 'Usuário',
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadHistoricoColaborador(filter);
      }
    });
  }
}
