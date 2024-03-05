import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/estoque_vencido/consulta_estoque_vencido_filter.dart';
import 'package:ageiscme_models/query_models/estoque_vencido/consulta_estoque_vencido_model.dart';

class ConsultaEstoqueVencidoService {
  final CustomDio _client = CustomDio();

  ConsultaEstoqueVencidoService();

  Future<(String message, List<ConsultaEstoqueVencidoModel> items)?> filter(
    ConsultaEstoqueVencidoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-estoque-vencido',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaEstoqueVencidoModel.fromJson(e))
          .toList(),
    );
  }
}
