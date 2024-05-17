import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';

class ItemDescritorService {
  final CustomDio _client = CustomDio();
  static const String baseRoute = '/item-descritor/';

  ItemDescritorService();

  Future<List<ItemDescritorModel>> GetAll() async =>
      (await _client.getList(baseRoute))
          .map((e) => ItemDescritorModel.fromJson(e))
          .toList();

  Future<List<ItemDescritorModel>> GetScreenData(
    ItemDescritorFilter filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'get-screen-data',
        filter,
      ))
          .map((e) => ItemDescritorModel.fromJson(e))
          .toList();

  Future<List<ItemDescritorModel>> Filter(ItemDescritorFilter filter) async =>
      (await _client.postList(baseRoute + 'filter', filter))
          .map((e) => ItemDescritorModel.fromJson(e))
          .toList();

  Future<ItemDescritorModel?> FilterOne(
    ItemDescritorFilter filter,
  ) async =>
      await _client.postFilter(
        baseRoute + 'filter-one',
        filter,
        (dynamic json) => ItemDescritorModel.fromJson(json),
      );

  Future<(String message, ItemDescritorModel itemDescritor)?> save(
    ItemDescritorModel obj,
  ) async {
    return await _client.post(
      baseRoute,
      obj,
      (dynamic json) => ItemDescritorModel.fromJson(json),
    );
  }

  Future<(String message, ItemDescritorModel itemDescritor)?> delete(
    ItemDescritorModel obj,
  ) async {
    return await _client.delete(
      baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => ItemDescritorModel.fromJson(json),
    );
  }

      Future<(String, List<ItemDescritorDropDownSearchResponseDTO>)?> getDropDownSearch(
    ItemDescritorDropDownSearchDTO dto,
  ) async =>
      await _client.post(
        baseRoute + 'drop-down-search',
        dto,
        (dynamic json) => (json as List<dynamic>)
            .map((e) => ItemDescritorDropDownSearchResponseDTO.fromJson(e))
            .toList(),
      );
}
