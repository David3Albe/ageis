import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/trocar_etiqueta_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/states/etiqueta_lida_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EtiquetaLidaCubit extends Cubit<EtiquetaLidaState> {
  EtiquetaLidaCubit() : super(EtiquetaLidaState());

  Future setEtiqueta(String? str, BuildContext context) async {
    if (str == 'Cancelar') {
      Navigator.of(context).pop((false, '', null));
      return;
    }
    if (str == 'Confirmar') {
      await context.read<TrocarEtiquetaCubit>().trocarEtiqueta(context);
      return;
    }
    emit(EtiquetaLidaState(str: str));
  }
}
