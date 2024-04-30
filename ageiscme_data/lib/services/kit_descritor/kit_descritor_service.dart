import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';

class KitDescritorService {
  final CustomDio _client = CustomDio();
  static const baseRoute = '/kit-descritor/';

  KitDescritorService();

  Future<List<KitDescritorModel>> GetAll() async =>
      (await _client.getList(baseRoute))
          .map((e) => KitDescritorModel.fromJson(e))
          .toList();

  Future<List<KitDescritorModel>> GetScreenData(
    KitDescritorFilter filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'get-screen-data',
        filter,
      ))
          .map((e) => KitDescritorModel.fromJson(e))
          .toList();

  Future<KitDescritorModel?> FilterOne(KitDescritorFilter filter) async =>
      await _client.postFilter(
        baseRoute + 'filter-one',
        filter,
        (dynamic json) => KitDescritorModel.fromJson(json),
      );

  Future<List<KitDescritorModel>> Filter(KitDescritorFilter filter) async =>
      (await _client.postList(baseRoute + 'filter', filter))
          .map((e) => KitDescritorModel.fromJson(e))
          .toList();

  Future<(String message, KitDescritorModel kitDescritor)?> save(
    KitDescritorModel obj,
  ) async {
    return await _client.post(
     baseRoute,
      obj,
      (dynamic json) => KitDescritorModel.fromJson(json),
    );
  }

  Future<(String message, KitDescritorModel kitDescritor)?> delete(
    KitDescritorModel obj,
  ) async {
    return await _client.delete(
      baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => KitDescritorModel.fromJson(json),
    );
  }
}
