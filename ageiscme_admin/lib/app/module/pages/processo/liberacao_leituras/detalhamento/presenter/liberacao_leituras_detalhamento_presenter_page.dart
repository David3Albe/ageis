import 'package:ageiscme_admin/app/module/pages/processo/liberacao_leituras/cubit/liberacao_leituras_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/liberacao_leituras/detalhamento/cubit/liberacao_leituras_detalhamento_page_cubit.dart';
import 'package:ageiscme_data/services/processo_leitura_andamento/processo_leitura_andamento_service.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class LiberacaoLeiturasDetalhamentoPresenterPage extends StatefulWidget {
  const LiberacaoLeiturasDetalhamentoPresenterPage({
    super.key,
    required this.cod,
    required this.codUsuario,
  });
  final int cod;
  final int codUsuario;

  @override
  State<LiberacaoLeiturasDetalhamentoPresenterPage> createState() =>
      _LiberacaoLeiturasDetalhamentoPresenterPageState();
}

class _LiberacaoLeiturasDetalhamentoPresenterPageState
    extends State<LiberacaoLeiturasDetalhamentoPresenterPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód Barra Kit',
      field: 'codBarraKit',
      type: CustomDataColumnType.Text,
      width: 145,
    ),
    CustomDataColumn(
      text: 'Nome kit',
      field: 'descricaoKit',
      type: CustomDataColumnType.Text,
    ),
    CustomDataColumn(
      text: 'Id Etiqueta Item',
      field: 'idEtiquetaItem',
      type: CustomDataColumnType.Text,
      width: 125,
    ),
    CustomDataColumn(
      text: 'Nome Item',
      field: 'descricaoItem',
      type: CustomDataColumnType.Text,
      width: 400,
    ),
  ];

  final LiberacaoLeiturasDetalhamentoPageCubit bloc =
      LiberacaoLeiturasDetalhamentoPageCubit(
    service: ProcessoLeituraAndamentoService(),
  );

  @override
  void initState() {
    bloc.loadLeitura(
      cod: widget.cod,
      codUsuario: widget.codUsuario,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiberacaoLeiturasDetalhamentoPageCubit,
        LiberacaoLeiturasDetalhamentoPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.loading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Usuário: ${state.data?.nomeUsuario ?? ''}'),
                const Spacer(),
                Text('Máquina: ${state.data?.maquina ?? ''}'),
                const Spacer(),
                Text(
                  'Data Início: ${state.data?.dataHora != null ? DateFormat('dd/MM/yyyy HH:mm').format(state.data!.dataHora) : ''}',
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: PlutoGridWidget(
                  columns: colunas,
                  items: state.leituras,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void onError(LiberacaoLeiturasPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}
