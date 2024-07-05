import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/query/atestado_saude_ocupacional_exame_query_dto.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/query_one/atestado_saude_ocupacional_exame_query_one_dto.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/remove/atestado_saude_ocupacional_exame_remove_dto.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_dto.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/query/atestado_saude_ocupacional_exame_query_response_dto.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/remove/atestado_saude_ocupacional_exame_remove_response_dto.dart';
import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_response_dto.dart';

class AtestadoSaudeOcupacionalExameService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/atestado-saude-ocupacional-exame/';

  AtestadoSaudeOcupacionalExameService();

  Future<(String, AtestadoSaudeOcupacionalExameQueryResponseDTO)?> query({
    required AtestadoSaudeOcupacionalExameQueryDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query',
        dto,
        (json) => AtestadoSaudeOcupacionalExameQueryResponseDTO.fromJson(json),
      );

  Future<(String, AtestadoSaudeOcupacionalExameSaveDTO)?> queryOne({
    required AtestadoSaudeOcupacionalExameQueryOneDTO dto,
  }) async =>
      await _client.post(
        BASE_URL + 'query-one',
        dto,
        (json) => AtestadoSaudeOcupacionalExameSaveDTO.fromJson(json),
      );

  Future<(String message, AtestadoSaudeOcupacionalExameSaveResponseDTO response)?> save(
    AtestadoSaudeOcupacionalExameSaveDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => AtestadoSaudeOcupacionalExameSaveResponseDTO.fromJson(json),
    );
  }

  Future<(String message, AtestadoSaudeOcupacionalExameRemoveResponseDTO response)?> delete(
    AtestadoSaudeOcupacionalExameRemoveDTO obj,
  ) async {
    return await _client.delete(
      BASE_URL,
      obj,
      (dynamic json) => AtestadoSaudeOcupacionalExameRemoveResponseDTO.fromJson(json),
    );
  }
}
