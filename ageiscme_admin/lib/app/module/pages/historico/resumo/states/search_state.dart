
import 'package:ageiscme_models/response_dto/historico/search/historico_search_response_dto.dart';

class SearchState {
  bool? loading;
  HistoricoSearchResponseDTO? response;

  SearchState({
    this.loading,
    this.response,
  });
}
