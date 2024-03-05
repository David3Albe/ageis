import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class CentroCustoService {
  final CustomDio _client = CustomDio();

  CentroCustoService();

  Future<List<CentroCustoModel>> GetAll() async =>
      (await _client.getList('/centro-custo'))
          .map((e) => CentroCustoModel.fromJson(e))
          .toList();

  Future<(String message, CentroCustoModel centroCusto)?> save(
    CentroCustoModel obj,
  ) async {
    return await _client.post(
      '/centro-custo',
      obj,
      (dynamic json) => CentroCustoModel.fromJson(json),
    );
  }

  Future<(String message, CentroCustoModel centroCusto)?> delete(
    CentroCustoModel obj,
  ) async {
    return await _client.delete(
      '/centro-custo/${obj.cod}',
      obj,
      (dynamic json) => CentroCustoModel.fromJson(json),
    );
  }
}
