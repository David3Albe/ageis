import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/kit/kit_etiqueta_preparo/kit_etiqueta_preparo_dto.dart';
import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:ageiscme_models/dto/kit/mesma_cor/kit_mesma_cor_dto.dart';
import 'package:ageiscme_models/filters/kit/kit_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/mesma_cor/kit_mesma_cor_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_response_dto.dart';

class KitService {
  final CustomDio _client = CustomDio();
  static const String _baseRoute = '/kit/';

  KitService();

  Future<List<KitModel>> GetAll() async => (await _client.getList(_baseRoute))
      .map((e) => KitModel.fromJson(e))
      .toList();

  Future<KitModel?> FilterOne(
    KitFilter filter,
  ) async =>
      await _client.postFilter(
        _baseRoute + 'filter-one',
        filter,
        (dynamic json) => KitModel.fromJson(json),
      );

  Future<(String, KitSearchResponseDTO)?> search({
    required KitSearchDTO dto,
  }) async =>
      await _client.post(
        _baseRoute + 'search',
        dto,
        (dynamic json) => KitSearchResponseDTO.fromJson(json),
      );

  Future<(String, List<KitDropDownSearchResponseDTO>)?> getDropDownSearchKits(
    KitDropDownSearchDTO dto,
  ) async =>
      await _client.post(
        _baseRoute + 'drop-down-search',
        dto,
        (dynamic json) => (json as List<dynamic>)
            .map((e) => KitDropDownSearchResponseDTO.fromJson(e))
            .toList(),
      );

  Future<(String, KitEtiquetaPreparoResponseDTO)?> getEtiquetaPreparo({
    required KitEtiquetaPreparoDTO dto,
  }) async =>
      await _client.post(
        _baseRoute + 'etiqueta-preparo',
        dto,
        (dynamic json) => KitEtiquetaPreparoResponseDTO.fromJson(json),
      );

  Future<(String, KitMesmaCorResponseDTO)?> mesmaCor({
    required KitMesmaCorDTO dto,
  }) async =>
      await _client.post(
        _baseRoute + 'mesma-cor',
        dto,
        (dynamic json) => KitMesmaCorResponseDTO.fromJson(json),
      );

  Future<(String message, KitModel kit)?> save(
    KitModel obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => KitModel.fromJson(json),
    );
  }

  Future<(String message, KitModel? kit)?> delete(
    KitModel obj,
  ) async {
    return await _client.delete(
      _baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => KitModel.fromJson(json),
    );
  }
}
