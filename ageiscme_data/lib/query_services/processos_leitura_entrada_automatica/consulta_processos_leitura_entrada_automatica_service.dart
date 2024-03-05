import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_model.dart';

class ConsultaProcessosLeituraEntradaAutomaticaService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraEntradaAutomaticaService();

  Future<
      (
        String message,
        List<ConsultaProcessosLeituraEntradaAutomaticaModel> items
      )?> filter(
    ConsultaProcessosLeituraEntradaAutomaticaFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-entrada-automatica',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map(
            (e) => ConsultaProcessosLeituraEntradaAutomaticaModel.fromJson(e),
          )
          .toList(),
    );
  }
}
