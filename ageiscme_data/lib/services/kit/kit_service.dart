import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/kit/kit_filter.dart';
import 'package:ageiscme_models/main.dart';

class KitService {
  final CustomDio _client = CustomDio();

  KitService();

  Future<List<KitModel>> GetAll() async =>
      (await _client.getList('/kit')).map((e) => KitModel.fromJson(e)).toList();

  Future<KitModel?> FilterOne(
    KitFilter filter,
  ) async =>
      await _client.postFilter(
        '/kit/filter-one',
        filter,
        (dynamic json) => KitModel.fromJson(json),
      );

  Future<(String message, KitModel kit)?> save(
    KitModel obj,
  ) async {
    return await _client.post(
      '/kit',
      obj,
      (dynamic json) => KitModel.fromJson(json),
    );
  }

  Future<(String message, KitModel? kit)?> delete(
    KitModel obj,
  ) async {
    return await _client.delete(
      '/kit/${obj.cod}',
      obj,
      (dynamic json) => KitModel.fromJson(json),
    );
  }
}
