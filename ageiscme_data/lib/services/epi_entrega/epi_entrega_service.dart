import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class EpiEntregaService {
  final CustomDio _client = CustomDio();

  EpiEntregaService();

  Future<List<EpiEntregaModel>> GetAll() async =>
      (await _client.getList('/epi-entrega'))
          .map((e) => EpiEntregaModel.fromJson(e))
          .toList();

  Future<(String message, EpiEntregaModel epiEntrega)?> save(
    EpiEntregaModel obj,
  ) async {
    return await _client.post(
      '/epi-entrega',
      obj,
      (dynamic json) => EpiEntregaModel.fromJson(json),
    );
  }

  Future<(String message, EpiEntregaModel epiEntrega)?> delete(
    EpiEntregaModel obj,
  ) async {
    return await _client.delete(
      '/epi-entrega/${obj.cod}',
      obj,
      (dynamic json) => EpiEntregaModel.fromJson(json),
    );
  }
}
