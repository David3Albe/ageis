import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/item/drop_down_search/item_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_dto.dart';
import 'package:ageiscme_models/dto/item/inserir_rapido/search/item_inserir_rapido_search_dto.dart';
import 'package:ageiscme_models/dto/item/item_etiqueta/item_etiqueta_dto.dart';
import 'package:ageiscme_models/dto/item/item_etiqueta_preparo/item_etiqueta_preparo_dto.dart';
import 'package:ageiscme_models/dto/item/trocar_etiqueta/item_trocar_etiqueta_dto.dart';
import 'package:ageiscme_models/dto/item_save_result/item_save_result_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item/drop_down_search/item_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/gerar_inserir/item_inserir_rapido_gerar_inserir_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/item_inserir_rapido_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/trocar_etiqueta/item_trocar_etiqueta_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_response/item_etiqueta_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';

class ItemService {
  final CustomDio _client = CustomDio();

  static const String _baseRoute = '/item/';

  ItemService();

  Future<List<ItemModel>> GetAll() async => (await _client.getList(_baseRoute))
      .map((e) => ItemModel.fromJson(e))
      .toList();

  Future<ItemRotuladoResponseDTO> getItensImpressaoRotulado() async =>
      ItemRotuladoResponseDTO.fromJson(
        await _client.getOne(
          _baseRoute + 'rotulados-impressao',
        ),
      );

  Future<ItemEtiquetaResponseDTO?> getItensEtiquetas({
    required ItemEtiquetaDTO dto,
  }) async =>
      ItemEtiquetaResponseDTO.fromJson(
        await _client.postOne(
          _baseRoute + 'etiquetas',
          dto,
        ),
      );

  Future<(String, ItemEtiquetaPreparoResponseDTO)?> getEtiquetaPreparo({
    required ItemEtiquetaPreparoDTO dto,
  }) async =>
      await _client.post(
        _baseRoute + 'etiqueta-preparo',
        dto,
        (dynamic json) => ItemEtiquetaPreparoResponseDTO.fromJson(json),
      );

  Future<List<ItemModel>> Filter(
    ItemFilter filter,
  ) async =>
      (await _client.postList(_baseRoute + 'filter', filter))
          .map((e) => ItemModel.fromJson(e))
          .toList();

  Future<ItemModel?> FilterOne(
    ItemFilter filter,
  ) async =>
      await _client.postFilter(
        _baseRoute + 'filter-one',
        filter,
        (dynamic json) => ItemModel.fromJson(json),
      );

  Future<(String message, ItemSaveResultDTO item)?> save(
    ItemModel obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => ItemSaveResultDTO.fromJson(json),
    );
  }

  Future<(String message, ItemModel item)?> delete(
    ItemModel obj,
  ) async {
    return await _client.delete(
      _baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => ItemModel.fromJson(json),
    );
  }

  Future<(String message, ItemInserirRapidoSearchResponseDTO item)?>
      inserirRapidoSearch(
    ItemInserirRapidoSearchDTO obj,
  ) async {
    return await _client.post(
      _baseRoute + 'inserir-rapido-search',
      obj,
      (dynamic json) => ItemInserirRapidoSearchResponseDTO.fromJson(json),
    );
  }

  Future<(String message, ItemInserirRapidoGerarInserirResponseDTO item)?>
      inserirRapidoGerarInserir(
    ItemInserirRapidoGerarInserirDTO obj,
  ) async {
    return await _client.post(
      _baseRoute + 'inserir-rapido-gerar-inserir',
      obj,
      (dynamic json) => ItemInserirRapidoGerarInserirResponseDTO.fromJson(json),
    );
  }

  Future<(String message, ItemTrocarEtiquetaResponseDTO item)?>
      trocarEtiqueta(
    ItemTrocarEtiquetaDTO obj,
  ) async {
    return await _client.post(
      _baseRoute + 'trocar-etiqueta',
      obj,
      (dynamic json) => ItemTrocarEtiquetaResponseDTO.fromJson(json),
    );
  }

    Future<(String, List<ItemDropDownSearchResponseDTO>)?> dropDownSearch(
    ItemDropDownSearchDTO dto,
  ) async =>
      await _client.post(
        _baseRoute + 'drop-down-search',
        dto,
        (dynamic json) => (json as List<dynamic>)
            .map((e) => ItemDropDownSearchResponseDTO.fromJson(e))
            .toList(),
      );
}
