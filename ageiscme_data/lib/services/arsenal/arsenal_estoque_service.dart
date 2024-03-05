import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ArsenalEstoqueService {
  final CustomDio _client = CustomDio();

  ArsenalEstoqueService();

  Future<List<ArsenalEstoqueModel>> GetAll() async =>
      (await _client.getList('/arsenal'))
          .map((e) => ArsenalEstoqueModel.fromJson(e))
          .toList();

  Future<List<ArsenalEstoqueModel>> Filter(ArsenalEstoqueFilter filter) async =>
      (await _client.postList('/arsenal/filter', filter))
          .map((e) => ArsenalEstoqueModel.fromJson(e))
          .toList();

  Future<(String message, ArsenalEstoqueModel arsenalEstoque)?> save(
    ArsenalEstoqueModel obj,
  ) async {
    return await _client.post(
      '/arsenal',
      obj,
      (dynamic json) => ArsenalEstoqueModel.fromJson(json),
    );
  }

  Future<(String message, ArsenalEstoqueModel arsenalEstoque)?> delete(
    ArsenalEstoqueModel obj,
  ) async {
    return await _client.delete(
      '/arsenal/${obj.cod}',
      obj,
      (dynamic json) => ArsenalEstoqueModel.fromJson(json),
    );
  }
}
