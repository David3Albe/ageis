import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';

class KitDescritorService {
  final CustomDio _client = CustomDio();

  KitDescritorService();

  Future<List<KitDescritorModel>> GetAll() async =>
      (await _client.getList('/kit-descritor'))
          .map((e) => KitDescritorModel.fromJson(e))
          .toList();

  Future<KitDescritorModel?> FilterOne(KitDescritorFilter filter) async =>
      await _client.postFilter(
        '/kit-descritor/filter-one',
        filter,
        (dynamic json) => KitDescritorModel.fromJson(json),
      );

  Future<List<KitDescritorModel>> Filter(KitDescritorFilter filter) async =>
      (await _client.postList('/kit-descritor/filter', filter))
          .map((e) => KitDescritorModel.fromJson(e))
          .toList();

  Future<(String message, KitDescritorModel kitDescritor)?> save(
    KitDescritorModel obj,
  ) async {
    return await _client.post(
      '/kit-descritor',
      obj,
      (dynamic json) => KitDescritorModel.fromJson(json),
    );
  }

  Future<(String message, KitDescritorModel kitDescritor)?> delete(
    KitDescritorModel obj,
  ) async {
    return await _client.delete(
      '/kit-descritor/${obj.cod}',
      obj,
      (dynamic json) => KitDescritorModel.fromJson(json),
    );
  }
}
