import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:ageiscme_models/main.dart';

class EquipamentoManutencaoService {
  final CustomDio _client = CustomDio();

  EquipamentoManutencaoService();

  Future<List<EquipamentoManutencaoModel>> GetAll() async =>
      (await _client.getList('/equipamento-manutencao'))
          .map((e) => EquipamentoManutencaoModel.fromJson(e))
          .toList();

  Future<EquipamentoManutencaoModel?> FilterOne(
    EquipamentoManutencaoFilter filter,
  ) async =>
      await _client.postFilter(
        '/equipamento-manutencao/filter-one',
        filter,
        (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
      );

  Future<(String message, EquipamentoManutencaoModel equipamentoManutencao)?>
      save(
    EquipamentoManutencaoModel obj,
  ) async {
    return await _client.post(
      '/equipamento-manutencao',
      obj,
      (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
    );
  }

  Future<(String message, EquipamentoManutencaoModel equipamentoManutencao)?>
      delete(
    EquipamentoManutencaoModel obj,
  ) async {
    return await _client.delete(
      '/equipamento-manutencao/${obj.cod}',
      obj,
      (dynamic json) => EquipamentoManutencaoModel.fromJson(json),
    );
  }
}
