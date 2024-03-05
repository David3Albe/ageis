import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_model.dart';

class ConsultaProcessosLeituraDetalheKitService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraDetalheKitService();

  Future<(String message, List<ConsultaProcessosLeituraDetalheKitModel> items)?>
      filter(
    ConsultaProcessosLeituraDetalheKitFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-detalhe-kit',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraDetalheKitModel.fromJson(e))
          .toList(),
    );
  }
}
