import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class PerfilAcessoService {
  final CustomDio _client = CustomDio();

  PerfilAcessoService();

  Future<List<PerfilAcessoModel>> GetAll() async =>
      (await _client.getList('/perfil-acesso'))
          .map((e) => PerfilAcessoModel.fromJson(e))
          .toList();

  Future<(String message, PerfilAcessoModel perfilAcesso)?> save(
    PerfilAcessoModel obj,
  ) async {
    return await _client.post(
      '/perfil-acesso',
      obj,
      (dynamic json) => PerfilAcessoModel.fromJson(json),
    );
  }

  Future<(String message, PerfilAcessoModel perfilAcesso)?> delete(
    PerfilAcessoModel obj,
  ) async {
    return await _client.delete(
      '/perfil-acesso/${obj.cod}',
      obj,
      (dynamic json) => PerfilAcessoModel.fromJson(json),
    );
  }
}
