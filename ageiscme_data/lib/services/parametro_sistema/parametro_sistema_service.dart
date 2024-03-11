import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ParametroSistemaService {
  final CustomDio _client = CustomDio();

  ParametroSistemaService();

  Future<List<ParametroSistemaModel>> GetAll() async =>
      (await _client.getList('/parametro-sistema'))
          .map((e) => ParametroSistemaModel.fromJson(e))
          .toList();

  Future<ParametroSistemaModel?> findFirst() async =>
      ParametroSistemaModel.fromJson(
        await _client.getOne('/parametro-sistema/find-first'),
      );

  Future<(String message, ParametroSistemaModel parametroSistema)?> save(
    ParametroSistemaModel obj,
  ) async {
    return await _client.post(
      '/parametro-sistema',
      obj,
      (dynamic json) => ParametroSistemaModel.fromJson(json),
    );
  }

  Future<(String message, ParametroSistemaModel parametroSistema)?> delete(
    ParametroSistemaModel obj,
  ) async {
    return await _client.delete(
      '/parametro-sistema/${obj.cod}',
      obj,
      (dynamic json) => ParametroSistemaModel.fromJson(json),
    );
  }
}
