import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:flutter/material.dart';

class KitPageFrmAdicionarItemController extends ChangeNotifier {
  final BuildContext context;
  late final List<ItemModel> itens;

  FocusNode textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: (str) => onRead(str, context),
  );

  KitPageFrmAdicionarItemController({
    required this.context,
    required this.itens,
  });

  void cancelarAdicao(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  void confirmarLeituras(BuildContext context) {
    Navigator.of(context).pop(itens);
  }

  void removeItem(int cod) {
    itens.removeWhere((element) => element.cod == cod);
  }

  Future onRead(String barCode, BuildContext context) async {
    if (barCode == 'Cancelar') {
      cancelarAdicao(context);
      return;
    } else if (barCode == 'Confirmar') {
      confirmarLeituras(context);
      return;
    }
    ItemModel? item =
        await ItemService().FilterOne(ItemFilter(iDEtiqueta: barCode));

    if (item == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item com etiqueta $barCode não encontrado!',
      );
      return;
    }
    if (item.idEtiqueta!.startsWith('Z')) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item rotulado não pode ser adicionado a um Kit!',
      );
      return;
    }
    if (item.dataDescarte != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item está descartado e não pode ser adicionado!',
      );
      return;
    }
    if (item.codKit != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item lido já possui um kit vinculado!',
      );
      return;
    }
    itens.add(item);
    notifyListeners();
  }
}
