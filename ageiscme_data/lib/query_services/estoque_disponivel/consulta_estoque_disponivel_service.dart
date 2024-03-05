import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel/consulta_estoque_disponivel_filter.dart';
import 'package:ageiscme_models/query_models/estoque_disponivel/consulta_estoque_disponivel_model.dart';

class ConsultaEstoqueDisponivelService {
  final CustomDio _client = CustomDio();

  ConsultaEstoqueDisponivelService();

  Future<(String message, List<ConsultaEstoqueDisponivelModel> items)?> filter(
    ConsultaEstoqueDisponivelFilter obj,
  ) async {
    return await _client.post(
      '/consulta-estoque-disponivel',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaEstoqueDisponivelModel.fromJson(e))
          .toList(),
    );
  }
}
