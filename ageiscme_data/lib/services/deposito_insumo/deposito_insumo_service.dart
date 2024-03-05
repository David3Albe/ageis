import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class DepositoInsumoService {
  final CustomDio _client = CustomDio();

  DepositoInsumoService();

  Future<List<DepositoInsumoModel>> GetAll() async =>
      (await _client.getList('/deposito'))
          .map((e) => DepositoInsumoModel.fromJson(e))
          .toList();

  Future<(String message, DepositoInsumoModel depositoInsumo)?> save(
    DepositoInsumoModel obj,
  ) async {
    return await _client.post(
      '/deposito',
      obj,
      (dynamic json) => DepositoInsumoModel.fromJson(json),
    );
  }

  Future<(String message, DepositoInsumoModel depositoInsumo)?> delete(
    DepositoInsumoModel obj,
  ) async {
    return await _client.delete(
      '/deposito/${obj.cod}',
      obj,
      (dynamic json) => DepositoInsumoModel.fromJson(json),
    );
  }
}
