import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_data/services/item_consignado_processado/item_consignado_processado_service.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemConsignadoProcessadoPageCubit
    extends Cubit<ItemConsignadoProcessadoPageState> {
  final ItemConsignadoProcessadoService service;
  final ItemConsignadoProcessadoModel itemConsignadoProcessadoModel;
  ItemConsignadoProcessadoPageCubit({
    required this.service,
    required this.itemConsignadoProcessadoModel,
  }) : super(
          ItemConsignadoProcessadoPageState(
            itemConsignadoProcessado: itemConsignadoProcessadoModel,
          ),
        );

  void save(ItemConsignadoProcessadoModel itemConsignadoProcessado) async {
    try {
      (
        String message,
        ItemConsignadoProcessadoModel itemConsignadoProcessado
      )? result = await service.save(itemConsignadoProcessado);
      if (result == null) return;
      emit(
        ItemConsignadoProcessadoPageState(
          message: result.$1,
          saved: true,
          itemConsignadoProcessado: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemConsignadoProcessadoPageState(
          error: ex.toString(),
          itemConsignadoProcessado: itemConsignadoProcessado,
        ),
      );
    }
  }

  void clear() {
    emit(
      ItemConsignadoProcessadoPageState(
        itemConsignadoProcessado: ItemConsignadoProcessadoModel.empty(),
      ),
    );
  }
}

class ItemConsignadoProcessadoPageState {
  final String error;
  final bool saved;
  final String message;
  final ItemConsignadoProcessadoModel itemConsignadoProcessado;

  ItemConsignadoProcessadoPageState({
    required this.itemConsignadoProcessado,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
