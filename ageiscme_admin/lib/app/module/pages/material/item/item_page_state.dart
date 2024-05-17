import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemPageCubit extends Cubit<ItemPageState> {
  final ItemService service;
  ItemPageCubit({required this.service})
      : super(
          ItemPageState(
            itens: [],
            loading: false,
          ),
        );

  Future loadItemFilter(ItemFilter filter) async {
    emit(
      ItemPageState(
        loading: true,
        itens: [],
      ),
    );
    try {
      List<ItemModel>? itensModel = await service.Filter(filter);
      List<ItemModel> itens = itensModel;
      emit(
        ItemPageState(
          loading: false,
          itens: itens,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemPageState(
          loading: false,
          itens: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ItemModel item) async {
    try {
      (String, ItemModel)? result = await service.delete(item);
      if (result == null) return;

      emit(
        ItemPageState(
          loading: false,
          itens: state.itens,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemPageState(
          loading: false,
          itens: state.itens,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ItemPageState {
  final bool loading;
  final bool deleted;
  final List<ItemModel> itens;
  final String error;
  final String message;

  ItemPageState({
    required this.loading,
    required this.itens,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
