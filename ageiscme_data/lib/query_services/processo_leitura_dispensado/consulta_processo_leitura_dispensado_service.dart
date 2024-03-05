import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_dispensado/consulta_processos_leitura_dispensado_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_dispensado/consulta_processos_leitura_dispensado_model.dart';

class ConsultaProcessoLeituraDispensadoService {
  final CustomDio _client = CustomDio();

  ConsultaProcessoLeituraDispensadoService();

  Future<(String message, List<ConsultaProcessosLeituraDispensadoModel> items)?>
      filter(
    ConsultaProcessosLeituraDispensadoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processos-leitura-dispensado',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraDispensadoModel.fromJson(e))
          .toList(),
    );
  }
}
