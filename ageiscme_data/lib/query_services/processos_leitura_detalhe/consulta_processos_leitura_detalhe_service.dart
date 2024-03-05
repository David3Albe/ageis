import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe/consulta_processos_leitura_detalhe_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_detalhe/consulta_processos_leitura_detalhe_model.dart';

class ConsultaProcessosLeituraDetalheService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraDetalheService();

  Future<(String message, List<ConsultaProcessosLeituraDetalheModel> items)?>
      filter(
    ConsultaProcessosLeituraDetalheFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-detalhe',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraDetalheModel.fromJson(e))
          .toList(),
    );
  }
}
