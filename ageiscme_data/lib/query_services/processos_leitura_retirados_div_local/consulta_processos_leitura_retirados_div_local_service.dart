import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_model.dart';

class ConsultaProcessosLeituraRetiradosDivLocalService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraRetiradosDivLocalService();

  Future<
      (
        String message,
        List<ConsultaProcessosLeituraRetiradosDivLocalModel> items
      )?> filter(
    ConsultaProcessosLeituraRetiradosDivLocalFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processos-leitura-retirado-div-local',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map(
            (e) => ConsultaProcessosLeituraRetiradosDivLocalModel.fromJson(e),
          )
          .toList(),
    );
  }
}
