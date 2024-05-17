import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/item/item_etiqueta/item_etiqueta_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_response/item_etiqueta_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemEtiquetasPageCubit extends Cubit<ItemEtiquetasPageState> {
  final ItemService service;
  ItemEtiquetasPageCubit({required this.service})
      : super(
          ItemEtiquetasPageState(
            idEtiquetaFind: null,
            item: null,
            loading: false,
          ),
        );

  void loadEtiquetasFilter(ItemEtiquetaDTO dto) async {
    emit(
      ItemEtiquetasPageState(
        idEtiquetaFind: state.idEtiquetaFind,
        loading: true,
        item: null,
      ),
    );
    try {
      ItemEtiquetaResponseDTO? item = await service.getItensEtiquetas(dto: dto);
      emit(
        ItemEtiquetasPageState(
          idEtiquetaFind: state.idEtiquetaFind,
          loading: false,
          item: item,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ItemEtiquetasPageState(
          idEtiquetaFind: state.idEtiquetaFind,
          loading: false,
          item: null,
          error: ex.toString(),
        ),
      );
    }
  }

  void setEtiqueta(String? etiqueta) {
    emit(
      ItemEtiquetasPageState(
        loading: false,
        item: state.item,
        idEtiquetaFind: etiqueta,
      ),
    );
  }
}

class ItemEtiquetasPageState {
  final bool loading;
  final ItemEtiquetaResponseDTO? item;
  final String error;
  final String message;
  String? idEtiquetaFind;

  ItemEtiquetasPageState({
    required this.loading,
    required this.item,
    required this.idEtiquetaFind,
    this.error = '',
    this.message = '',
  });
}
