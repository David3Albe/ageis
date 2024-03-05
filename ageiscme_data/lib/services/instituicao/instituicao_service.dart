import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class InstituicaoService {
  final CustomDio _client = CustomDio();

  InstituicaoService();

  Future<List<InstituicaoModel>> GetAll() async =>
      (await _client.getList('/instituicao'))
          .map((e) => InstituicaoModel.fromJson(e))
          .toList();

  Future<(String message, InstituicaoModel instituicao)?> save(
    InstituicaoModel obj,
  ) async {
    return await _client.post(
      '/instituicao',
      obj,
      (dynamic json) => InstituicaoModel.fromJson(json),
    );
  }

  Future<(String message, InstituicaoModel instituicao)?> delete(
    InstituicaoModel obj,
  ) async {
    return await _client.delete(
      '/instituicao/${obj.cod}',
      obj,
      (dynamic json) => InstituicaoModel.fromJson(json),
    );
  }
}
