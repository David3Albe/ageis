import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/escala/query_one/escala_query_one_dto.dart';
import 'package:ageiscme_models/dto/escala/save/escala_save_dto.dart';
import 'package:ageiscme_models/response_dto/escala/save/escala_save_response_dto.dart';

class EscalaService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/escala/';

  EscalaService();

  Future<(String, EscalaSaveDTO)?> queryOne({
    required EscalaQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => EscalaSaveDTO.fromJson(json),
      );

  Future<(String message, EscalaSaveResponseDTO response)?> save(
    EscalaSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => EscalaSaveResponseDTO.fromJson(json),
    );
  }
}
