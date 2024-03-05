import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/insumo_saldo/consulta_insumo_saldo_filter.dart';
import 'package:ageiscme_models/query_models/insumo_saldo/consulta_insumo_saldo_model.dart';

class ConsultaInsumoSaldoService {
  final CustomDio _client = CustomDio();

  ConsultaInsumoSaldoService();

  Future<(String message, List<ConsultaInsumoSaldoModel> items)?> filter(
    ConsultaInsumoSaldoFilter obj,
  ) async {
    return await _client.post(
      '/consulta-insumo-saldo',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaInsumoSaldoModel.fromJson(e))
          .toList(),
    );
  }
}
