import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho/consulta_processos_leitura_tamanho_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_tamanho/consulta_processos_leitura_tamanho_model.dart';

class ConsultaProcessosLeituraTamanhoService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraTamanhoService();

  Future<(String message, List<ConsultaProcessosLeituraTamanhoModel> items)?>
      filter(
    ConsultaProcessosLeituraTamanhoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processos-leitura-tamanho',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraTamanhoModel.fromJson(e))
          .toList(),
    );
  }
}
