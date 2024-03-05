import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/equipamento_manutencao/consulta_manutencao_filter.dart';
import 'package:ageiscme_models/query_models/equipamento_manutencao/consulta_manutencao_model.dart';

class ConsultaManutencaoService {
  final CustomDio _client = CustomDio();

  ConsultaManutencaoService();

  Future<(String message, List<ConsultaManutencaoModel> items)?> filter(
    ConsultaManutencaoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-manutencao',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaManutencaoModel.fromJson(e))
          .toList(),
    );
  }
}
