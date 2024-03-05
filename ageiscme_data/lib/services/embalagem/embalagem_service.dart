import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class EmbalagemService {
  final CustomDio _client = CustomDio();

  EmbalagemService();

  Future<List<EmbalagemModel>> GetAll() async =>
      (await _client.getList('/embalagem'))
          .map((e) => EmbalagemModel.fromJson(e))
          .toList();

  Future<(String message, EmbalagemModel embalagem)?> save(
    EmbalagemModel obj,
  ) async {
    return await _client.post(
      '/embalagem',
      obj,
      (dynamic json) => EmbalagemModel.fromJson(json),
    );
  }

  Future<(String message, EmbalagemModel embalagem)?> delete(
    EmbalagemModel obj,
  ) async {
    return await _client.delete(
      '/embalagem/${obj.cod}',
      obj,
      (dynamic json) => EmbalagemModel.fromJson(json),
    );
  }
}
