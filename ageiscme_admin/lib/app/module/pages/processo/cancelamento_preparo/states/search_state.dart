

import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_response_dto.dart';

class SearchState {
  bool? loading;
  ProcessoLeituraCancelamentoPreparoSearchResponseDTO? response;

  SearchState({
    this.loading,
    this.response,
  });
}
