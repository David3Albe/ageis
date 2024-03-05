import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/registro_servico/consulta_registro_servico_filter.dart';
import 'package:ageiscme_models/query_models/registro_servico/consulta_registro_servico_model.dart';

class ConsultaRegistroServicoService {
  final CustomDio _client = CustomDio();

  ConsultaRegistroServicoService();

  Future<(String message, List<ConsultaRegistroServicoModel> items)?> filter(
    ConsultaRegistroServicoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-registro-servico',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaRegistroServicoModel.fromJson(e))
          .toList(),
    );
  }
}
