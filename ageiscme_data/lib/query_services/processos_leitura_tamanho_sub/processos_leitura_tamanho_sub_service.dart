import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_model.dart';

class ConsultaProcessosLeituraTamanhoSubService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraTamanhoSubService();

  Future<(String message, List<ConsultaProcessosLeituraTamanhoSubModel> items)?>
      filter(
    ConsultaProcessosLeituraTamanhoSubFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processos-leitura-tamanho-sub',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraTamanhoSubModel.fromJson(e))
          .toList(),
    );
  }
}
