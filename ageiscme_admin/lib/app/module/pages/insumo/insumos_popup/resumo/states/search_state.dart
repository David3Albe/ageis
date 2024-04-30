
import 'package:ageiscme_models/response_dto/insumo/expirar/insumo_expirar_search_response_dto.dart';

class SearchState {
  bool? loading;
  List<InsumoExpirarSearchResponseDTO>? insumos;

  SearchState({
    this.loading,
    this.insumos,
  });
}
