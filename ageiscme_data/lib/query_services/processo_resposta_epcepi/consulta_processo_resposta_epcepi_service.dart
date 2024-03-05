import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processo_resposta_epcepi/consulta_processo_resposta_epcepi_filter.dart';
import 'package:ageiscme_models/query_models/processo_resposta_epcepi/consulta_processo_resposta_epcepi_model.dart';

class ConsultaProcessoRespostaEPCEPIService {
  final CustomDio _client = CustomDio();

  ConsultaProcessoRespostaEPCEPIService();

  Future<(String message, List<ConsultaProcessoRespostaEPCEPIModel> items)?>
      filter(
    ConsultaProcessoRespostaEPCEPIFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-resposta-ecp-epi',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessoRespostaEPCEPIModel.fromJson(e))
          .toList(),
    );
  }
}
