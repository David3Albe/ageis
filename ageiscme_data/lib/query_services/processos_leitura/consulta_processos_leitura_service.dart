import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_model.dart';

class ConsultaProcessosLeituraService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraService();

  Future<(String message, List<ConsultaProcessosLeituraModel> items)?> filter(
    ConsultaProcessosLeituraFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraModel.fromJson(e))
          .toList(),
    );
  }
}
