import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class TamanhoService {
  final CustomDio _client = CustomDio();

  TamanhoService();

  Future<List<TamanhoModel>> GetAll() async =>
      (await _client.getList('/tamanho'))
          .map((e) => TamanhoModel.fromJson(e))
          .toList();

  Future<(String message, TamanhoModel tamanho)?> save(
    TamanhoModel obj,
  ) async {
    return await _client.post(
      '/tamanho',
      obj,
      (dynamic json) => TamanhoModel.fromJson(json),
    );
  }

  Future<(String message, TamanhoModel tamanho)?> delete(
    TamanhoModel obj,
  ) async {
    return await _client.delete(
      '/tamanho/${obj.cod}',
      obj,
      (dynamic json) => TamanhoModel.fromJson(json),
    );
  }
}
