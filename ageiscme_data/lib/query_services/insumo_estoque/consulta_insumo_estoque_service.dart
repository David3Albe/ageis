import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/insumo_estoque/consulta_insumo_estoque_filter.dart';
import 'package:ageiscme_models/query_models/insumo_estoque/consulta_insumo_estoque_model.dart';

class ConsultaInsumoEstoqueService {
  final CustomDio _client = CustomDio();

  ConsultaInsumoEstoqueService();

  Future<(String message, List<ConsultaInsumoEstoqueModel> items)?> filter(
    ConsultaInsumoEstoqueFilter obj,
  ) async {
    return await _client.post(
      '/consulta-insumo-estoque',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaInsumoEstoqueModel.fromJson(e))
          .toList(),
    );
  }
}
