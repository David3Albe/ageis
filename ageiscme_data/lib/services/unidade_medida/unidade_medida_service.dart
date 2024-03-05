import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class UnidadeMedidaService {
  final CustomDio _client = CustomDio();

  UnidadeMedidaService();

  Future<List<UnidadeMedidaModel>> GetAll() async =>
      (await _client.getList('/unidade-medida'))
          .map((e) => UnidadeMedidaModel.fromJson(e))
          .toList();

  Future<(String message, UnidadeMedidaModel unidadeMedida)?> save(
    UnidadeMedidaModel obj,
  ) async {
    return await _client.post(
      '/unidade-medida',
      obj,
      (dynamic json) => UnidadeMedidaModel.fromJson(json),
    );
  }

  Future<(String message, UnidadeMedidaModel unidadeMedida)?> delete(
    UnidadeMedidaModel obj,
  ) async {
    return await _client.delete(
      '/unidade-medida/${obj.cod}',
      obj,
      (dynamic json) => UnidadeMedidaModel.fromJson(json),
    );
  }
}
