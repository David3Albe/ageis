import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/item/save/item_save_dto.dart';
import 'package:ageiscme_models/dto/item_save_result/item_save_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemPageFrmCubit extends Cubit<ItemPageFrmState> {
  final ItemService service;
  final ItemModel itemModel;
  ItemPageFrmCubit({
    required this.service,
    required this.itemModel,
  }) : super(
          ItemPageFrmState(item: itemModel),
        );

  Future<(String,ItemSaveResultDTO)?> save(ItemSaveDTO item) async {
    try {
      bool novo = item.item.cod == null || item.item.cod == 0;
      (String message, ItemSaveResultDTO item)? result =
          await service.save(item);
      if (result == null) return null;

      emit(
        ItemPageFrmState(
          message: result.$1,
          saved: true,
          impressaoConsignado: result.$2.impressaoConsignado,
          item: result.$2.item,
          novo: novo,
        ),
      );
      return result;
    } on Exception catch (ex) {
      emit(
        ItemPageFrmState(
          error: ex.toString(),
          item: item.item,
        ),
      );
    }
    return null;
  }

  void clear() {
    emit(ItemPageFrmState(item: ItemModel.empty()));
  }
}

class ItemPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ItemModel item;
  final String? impressaoConsignado;
  final bool novo;

  ItemPageFrmState({
    required this.item,
    this.error = '',
    this.saved = false,
    this.message = '',
    this.impressaoConsignado,
    this.novo = false,
  });
}
