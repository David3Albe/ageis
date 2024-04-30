import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/main.dart';

class EquipamentoManutencaoService {
  final CustomDio _client = CustomDio();
  static const baseRoute = '/equipamento-manutencao/';

  EquipamentoManutencaoService();

  Future<List<EquipamentoManutencaoModel>> GetAll() async =>
      (await _client.getList(baseRoute))
          .map((e) => EquipamentoManutencaoModel.fromJson(e))
          .toList();

  Future<EquipamentoManutencaoModel?> FilterOne(
    EquipamentoManutencaoFilter filter,
  ) async =>
      await _client.postFilter(
        baseRoute + 'filter-one',
        filter,
        (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
      );

  Future<List<EquipamentoManutencaoModel>> GetScreenData(
    EquipamentoManutencaoFilter filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'get-screen-data',
        filter,
      ))
          .map((e) => EquipamentoManutencaoModel.fromJson(e))
          .toList();

  Future<List<EquipamentoManutencaoModel>> Filter(
    EquipamentoManutencaoFilter filter,
  ) async =>
      (await _client.postList(
        baseRoute + 'filter',
        filter,
      ))
          .map((e) => EquipamentoManutencaoModel.fromJson(e))
          .toList();

  Future<(String message, EquipamentoManutencaoModel equipamentoManutencao)?>
      save(
    EquipamentoManutencaoModel obj,
  ) async {
    return await _client.post(
      baseRoute,
      obj,
      (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
    );
  }

  Future<(String message, EquipamentoManutencaoModel equipamentoManutencao)?>
      delete(
    EquipamentoManutencaoModel obj,
  ) async {
    return await _client.delete(
      baseRoute + '${obj.cod}',
      obj,
      (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
    );
  }
}
