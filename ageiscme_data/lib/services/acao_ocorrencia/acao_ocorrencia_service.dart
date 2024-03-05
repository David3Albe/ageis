import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/main.dart';

class AcaoOcorrenciaService {
  final CustomDio _client = CustomDio();

  AcaoOcorrenciaService();

  Future<List<AcaoOcorrenciaModel>> GetAll() async =>
      (await _client.getList('/acao-ocorrencia'))
          .map((e) => AcaoOcorrenciaModel.fromJson(e))
          .toList();

  Future<(String message, AcaoOcorrenciaModel acaoOcorrencia)?> save(
    AcaoOcorrenciaModel obj,
  ) async {
    return await _client.post(
      '/acao-ocorrencia',
      obj,
      (dynamic json) => AcaoOcorrenciaModel.fromJson(json),
    );
  }

  Future<(String message, AcaoOcorrenciaModel acaoOcorrencia)?> delete(
    AcaoOcorrenciaModel obj,
  ) async {
    return await _client.delete(
      '/acao-ocorrencia/${obj.cod}',
      obj,
      (dynamic json) => AcaoOcorrenciaModel.fromJson(json),
    );
  }
}
