import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class ProcessoMotivoService {
  final CustomDio _client = CustomDio();

  ProcessoMotivoService();

  Future<List<ProcessoMotivoModel>> GetAll() async =>
      (await _client.getList('/processo-motivo'))
          .map((e) => ProcessoMotivoModel.fromJson(e))
          .toList();

  Future<(String message, ProcessoMotivoModel processoMotivo)?> save(
    ProcessoMotivoModel obj,
  ) async {
    return await _client.post(
      '/processo-motivo',
      obj,
      (dynamic json) => ProcessoMotivoModel.fromJson(json),
    );
  }

  Future<(String message, ProcessoMotivoModel processoMotivo)?> delete(
    ProcessoMotivoModel obj,
  ) async {
    return await _client.delete(
      '/processo-motivo/${obj.cod}',
      obj,
      (dynamic json) => ProcessoMotivoModel.fromJson(json),
    );
  }
}
