import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/query/anormalidade_tipo_query_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/query_one/anormalidade_tipo_query_one_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/remove/anormalidade_tipo_remove_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/save/anormalidade_tipo_save_dto.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/short/anormalidade_tipo_short_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/query/anormalidade_tipo_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/remove/anormalidade_tipo_remove_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/save/anormalidade_tipo_save_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';

class AnormalidadeTipoService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/anormalidade-tipo/';

  AnormalidadeTipoService();

  Future<(String, AnormalidadeTipoQueryResponseDTO)?> query({
    required AnormalidadeTipoQueryDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query',
        dto,
        (json) => AnormalidadeTipoQueryResponseDTO.fromJson(json),
      );

  Future<(String, AnormalidadeTipoSaveDTO)?> queryOne({
    required AnormalidadeTipoQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => AnormalidadeTipoSaveDTO.fromJson(json),
      );

  Future<(String message, AnormalidadeTipoSaveResponseDTO response)?> save(
    AnormalidadeTipoSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => AnormalidadeTipoSaveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, AnormalidadeTipoRemoveResponseDTO arsenalEstoque)?>
      delete(
    AnormalidadeTipoRemoveDTO obj,
  ) async {
    return await _client.delete(
      BASE_URL,
      obj,
      (dynamic json) => AnormalidadeTipoRemoveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, List<AnormalidadeTipoShortResponseDTO> response)?>
      short(
    AnormalidadeTipoShortDTO obj,
  ) async {
    return await _client.post(
      BASE_URL + 'short',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => AnormalidadeTipoShortResponseDTO.fromJson(e))
          .toList(),
    );
  }
}
