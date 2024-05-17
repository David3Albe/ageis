import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/item_inserir_rapido_search_response_dto.dart';

class SearchState {
  bool loading;
  ItemInserirRapidoSearchResponseDTO? response;

  SearchState({
    this.response,
    this.loading = false,
  });
}
