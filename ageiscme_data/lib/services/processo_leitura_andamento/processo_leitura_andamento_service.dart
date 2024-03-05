import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/filters/processo_leitura_andamento/processo_leitura_andamento_filter.dart';
import 'package:ageiscme_models/models/processo_leitura_andamento/processo_leitura_andamento_model.dart';

class ProcessoLeituraAndamentoService {
  final CustomDio _client = CustomDio();

  ProcessoLeituraAndamentoService();

  void disableThrowException() => _client.DisableExceptionService();

  Future<List<ProcessoLeituraAndamentoModel>> Filter(
    ProcessoLeituraAndamentoFilter filter,
  ) async =>
      (await _client.postList('/processo-leitura-andamento/filter', filter))
          .map((e) => ProcessoLeituraAndamentoModel.fromJson(e))
          .toList();

  Future<(String message, ProcessoLeituraAndamentoModel leituraAndamento)?>
      delete(
    ProcessoLeituraAndamentoModel obj,
  ) async {
    return await _client.delete(
      '/processo-leitura-andamento/${obj.cod}',
      obj,
      (dynamic json) => ProcessoLeituraAndamentoModel.fromJson(json),
    );
  }

  Future<(String message, ProcessoLeituraAndamentoModel leituraAndamento)?>
      atualizarTempoUltimaAtualizaoLeituraAndamento(
    ProcessoLeituraAndamentoModel obj,
  ) async {
    return await _client.post(
      '/processo-leitura-andamento/atualizar-tempo-ultima-atualizacao',
      obj,
      (dynamic json) => ProcessoLeituraAndamentoModel.fromJson(json),
    );
  }
}
