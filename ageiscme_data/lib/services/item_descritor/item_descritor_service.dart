import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';

class ItemDescritorService {
  final CustomDio _client = CustomDio();

  ItemDescritorService();

  Future<List<ItemDescritorModel>> GetAll() async =>
      (await _client.getList('/item-descritor'))
          .map((e) => ItemDescritorModel.fromJson(e))
          .toList();

  Future<List<ItemDescritorModel>> Filter(ItemDescritorFilter filter) async =>
      (await _client.postList('/item-descritor/filter', filter))
          .map((e) => ItemDescritorModel.fromJson(e))
          .toList();

  Future<ItemDescritorModel?> FilterOne(
    ItemDescritorFilter filter,
  ) async =>
      await _client.postFilter(
        '/item-descritor/filter-one',
        filter,
        (dynamic json) => ItemDescritorModel.fromJson(json),
      );

  Future<(String message, ItemDescritorModel itemDescritor)?> save(
    ItemDescritorModel obj,
  ) async {
    return await _client.post(
      '/item-descritor',
      obj,
      (dynamic json) => ItemDescritorModel.fromJson(json),
    );
  }

  Future<(String message, ItemDescritorModel itemDescritor)?> delete(
    ItemDescritorModel obj,
  ) async {
    return await _client.delete(
      '/item-descritor/${obj.cod}',
      obj,
      (dynamic json) => ItemDescritorModel.fromJson(json),
    );
  }
}
