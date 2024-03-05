import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class FabricanteService {
  final CustomDio _client = CustomDio();

  FabricanteService();

  Future<List<FabricanteModel>> GetAll() async =>
      (await _client.getList('/fabricante'))
          .map((e) => FabricanteModel.fromJson(e))
          .toList();

  Future<(String message, FabricanteModel fabricante)?> save(
    FabricanteModel obj,
  ) async {
    return await _client.post(
      '/fabricante',
      obj,
      (dynamic json) => FabricanteModel.fromJson(json),
    );
  }

  Future<(String message, FabricanteModel fabricante)?> delete(
    FabricanteModel obj,
  ) async {
    return await _client.delete(
      '/fabricante/${obj.cod}',
      obj,
      (dynamic json) => FabricanteModel.fromJson(json),
    );
  }
}
