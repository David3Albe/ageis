import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/proprietario/proprietario_filter.dart';
import 'package:ageiscme_models/main.dart';

class ProprietarioService {
  final CustomDio _client = CustomDio();

  ProprietarioService();

  Future<List<ProprietarioModel>> GetAll() async =>
      (await _client.getList('/proprietario'))
          .map((e) => ProprietarioModel.fromJson(e))
          .toList();

  Future<List<ProprietarioModel>> Filter(ProprietarioFilter filter) async =>
      (await _client.postList('/proprietario/filter', filter))
          .map((e) => ProprietarioModel.fromJson(e))
          .toList();

  Future<(String message, ProprietarioModel proprietario)?> save(
    ProprietarioModel obj,
  ) async {
    return await _client.post(
      '/proprietario',
      obj,
      (dynamic json) => ProprietarioModel.fromJson(json),
    );
  }

  Future<ItemDescritorModel?> FilterOne(
    ProprietarioFilter filter,
  ) async =>
      await _client.postFilter(
        '/proprietario/filter-one',
        filter,
        (dynamic json) => ItemDescritorModel.fromJson(json),
      );

  Future<(String message, ProprietarioModel proprietario)?> delete(
    ProprietarioModel obj,
  ) async {
    return await _client.delete(
      '/proprietario/${obj.cod}',
      obj,
      (dynamic json) => ProprietarioModel.fromJson(json),
    );
  }
}
