import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_filter.dart';
import 'package:ageiscme_models/query_models/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_model.dart';

class ConsultaEstoqueDisponivelRotuladoService {
  final CustomDio _client = CustomDio();

  ConsultaEstoqueDisponivelRotuladoService();

  Future<(String message, List<ConsultaEstoqueDisponivelRotuladoModel> items)?>
      filter(
    ConsultaEstoqueDisponivelRotuladoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-estoque-disponivel-rotulado',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaEstoqueDisponivelRotuladoModel.fromJson(e))
          .toList(),
    );
  }
}
