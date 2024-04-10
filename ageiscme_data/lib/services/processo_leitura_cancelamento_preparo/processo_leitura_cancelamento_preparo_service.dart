import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/processo_leitura_cancelamento_preparo/cancel/processo_leitura_cancelamento_preparo_cancel_dto.dart';
import 'package:ageiscme_models/dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/cancel/processo_leitura_cancelamento_preparo_cancel_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_response_dto.dart';

class ProcessoLeituraCancelamentoPreparoService {
  final CustomDio _client = CustomDio();

  static const String baseURL = '/processo-leitura-cancelamento-preparo/';

  ProcessoLeituraCancelamentoPreparoService();

  Future<
      (
        String message,
        ProcessoLeituraCancelamentoPreparoSearchResponseDTO leituraAndamento
      )?> search(
    ProcessoLeituraCancelamentoPreparoSearchDTO obj,
  ) async {
    return await _client.post(
      '${baseURL}search',
      obj,
      (dynamic json) =>
          ProcessoLeituraCancelamentoPreparoSearchResponseDTO.fromJson(json),
    );
  }

  Future<
      (
        String message,
        ProcessoLeituraCancelamentoPreparoCancelResponseDTO leituraAndamento
      )?> cancel(
    ProcessoLeituraCancelamentoPreparoCancelDTO obj,
  ) async {
    return await _client.post(
      '${baseURL}cancel',
      obj,
      (dynamic json) =>
          ProcessoLeituraCancelamentoPreparoCancelResponseDTO.fromJson(json),
    );
  }
}
