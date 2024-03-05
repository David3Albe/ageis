import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/insumo_saldo/insumo_saldo_filter.dart';
import 'package:ageiscme_models/models/insumo_saldo/insumo_saldo_model.dart';

class InsumoSaldoService {
  final CustomDio _client = CustomDio();

  InsumoSaldoService();

  Future<InsumoSaldoModel?> filterOne(
    InsumoSaldoFilter obj,
  ) async {
    return await _client.postFilter(
      '/insumo-saldo/filter-one',
      obj,
      (dynamic json) => InsumoSaldoModel.fromJson(json),
    );
  }
}
