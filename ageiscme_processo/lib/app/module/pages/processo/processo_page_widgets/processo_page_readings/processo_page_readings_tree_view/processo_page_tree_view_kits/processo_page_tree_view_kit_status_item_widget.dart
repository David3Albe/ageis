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
    return Tooltip(
      message: item.informacoesResponsavelPendenteKit ?? '',
      child: SelectableText(
      onTap: () => showItem(context),
        '${item.idEtiqueta} ${item.descricao}',
        style: TextStyle(
          fontSize: 16 * scale,
          color: color,
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
