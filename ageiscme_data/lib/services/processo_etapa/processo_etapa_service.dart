import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';

class ProcessoEtapaService {
  final CustomDio _client = CustomDio();

  ProcessoEtapaService();

  Future<List<ProcessoEtapaModel>> GetAll() async =>
      (await _client.getList('/processo-etapa'))
          .map((e) => ProcessoEtapaModel.fromJson(e)) 
          .toList();

  Future<List<ProcessoEtapaModel>> Filter(ProcessoEtapaFilter filter) async =>
      (await _client.postList('/processo-etapa/filter', filter))
          .map((e) => ProcessoEtapaModel.fromJson(e))
          .toList();

  Future<(String message, ProcessoEtapaModel processoEtapa)?> save(
    ProcessoEtapaModel obj,
  ) async {
    return await _client.post(
      '/processo-etapa',
      obj,
      (dynamic json) => ProcessoEtapaModel.fromJson(json),
    );
  }

  Future<(String message, ProcessoEtapaModel processoEtapa)?> delete(
    ProcessoEtapaModel obj,
  ) async {
    return await _client.delete(
      '/processo-etapa/${obj.cod}',
      obj,
      (dynamic json) => ProcessoEtapaModel.fromJson(json),
    );
  }
}
