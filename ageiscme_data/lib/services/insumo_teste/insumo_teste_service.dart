import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/insumo_teste/insumo_teste_filter.dart';
import 'package:ageiscme_models/models/insumo_teste/insumo_teste_model.dart';

class InsumoTesteService {
  final CustomDio _client = CustomDio();

  InsumoTesteService();

  Future<List<InsumoTesteModel>> GetAll() async =>
      (await _client.getList('/insumo-teste'))
          .map((e) => InsumoTesteModel.fromJson(e))
          .toList();

  Future<InsumoTesteModel?> FilterOne(
    InsumoTesteFilter filter,
  ) async =>
      await _client.postFilter(
        '/insumo-teste/filter-one',
        filter,
        (dynamic json) => InsumoTesteModel.fromJson(json),
      );

  Future<List<InsumoTesteModel>> Filter(
    InsumoTesteFilter filter,
  ) async =>
      (await _client.postList(
        '/insumo-teste/filter',
        filter,
      ))
          .map((e) => InsumoTesteModel.fromJson(e))
          .toList();

  Future<(String message, InsumoTesteModel insumoTeste)?> save(
    InsumoTesteModel obj,
  ) async {
    return await _client.post(
      '/insumo-teste',
      obj,
      (dynamic json) => InsumoTesteModel.fromJson(json),
    );
  }

  Future<(String message, InsumoTesteModel insumoTeste)?> delete(
    InsumoTesteModel obj,
  ) async {
    return await _client.delete(
      '/insumo-teste/${obj.cod}',
      obj,
      (dynamic json) => InsumoTesteModel.fromJson(json),
    );
  }
}
