import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewItemWidget extends StatelessWidget {
  ProcessoPageTreeViewItemWidget({required this.item});
  final ItemProcessoModel item;
  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 1920;
    (double, double?) escalaHeight = context.select(
      (ProcessoLeituraCubit cubit) => (
        cubit.state.processo.getEscala(),
        cubit.state.processo.getLineHeightPadraoMedium()
      ),
    );
    return Align(
      alignment: Alignment.centerLeft,
      child: SelectableText(
        onTap: () => showItem(context),
        '${item.idEtiqueta} ${item.descricao}',
        style: TextStyle(
          fontSize: 14 * scale * escalaHeight.$1,
          height: escalaHeight.$2,
        ),
      ),
    );
  }

  void showItem(BuildContext context) {
    final ProcessoLeituraCubit cubit =
        BlocProvider.of<ProcessoLeituraCubit>(context);
    cubit.showItem(item);
  }
}
