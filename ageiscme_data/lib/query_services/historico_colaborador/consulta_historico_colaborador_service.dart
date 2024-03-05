import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/historico_colaborador/consulta_historico_colaborador_filter.dart';
import 'package:ageiscme_models/query_models/historico_colaborador/consulta_historico_colaborador_model.dart';

class ConsultaHistoricoColaboradorService {
  final CustomDio _client = CustomDio();

  ConsultaHistoricoColaboradorService();

  Future<(String message, List<ConsultaHistoricoColaboradorModel> items)?>
      filter(
    ConsultaHistoricoColaboradorFilter obj,
  ) async {
    return await _client.post(
      '/consulta-historico-colaborador',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaHistoricoColaboradorModel.fromJson(e))
          .toList(),
    );
  }
}
