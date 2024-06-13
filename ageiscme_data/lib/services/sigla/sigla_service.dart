import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/sigla/query/sigla_query_dto.dart';
import 'package:ageiscme_models/dto/sigla/query_one/sigla_query_one_dto.dart';
import 'package:ageiscme_models/dto/sigla/remove/sigla_remove_dto.dart';
import 'package:ageiscme_models/dto/sigla/save/sigla_save_dto.dart';
import 'package:ageiscme_models/dto/sigla/short/sigla_short_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/query/sigla_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/remove/sigla_remove_response_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/save/sigla_save_response_dto.dart';
import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';

class SiglaService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/sigla/';

  SiglaService();

  Future<(String, SiglaQueryResponseDTO)?> query({
    required SiglaQueryDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query',
        dto,
        (json) => SiglaQueryResponseDTO.fromJson(json),
      );

  Future<(String, SiglaSaveDTO)?> queryOne({
    required SiglaQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => SiglaSaveDTO.fromJson(json),
      );

  Future<(String message, SiglaSaveResponseDTO response)?> save(
    SiglaSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => SiglaSaveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, SiglaRemoveResponseDTO sigla)?>
      delete(
    SiglaRemoveDTO obj,
  ) async {
    return await _client.delete(
      BASE_URL,
      obj,
      (dynamic json) => SiglaRemoveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, List<SiglaShortResponseDTO> response)?>
      short(
    SiglaShortDTO obj,
  ) async {
    return await _client.post(
      BASE_URL + 'short',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => SiglaShortResponseDTO.fromJson(e))
          .toList(),
    );
  }
}
