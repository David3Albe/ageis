import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class DestinoResiduoService {
  final CustomDio _client = CustomDio();

  DestinoResiduoService();

  Future<List<DestinoResiduoModel>> GetAll() async =>
      (await _client.getList('/destino-residuo'))
          .map((e) => DestinoResiduoModel.fromJson(e))
          .toList();

  Future<(String message, DestinoResiduoModel destinoResiduo)?> save(
    DestinoResiduoModel obj,
  ) async {
    return await _client.post(
      '/destino-residuo',
      obj,
      (dynamic json) => DestinoResiduoModel.fromJson(json),
    );
  }

  Future<(String message, DestinoResiduoModel destinoResiduo)?> delete(
    DestinoResiduoModel obj,
  ) async {
    return await _client.delete(
      '/destino-residuo/${obj.cod}',
      obj,
      (dynamic json) => DestinoResiduoModel.fromJson(json),
    );
  }
}
