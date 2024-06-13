import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/gerar_licenca/gerar_licenca_dto.dart';
import 'package:ageiscme_models/response_dto/gerar_licenca/gerar_licenca_response_dto.dart';

class GerarLicencaService {
  final CustomDio _client = CustomDio();
  static const String BASE_URL = '/gerar-licenca/';

  GerarLicencaService();

  Future<(String message, GerarLicencaResponseDTO gestaoContrato)?> gerar(
    GerarLicencaDTO obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => GerarLicencaResponseDTO.fromJson(json),
    );
  }
}
