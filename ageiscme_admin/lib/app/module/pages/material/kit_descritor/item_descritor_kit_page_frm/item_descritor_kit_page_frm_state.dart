import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:ageiscme_data/services/item_descritor_kit/item_descritor_kit_service.dart';

class ItemDescritorKitPageFrmCubit extends Cubit<ItemDescritorKitPageFrmState> {
  final ItemDescritorKitService service;
  final ItemDescritorKitModel itemDescritorKitModel;
  ItemDescritorKitPageFrmCubit({
    required this.service,
    required this.itemDescritorKitModel,
  }) : super(
          ItemDescritorKitPageFrmState(itemDescritorKit: itemDescritorKitModel),
        );

  Future save(ItemDescritorKitModel itemDescritorKit) async {
    try {
      (String message, ItemDescritorKitModel itemDescritorKit)? result =
          await service.save(itemDescritorKit);
      if (result == null) return;
      emit(
        ItemDescritorKitPageFrmState(
          message: result.$1,
          saved: true,
          itemDescritorKit: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemDescritorKitPageFrmState(
          error: ex.toString(),
          itemDescritorKit: itemDescritorKit,
        ),
      );
    }
  }

  void clear() {
    emit(
      ItemDescritorKitPageFrmState(
        itemDescritorKit: ItemDescritorKitModel.empty(),
      ),
    );
  }
}

class ItemDescritorKitPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ItemDescritorKitModel itemDescritorKit;

  ItemDescritorKitPageFrmState({
    required this.itemDescritorKit,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
