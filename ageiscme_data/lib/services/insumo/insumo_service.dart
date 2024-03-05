import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class InsumoService {
  final CustomDio _client = CustomDio();

  InsumoService();

  Future<List<InsumoModel>> GetAll() async => (await _client.getList('/insumo'))
      .map((e) => InsumoModel.fromJson(e))
      .toList();

  Future<(String message, InsumoModel insumo)?> save(
    InsumoModel obj,
  ) async {
    return await _client.post(
      '/insumo',
      obj,
      (dynamic json) => InsumoModel.fromJson(json),
    );
  }

  Future<(String message, InsumoModel insumo)?> delete(
    InsumoModel obj,
  ) async {
    return await _client.delete(
      '/insumo/${obj.cod}',
      obj,
      (dynamic json) => InsumoModel.fromJson(json),
    );
  }
}
