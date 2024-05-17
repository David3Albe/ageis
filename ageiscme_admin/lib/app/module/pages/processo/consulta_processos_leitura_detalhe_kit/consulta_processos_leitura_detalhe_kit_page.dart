import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe_kit/widgets/legenda/legenda_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_item/consulta_processos_leitura_detalhe_kit_item_model.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConsultaProcessoLeituraDetalheKitPage extends StatefulWidget {
  ConsultaProcessoLeituraDetalheKitPage({super.key, this.filter});

  final ConsultaProcessosLeituraDetalheKitFilter? filter;

  @override
  State<ConsultaProcessoLeituraDetalheKitPage> createState() =>
      _ConsultaProcessosLeituraDetalheKitPageState();
}

class _ConsultaProcessosLeituraDetalheKitPageState
    extends State<ConsultaProcessoLeituraDetalheKitPage> {
  static Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    if ((renderContext.row.cells['situacao']?.value.toString() ?? '') ==
        'Bloqueado') {
      cor = Cores.corTextoBloqueado;
    }

    if ((renderContext.row.cells['situacao']?.value.toString() ?? '') ==
        'Liberado') {
      cor = Cores.corTextoLiberado;
    }

    if ((renderContext.row.cells['situacao']?.value.toString() ?? '') ==
        'Liberado com Restrição') {
      cor = Cores.corTextoLiberadoRestricao;
    }

    if ((renderContext.row.cells['situacao']?.value.toString() ?? '') ==
        'Pendente no Kit') {
      cor = Cores.corTextoPendente;
    }

    if ((renderContext.row.cells['situacao']?.value.toString() ?? '') ==
        'DataMatrix Danificado') {
      cor = Cores.corTextoDanificado;
    }

    return Text(
      renderContext.cell.value.toString(),
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
      ),
    );
  }

  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Item', field: 'descricaoCurta'),
    CustomDataColumn(text: 'Descritor', field: 'descritor'),
    CustomDataColumn(
      text: 'Situação',
      field: 'situacao',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(text: 'Responsável', field: 'responsavel'),
    CustomDataColumn(
      text: 'Data Hora',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(text: 'Tamanho', field: 'tamanho'),
    CustomDataColumn(text: 'Grupo', field: 'grupo'),
    CustomDataColumn(text: 'Proprietário', field: 'proprietario'),
    CustomDataColumn(text: 'Implantável', field: 'implantavel'),
    CustomDataColumn(
      text: 'Descarte',
      field: 'dataDescarte',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(text: 'Restrição', field: 'restricao'),
    CustomDataColumn(
      text: 'Cód.',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaProcessosLeituraDetalheKitPageCubit bloc;
  late final ConsultaProcessosLeituraDetalheKitService service;

  @override
  void initState() {
    service = ConsultaProcessosLeituraDetalheKitService();
    bloc = ConsultaProcessosLeituraDetalheKitPageCubit(service: service);
    bloc.loadProcessoLeituraDetalheKit(widget.filter!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultaProcessosLeituraDetalheKitPageCubit,
        ConsultaProcessosLeituraDetalheKitPageState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.error.isNotEmpty) onError(state);
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _legendItem('Bloqueado', Cores.corTextoBloqueado),
                  _legendItem('Liberado', Cores.corTextoLiberado),
                  _legendItem(
                    'Liberado com Restrições',
                    Cores.corTextoLiberadoRestricao,
                  ),
                  _legendItem('Pendente no Kit', Cores.corTextoPendente),
                  _legendItem(
                    'DataMatrix Danificado',
                    Cores.corTextoDanificado,
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (state.loading) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                    child: PlutoGridWidget<
                        ConsultaProcessosLeituraDetalheKitItemModel>(
                      smallRows: true,
                      columns: colunas,
                      items: state.kit?.itens ?? [],
                    ),
                  ),
                );
              },
            ),
            LegendaWidget(kit: state.kit),
          ],
        );
      },
    );
  }

  Widget _legendItem(String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void onError(ConsultaProcessosLeituraDetalheKitPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);
}
