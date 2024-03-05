import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido/consulta_processos_leitura_devolvido_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_devolvido/consulta_processos_leitura_devolvido_model.dart';

class ConsultaProcessosLeituraDevolvidoService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraDevolvidoService();

  Future<(String message, List<ConsultaProcessosLeituraDevolvidoModel> items)?>
      filter(
    ConsultaProcessosLeituraDevolvidoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-devolvido',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraDevolvidoModel.fromJson(e))
          .toList(),
    );
  }
}
