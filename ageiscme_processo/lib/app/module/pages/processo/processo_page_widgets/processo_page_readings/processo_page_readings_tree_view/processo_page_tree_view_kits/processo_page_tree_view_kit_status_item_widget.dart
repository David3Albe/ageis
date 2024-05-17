import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitStatusItemWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitStatusItemWidget(
    this.item, {
    required this.color,
  });

  final Color color;

  final ItemProcessoModel item;
  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 1920;
    (double, double?) escalaHeight = context.select(
      (ProcessoLeituraCubit cubit) => (
        cubit.state.processo.getEscala(),
        cubit.state.processo.getLineHeightPadraoVeryBig()
      ),
    );
    return Tooltip(
      message: item.informacoesResponsavelPendenteKit ?? '',
      child: InkWell(
        onTap: () => showItem(context),
        child: Text(
          '${item.idEtiqueta} ${item.descricao}',
          style: TextStyle(
            fontSize: 14 * scale * escalaHeight.$1,
            color: color,
            height: escalaHeight.$2,
          ),
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
