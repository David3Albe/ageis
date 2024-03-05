import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/kit_cor/kit_cor_filter.dart';
import 'package:ageiscme_models/main.dart';

class KitCorService {
  final CustomDio _client = CustomDio();

  KitCorService();

  Future<List<KitCorModel>> GetAll() async =>
      (await _client.getList('/kit-cor'))
          .map((e) => KitCorModel.fromJson(e))
          .toList();

  Future<List<KitCorModel>> Filter(KitCorFilter filter) async =>
      (await _client.postList('/kit-cor/filter', filter))
          .map((e) => KitCorModel.fromJson(e))
          .toList();

  Future<(String message, KitCorModel kitCor)?> save(
    KitCorModel obj,
  ) async {
    return await _client.post(
      '/kit-cor',
      obj,
      (dynamic json) => KitCorModel.fromJson(json),
    );
  }

  Future<(String message, KitCorModel kitCor)?> delete(
    KitCorModel obj,
  ) async {
    return await _client.delete(
      '/kit-cor/${obj.cod}',
      obj,
      (dynamic json) => KitCorModel.fromJson(json),
    );
  }
}
