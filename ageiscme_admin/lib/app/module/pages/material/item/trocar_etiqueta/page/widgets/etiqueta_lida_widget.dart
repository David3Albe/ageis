import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_lida_cubit.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EtiquetaLidaWidget extends StatelessWidget {
  const EtiquetaLidaWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    String? str = context.watch<EtiquetaLidaCubit>().state.str;
    if (str == null) {
      return const Center(
        child: LoadingWidget(),
      );
    }
    return Text(
      'Etiqueta lida: $str',
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
