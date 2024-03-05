import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_model.dart';

class ConsultaProcessosLeituraDevolvidoSubService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraDevolvidoSubService();

  Future<
      (
        String message,
        List<ConsultaProcessosLeituraDevolvidoSubModel> items
      )?> filter(
    ConsultaProcessosLeituraDevolvidoSubFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-devolvido-sub',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraDevolvidoSubModel.fromJson(e))
          .toList(),
    );
  }
}
