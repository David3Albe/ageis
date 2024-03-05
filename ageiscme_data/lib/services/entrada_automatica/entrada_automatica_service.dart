import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class EntradaAutomaticaService {
  final CustomDio _client = CustomDio();

  EntradaAutomaticaService();

  Future<List<EntradaAutomaticaModel>> GetAll() async =>
      (await _client.getList('/entrada-automatica'))
          .map((e) => EntradaAutomaticaModel.fromJson(e))
          .toList();

  Future<(String message, EntradaAutomaticaModel entradaAutomatica)?> save(
    EntradaAutomaticaModel obj,
  ) async {
    return await _client.post(
      '/entrada-automatica',
      obj,
      (dynamic json) => EntradaAutomaticaModel.fromJson(json),
    );
  }

  Future<(String message, EntradaAutomaticaModel entradaAutomatica)?> delete(
    EntradaAutomaticaModel obj,
  ) async {
    return await _client.delete(
      '/entrada-automatica/${obj.cod}',
      obj,
      (dynamic json) => EntradaAutomaticaModel.fromJson(json),
    );
  }
}
