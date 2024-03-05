import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class GrupoMaterialService {
  final CustomDio _client = CustomDio();

  GrupoMaterialService();

  Future<List<GrupoMaterialModel>> GetAll() async =>
      (await _client.getList('/grupo-material'))
          .map((e) => GrupoMaterialModel.fromJson(e))
          .toList();

  Future<(String message, GrupoMaterialModel grupoMaterial)?> save(
    GrupoMaterialModel obj,
  ) async {
    return await _client.post(
      '/grupo-material',
      obj,
      (dynamic json) => GrupoMaterialModel.fromJson(json),
    );
  }

  Future<(String message, GrupoMaterialModel grupoMaterial)?> delete(
    GrupoMaterialModel obj,
  ) async {
    return await _client.delete(
      '/grupo-material/${obj.cod}',
      obj,
      (dynamic json) => GrupoMaterialModel.fromJson(json),
    );
  }
}
