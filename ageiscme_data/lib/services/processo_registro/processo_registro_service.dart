import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/processo_registro/ultimo/processo_registro_ultimo_dto.dart';
import 'package:ageiscme_models/response_dto/processo_registro/ultimo/processo_registro_ultimo_response_dto.dart';

class ProcessoRegistroService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/processo-registro/';

  ProcessoRegistroService();

  Future<(String, ProcessoRegistroUltimoResponseDTO)?> ultimo(
    ProcessoRegistroUltimoDTO dto,
  ) async {
    return await _client.post(
      BASE_URL + 'ultimo',
      dto,
      (json) => ProcessoRegistroUltimoResponseDTO.fromJson(json),
    );
  }
}
