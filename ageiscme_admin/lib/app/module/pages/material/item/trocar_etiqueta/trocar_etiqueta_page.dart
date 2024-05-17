import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_base_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_lida_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/trocar_etiqueta_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/page/trocar_etiqueta_page_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/states/etiqueta_base_state.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TrocarEtiquetaPage extends StatelessWidget {
  const TrocarEtiquetaPage({required this.item, super.key});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EtiquetaBaseCubit(
            EtiquetaBaseState(
              idEtiquetaBase: item.idEtiqueta!,
              codItem: item.cod!,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => EtiquetaLidaCubit(),
        ),
        BlocProvider(
          create: (context) => TrocarEtiquetaCubit(),
        ),
      ],
      child: const TrocarEtiquetaPageWidget(),
    );
  }
}
