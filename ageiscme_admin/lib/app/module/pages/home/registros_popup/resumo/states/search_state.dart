
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';

class SearchState {
  bool? loading;
  List<RegistrosExpirarSearchResponseDTO>? registros;

  SearchState({
    this.loading,
    this.registros,
  });
}
