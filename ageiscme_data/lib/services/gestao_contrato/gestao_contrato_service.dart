import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class GestaoContratoService {
  final CustomDio _client = CustomDio();

  GestaoContratoService();

  Future<List<GestaoContratoModel>> GetAll() async =>
      (await _client.getList('/gestao-contrato'))
          .map((e) => GestaoContratoModel.fromJson(e))
          .toList();

  Future<(String message, GestaoContratoModel gestaoContrato)?> save(
    GestaoContratoModel obj,
  ) async {
    return await _client.post(
      '/gestao-contrato',
      obj,
      (dynamic json) => GestaoContratoModel.fromJson(json),
    );
  }

  Future<(String message, GestaoContratoModel gestaoContrato)?> delete(
    GestaoContratoModel obj,
  ) async {
    return await _client.delete(
      '/gestao-contrato/${obj.cod}',
      obj,
      (dynamic json) => GestaoContratoModel.fromJson(json),
    );
  }
}
