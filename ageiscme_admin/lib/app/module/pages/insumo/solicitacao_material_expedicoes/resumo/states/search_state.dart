
import 'package:ageiscme_models/response_dto/solicitacao_material/search/solicitacao_material_search_response_dto.dart';

class SearchState {
  bool? loading;
  SolicitacaoMaterialSearchResponseDTO? response;

  SearchState({
    this.loading,
    this.response,
  });
}
