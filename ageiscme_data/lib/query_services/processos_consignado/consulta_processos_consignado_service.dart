import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_consignado/consulta_processos_consignado_filter.dart';
import 'package:ageiscme_models/query_models/processos_consignado/consulta_processos_consignado_model.dart';

class ConsultaProcessosConsignadoService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosConsignadoService();

  Future<(String message, List<ConsultaProcessosConsignadoModel> items)?> filter(
    ConsultaProcessosConsignadoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-consignado',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosConsignadoModel.fromJson(e))
          .toList(),
    );
  }
}
