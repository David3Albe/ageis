import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class GestaoContratoService {
  final CustomDio _client = CustomDio();
  static const BASE_URL = '/gestao-contrato/';

  GestaoContratoService();

  Future<List<GestaoContratoModel>> GetAll() async =>
      (await _client.getList(BASE_URL))
          .map((e) => GestaoContratoModel.fromJson(e))
          .toList();

  Future<(String message, GestaoContratoModel gestaoContrato)?> save(
    GestaoContratoModel obj,
  ) async {
    return await _client.post(
      BASE_URL,
      obj,
      (dynamic json) => GestaoContratoModel.fromJson(json),
    );
  }

  Future<(String message, GestaoContratoModel gestaoContrato)?> delete(
    GestaoContratoModel obj,
  ) async {
    return await _client.delete(
      BASE_URL + '${obj.cod}',
      obj,
      (dynamic json) => GestaoContratoModel.fromJson(json),
    );
  }
}
