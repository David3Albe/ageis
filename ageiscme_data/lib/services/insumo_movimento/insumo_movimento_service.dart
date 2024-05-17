import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_dto.dart';
import 'package:ageiscme_models/dto/insumo_movimento/save/insumo_movimento_save_dto.dart';
import 'package:ageiscme_models/filters/insumo_movimento/insumo_movimento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/insumo_movimento/drop_down_search/insumo_movimento_drop_down_search_response_dto.dart';

class InsumoMovimentoService {
  final CustomDio _client = CustomDio();

  InsumoMovimentoService();

  Future<List<InsumoMovimentoModel>> GetAll() async =>
      (await _client.getList('/insumo-movimento'))
          .map((e) => InsumoMovimentoModel.fromJson(e))
          .toList();

  Future<InsumoMovimentoModel?> FilterOne(
    InsumoMovimentoFilter obj,
  ) async {
    return await _client.postFilter(
      '/insumo-movimento/filter-one',
      obj,
      (dynamic json) => InsumoMovimentoModel.fromJson(json),
    );
  }

  Future<List<InsumoMovimentoModel>> Filter(
    InsumoMovimentoFilter filter,
  ) async =>
      (await _client.postList('/insumo-movimento/filter', filter))
          .map((e) => InsumoMovimentoModel.fromJson(e))
          .toList();

  Future<(String message, InsumoMovimentoModel insumoMovimento)?> save(
    InsumoMovimentoSaveDTO obj,
  ) async {
    return await _client.post(
      '/insumo-movimento',
      obj,
      (dynamic json) => InsumoMovimentoModel.fromJson(json),
    );
  }

  Future<(String message, InsumoMovimentoModel insumoMovimento)?> delete(
    InsumoMovimentoModel obj,
  ) async {
    return await _client.delete(
      '/insumo-movimento/${obj.cod}',
      obj,
      (dynamic json) => InsumoMovimentoModel.fromJson(json),
    );
  }

  Future<(String, List<InsumoMovimentoDropDownSearchResponseDTO>)?>
      getDropDownSearchInsumoMovimento(
    InsumoMovimentoDropDownSearchDTO dto,
  ) async {
    return await _client.post(
      '/insumo-movimento/drop-down-search',
      dto,
      (dynamic json) => (json as List<dynamic>)
          .map(
            (e) => InsumoMovimentoDropDownSearchResponseDTO.fromJson(e),
          )
          .toList(),
    );
  }
}
