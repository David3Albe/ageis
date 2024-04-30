import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/equipamento/drop_down_search/equipamento_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/equipamento/drop_down_search/equipamento_drop_down_search_response_dto.dart';

class EquipamentoService {
  final CustomDio _client = CustomDio();
  static const _baseRoute = '/equipamento/';

  EquipamentoService();

  Future<List<EquipamentoModel>> GetAll() async =>
      (await _client.getList(_baseRoute))
          .map((e) => EquipamentoModel.fromJson(e))
          .toList();

  Future<List<EquipamentoModel>> Filter(EquipamentoFilter filter) async =>
      (await _client.postList(_baseRoute + 'filter', filter))
          .map((e) => EquipamentoModel.fromJson(e))
          .toList();

  Future<(String, List<EquipamentoDropDownSearchResponseDTO>)?> getDropDownSearch(
    EquipamentoDropDownSearchDTO dto,
  ) async =>
      await _client.post(
        _baseRoute + 'drop-down-search',
        dto,
        (dynamic json) => (json as List<dynamic>)
            .map((e) => EquipamentoDropDownSearchResponseDTO.fromJson(e))
            .toList(),
      );

  Future<(String message, EquipamentoModel equipamento)?> save(
    EquipamentoModel obj,
  ) async {
    return await _client.post(
      _baseRoute,
      obj,
      (dynamic json) => EquipamentoModel.fromJson(json),
    );
  }

  Future<(String message, EquipamentoModel equipamento)?> delete(
    EquipamentoModel obj,
  ) async {
    return await _client.delete(
      _baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => EquipamentoModel.fromJson(json),
    );
  }
}
