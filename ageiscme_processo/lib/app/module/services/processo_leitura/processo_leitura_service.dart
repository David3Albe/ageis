import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';

class ProcessoLeituraService {
  final LoadingController? loading;
  ProcessoLeituraService({this.loading});

  late final CustomDio _client = CustomDio(loading: loading);

  Future<
      (
        String message,
        ProcessoLeituraMontagemModel leitura,
      )?> ler(
    ProcessoLeituraMontagemModel obj,
  ) async {
    return await _client.post(
      '/processo-leitura-montagem',
      obj,
      (dynamic json) => ProcessoLeituraMontagemModel.fromJson(json),
    );
  }

  Future<
      (
        String message,
        ProcessoLeituraMontagemModel leitura,
      )?> removerLeituraEmAndamento(
    ProcessoLeituraMontagemModel obj,
  ) async {
    return await _client.postWithoutReturn(
      '/processo-leitura-montagem/remover-leitura-em-andamento',
      obj,
    );
  }
}
