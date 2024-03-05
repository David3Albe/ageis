import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/movimento_estoque/consulta_movimentacao_estoque_filter.dart';
import 'package:ageiscme_models/query_models/movimento_estoque/consulta_movimentacao_estoque_model.dart';

class ConsultaMovimentacaoEstoqueService {
  final CustomDio _client = CustomDio();

  ConsultaMovimentacaoEstoqueService();

  Future<(String message, List<ConsultaMovimentacaoEstoqueModel> items)?> filter(
    ConsultaMovimentacaoEstoqueFilter obj,
  ) async {
    return await _client.post(
      '/consulta-movimento-estoque',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaMovimentacaoEstoqueModel.fromJson(e))
          .toList(),
    );
  }
}
