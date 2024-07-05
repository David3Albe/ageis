import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';

class DetailedState {
  HistoricoSearchItemResponseDTO? item;
  HistoricoSearchItemResponseDTO? itemSuperior;

  DetailedState({
    required this.item,
    required this.itemSuperior,
  });
}
