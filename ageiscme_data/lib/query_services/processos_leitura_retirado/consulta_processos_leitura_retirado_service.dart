import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirado/consulta_processos_leitura_retirado_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_retirado/consulta_processos_leitura_retirado_model.dart';

class ConsultaProcessosLeituraRetiradoService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraRetiradoService();

  Future<(String message, List<ConsultaProcessosLeituraRetiradoModel> items)?>
      filter(
    ConsultaProcessosLeituraRetiradoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processos-leitura-retirado',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraRetiradoModel.fromJson(e))
          .toList(),
    );
  }
}
