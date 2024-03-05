import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class MotivoRemoverReporItemService {
  final CustomDio _client = CustomDio();

  MotivoRemoverReporItemService();

  Future<List<MotivoRemoverReporItemModel>> GetAll() async =>
      (await _client.getList('/motivo-remover-repor-item'))
          .map((e) => MotivoRemoverReporItemModel.fromJson(e))
          .toList();

  Future<(String message, MotivoRemoverReporItemModel motivoRemoverReporItem)?>
      save(
    MotivoRemoverReporItemModel obj,
  ) async {
    return await _client.post(
      '/motivo-remover-repor-item',
      obj,
      (dynamic json) => MotivoRemoverReporItemModel.fromJson(json),
    );
  }

  Future<(String message, MotivoRemoverReporItemModel motivoRemoverReporItem)?>
      delete(
    MotivoRemoverReporItemModel obj,
  ) async {
    return await _client.delete(
      '/motivo-remover-repor-item/${obj.cod}',
      obj,
      (dynamic json) => MotivoRemoverReporItemModel.fromJson(json),
    );
  }
}
