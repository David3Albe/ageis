import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class LocalInstituicaoService {
  final CustomDio _client = CustomDio();

  LocalInstituicaoService();

  Future<List<LocalInstituicaoModel>> GetAll() async =>
      (await _client.getList('/local-instituicao'))
          .map((e) => LocalInstituicaoModel.fromJson(e))
          .toList();

  Future<List<LocalInstituicaoModel>> Filter(
    LocalInstituicaoFilter filter,
  ) async =>
      (await _client.postList('/local-instituicao/filter', filter))
          .map((e) => LocalInstituicaoModel.fromJson(e))
          .toList();

  Future<(String message, LocalInstituicaoModel localInstituicao)?> save(
    LocalInstituicaoModel obj,
  ) async {
    return await _client.post(
      '/local-instituicao',
      obj,
      (dynamic json) => LocalInstituicaoModel.fromJson(json),
    );
  }

  Future<(String message, LocalInstituicaoModel localInstituicao)?> delete(
    LocalInstituicaoModel obj,
  ) async {
    return await _client.delete(
      '/local-instituicao/${obj.cod}',
      obj,
      (dynamic json) => LocalInstituicaoModel.fromJson(json),
    );
  }
}
