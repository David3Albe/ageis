import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/anormalidade/liberar/anormalidade_liberar_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/query/anormalidade_query_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/query_one/anormalidade_query_one_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/remove/anormalidade_remove_dto.dart';
import 'package:ageiscme_models/dto/anormalidade/save/anormalidade_save_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/liberar/anormalidade_liberar_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/query/anormalidade_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/remove/anormalidade_remove_response_dto.dart';
import 'package:ageiscme_models/response_dto/anormalidade/save/anormalidade_save_response_dto.dart';

class AnormalidadeService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/anormalidade/';

  AnormalidadeService();

  Future<(String, AnormalidadeQueryResponseDTO)?> query({
    required AnormalidadeQueryDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query',
        dto,
        (json) => AnormalidadeQueryResponseDTO.fromJson(json),
      );

  Future<(String, AnormalidadeSaveDTO)?> queryOne({
    required AnormalidadeQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => AnormalidadeSaveDTO.fromJson(json),
      );

  Future<(String message, AnormalidadeSaveResponseDTO response)?> save(
    AnormalidadeSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => AnormalidadeSaveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, AnormalidadeLiberarResponseDTO response)?> liberar(
    AnormalidadeLiberarDTO obj,
  ) async {
    return await _client.post(
      BASE_URL + 'liberar',
      obj,
      (dynamic json) => AnormalidadeLiberarResponseDTO.fromJson(json),
    );
  }

  Future<(String message, AnormalidadeRemoveResponseDTO response)?> delete(
    AnormalidadeRemoveDTO obj,
  ) async {
    return await _client.delete(
      BASE_URL,
      obj,
      (dynamic json) => AnormalidadeRemoveResponseDTO.fromJson(json),
    );
  }
}
