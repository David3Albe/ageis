import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/models/usuario/usuario_model.dart';

class UsuarioService {
  final CustomDio _client = CustomDio();

  UsuarioService();

  Future<List<UsuarioModel>> GetAll() async =>
      (await _client.getList('/usuario'))
          .map((e) => UsuarioModel.fromJson(e))
          .toList();

  Future<List<UsuarioModel>> Filter(UsuarioFilter filter) async =>
      (await _client.postList('/usuario/filter', filter))
          .map((e) => UsuarioModel.fromJson(e))
          .toList();

  Future<UsuarioModel?> FilterOne(
    UsuarioFilter filter,
  ) async =>
      await _client.postFilter(
        '/usuario/filter-one',
        filter,
        (dynamic json) => UsuarioModel.fromJson(json),
      );

  Future<(String message, UsuarioModel usuario)?> save(
    UsuarioModel obj,
  ) async {
    return await _client.post(
      '/usuario',
      obj,
      (dynamic json) => UsuarioModel.fromJson(json),
    );
  }

  Future<(String message, UsuarioModel usuario)?> delete(
    UsuarioModel obj,
  ) async {
    return await _client.delete(
      '/usuario/${obj.cod}',
      obj,
      (dynamic json) => UsuarioModel.fromJson(json),
    );
  }
}
