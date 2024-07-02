import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/afastamento/afastamento_filter.dart';
import 'package:ageiscme_models/models/afastamento/afastamento_model.dart';

class AfastamentoService {
  final CustomDio _client = CustomDio();
  static const String base_route = '/afastamento/';

  AfastamentoService();

  Future<List<AfastamentoModel>> GetScreenData(
    AfastamentoFilter filter,
  ) async =>
      (await _client.postList(base_route + 'screen-data', filter))
          .map((e) => AfastamentoModel.fromJson(e))
          .toList();

  Future<AfastamentoModel?> FilterOne(
    AfastamentoFilter filter,
  ) async =>
      await _client.postFilter(
        base_route + 'filter-one',
        filter,
        (dynamic json) => AfastamentoModel.fromJson(json),
      );

  Future<(String message, AfastamentoModel afastamento)?> save(
    AfastamentoModel obj,
  ) async {
    return await _client.post(
      base_route,
      obj,
      (dynamic json) => AfastamentoModel.fromJson(json),
    );
  }

  Future<(String message, AfastamentoModel afastamento)?> delete(
    AfastamentoModel obj,
  ) async {
    return await _client.delete(
      base_route + '${obj.cod}',
      obj,
      (dynamic json) => AfastamentoModel.fromJson(json),
    );
  }
}
