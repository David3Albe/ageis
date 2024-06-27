import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemDescritorPageFrmCubit extends Cubit<ItemDescritorPageFrmState> {
  final ItemDescritorService service;
  final ItemDescritorModel itemDescritorModel;
  ItemDescritorPageFrmCubit({
    required this.service,
    required this.itemDescritorModel,
  }) : super(
          ItemDescritorPageFrmState(itemDescritor: itemDescritorModel),
        );

  void save(
    ItemDescritorModel itemDescritor,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ItemDescritorModel itemDescritor)? result =
          await service.save(itemDescritor);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ItemDescritorPageFrmState(
          message: result.$1,
          saved: true,
          itemDescritor: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemDescritorPageFrmState(
          error: ex.toString(),
          itemDescritor: itemDescritor,
        ),
      );
    }
  }

  void clear() {
    emit(ItemDescritorPageFrmState(itemDescritor: ItemDescritorModel.empty()));
  }
}

class ItemDescritorPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ItemDescritorModel itemDescritor;

  ItemDescritorPageFrmState({
    required this.itemDescritor,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
