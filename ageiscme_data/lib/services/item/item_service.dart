import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/item_save_result/item_save_result_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';

class ItemService {
  final CustomDio _client = CustomDio();

  ItemService();

  Future<List<ItemModel>> GetAll() async => (await _client.getList('/item'))
      .map((e) => ItemModel.fromJson(e))
      .toList();

  Future<ItemRotuladoResponseDTO> getItensImpressaoRotulado() async =>
      ItemRotuladoResponseDTO.fromJson(
        await _client.getOne(
          '/item/rotulados-impressao',
        ),
      );

  Future<List<ItemModel>> Filter(
    ItemFilter filter,
  ) async =>
      (await _client.postList('/item/filter', filter))
          .map((e) => ItemModel.fromJson(e))
          .toList();

  Future<ItemModel?> FilterOne(
    ItemFilter filter,
  ) async =>
      await _client.postFilter(
        '/item/filter-one',
        filter,
        (dynamic json) => ItemModel.fromJson(json),
      );

  Future<(String message, ItemSaveResultDTO item)?> save(
    ItemModel obj,
  ) async {
    return await _client.post(
      '/item',
      obj,
      (dynamic json) => ItemSaveResultDTO.fromJson(json),
    );
  }

  Future<(String message, ItemModel item)?> delete(
    ItemModel obj,
  ) async {
    return await _client.delete(
      '/item/${obj.cod}',
      obj,
      (dynamic json) => ItemModel.fromJson(json),
    );
  }
}
