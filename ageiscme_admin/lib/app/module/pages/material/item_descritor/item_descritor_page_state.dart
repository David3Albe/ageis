import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemDescritorPageCubit extends Cubit<ItemDescritorPageState> {
  final ItemDescritorService service;
  ItemDescritorPageCubit({required this.service})
      : super(
          ItemDescritorPageState(
            itensDescritor: [],
            loading: false,
          ),
        );

  void loadItemDescritor() async {
    emit(ItemDescritorPageState(loading: true, itensDescritor: []));
    try {
      List<ItemDescritorModel> itensDescritor = await service.GetAll();
      emit(
        ItemDescritorPageState(
          loading: false,
          itensDescritor: itensDescritor,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemDescritorPageState(
          loading: false,
          itensDescritor: [], 
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ItemDescritorModel itemDescritor) async {
    try {
      (String, ItemDescritorModel)? result = await service.delete(itemDescritor);
      if (result == null) return;

      emit(
        ItemDescritorPageState(
          loading: false,
          itensDescritor: state.itensDescritor,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemDescritorPageState(
          loading: false,
          itensDescritor: state.itensDescritor,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ItemDescritorPageState {
  final bool loading;
  final bool deleted;
  final List<ItemDescritorModel> itensDescritor;
  final String error;
  final String message;

  ItemDescritorPageState({
    required this.loading,
    required this.itensDescritor,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
