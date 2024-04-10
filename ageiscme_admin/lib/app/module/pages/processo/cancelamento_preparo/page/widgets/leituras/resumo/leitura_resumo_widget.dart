import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/selected_cubit.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LeituraResumoWidget extends StatelessWidget {
  const LeituraResumoWidget({required this.leitura});
  final ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO leitura;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.blue[100],
      selected: leitura == context.watch<SelectedCubit>().state.leitura,
      onTap: () {
        context.read<SelectedCubit>().select(leitura);
      },
      title: Text(leitura.codBarraItem ?? leitura.codBarraKit!),
    );
  }
}
