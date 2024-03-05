import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class PecaService {
  final CustomDio _client = CustomDio();

  PecaService();

  Future<List<PecaModel>> GetAll() async => (await _client.getList('/peca'))
      .map((e) => PecaModel.fromJson(e))
      .toList();

  Future<(String message, PecaModel peca)?> save(
    PecaModel obj,
  ) async {
    return await _client.post(
      '/peca',
      obj,
      (dynamic json) => PecaModel.fromJson(json),
    );
  }

  Future<(String message, PecaModel peca)?> delete(
    PecaModel obj,
  ) async {
    return await _client.delete(
      '/peca/${obj.cod}',
      obj,
      (dynamic json) => PecaModel.fromJson(json),
    );
  }
}
