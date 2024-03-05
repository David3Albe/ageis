import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ItemDescritorKitService {
  final CustomDio _client = CustomDio();

  ItemDescritorKitService();

  Future<List<ItemDescritorKitModel>> GetAll() async =>
      (await _client.getList('/item-descritor-kit'))
          .map((e) => ItemDescritorKitModel.fromJson(e))
          .toList();

  Future<(String message, ItemDescritorKitModel itemDescritorKit)?> save(
    ItemDescritorKitModel obj,
  ) async {
    return await _client.post(
      '/item-descritor-kit',
      obj,
      (dynamic json) => ItemDescritorKitModel.fromJson(json),
    );
  }

  Future<(String message, ItemDescritorKitModel itemDescritorKit)?> delete(
    ItemDescritorKitModel obj,
  ) async {
    return await _client.delete(
      '/item-descritor-kit/${obj.cod}',
      obj,
      (dynamic json) => ItemDescritorKitModel.fromJson(json),
    );
  }
}
