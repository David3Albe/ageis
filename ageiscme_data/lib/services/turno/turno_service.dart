import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/turno/query/turno_query_dto.dart';
import 'package:ageiscme_models/dto/turno/query_one/turno_query_one_dto.dart';
import 'package:ageiscme_models/dto/turno/remove/turno_remove_dto.dart';
import 'package:ageiscme_models/dto/turno/save/turno_save_dto.dart';
import 'package:ageiscme_models/dto/turno/short/turno_short_dto.dart';
import 'package:ageiscme_models/response_dto/turno/query/turno_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/remove/turno_remove_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/save/turno_save_response_dto.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';

class TurnoService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/turno/';

  TurnoService();

  Future<(String, TurnoQueryResponseDTO)?> query({
    required TurnoQueryDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query',
        dto,
        (json) => TurnoQueryResponseDTO.fromJson(json),
      );

  Future<(String, TurnoSaveDTO)?> queryOne({
    required TurnoQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => TurnoSaveDTO.fromJson(json),
      );

  Future<(String message, TurnoSaveResponseDTO response)?> save(
    TurnoSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => TurnoSaveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, TurnoRemoveResponseDTO sigla)?> delete(
    TurnoRemoveDTO obj,
  ) async {
    return await _client.delete(
      BASE_URL,
      obj,
      (dynamic json) => TurnoRemoveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, List<TurnoShortResponseDTO> response)?> short(
    TurnoShortDTO obj,
  ) async {
    return await _client.post(
      BASE_URL + 'short',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => TurnoShortResponseDTO.fromJson(e))
          .toList(),
    );
  }
}
