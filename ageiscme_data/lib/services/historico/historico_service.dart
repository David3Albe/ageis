import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/historico/search/historico_search_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/historico_search_response_dto.dart';

class HistoricoService {
  static const _baseRoute = '/historico/';

  final CustomDio _client = CustomDio();

  HistoricoService();

  Future<(String message, HistoricoSearchResponseDTO response)?> search(
    HistoricoSearchDTO obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => HistoricoSearchResponseDTO.fromJson(json),
    );
  }
}
