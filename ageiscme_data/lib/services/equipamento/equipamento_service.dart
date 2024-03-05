import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';

class EquipamentoService {
  final CustomDio _client = CustomDio();

  EquipamentoService();

  Future<List<EquipamentoModel>> GetAll() async =>
      (await _client.getList('/equipamento'))
          .map((e) => EquipamentoModel.fromJson(e))
          .toList();

  Future<List<EquipamentoModel>> Filter(EquipamentoFilter filter) async =>
      (await _client.postList('/equipamento/filter', filter))
          .map((e) => EquipamentoModel.fromJson(e))
          .toList();

  Future<(String message, EquipamentoModel equipamento)?> save(
    EquipamentoModel obj,
  ) async {
    return await _client.post(
      '/equipamento',
      obj,
      (dynamic json) => EquipamentoModel.fromJson(json),
    );
  }

  Future<(String message, EquipamentoModel equipamento)?> delete(
    EquipamentoModel obj,
  ) async {
    return await _client.delete(
      '/equipamento/${obj.cod}',
      obj,
      (dynamic json) => EquipamentoModel.fromJson(json),
    );
  }
}
