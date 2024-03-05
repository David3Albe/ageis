import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_model.dart';

class ConsultaProcessosLeituraAcaoOcorrenciaService {
  final CustomDio _client = CustomDio();

  ConsultaProcessosLeituraAcaoOcorrenciaService();

  Future<
      (
        String message,
        List<ConsultaProcessosLeituraAcaoOcorrenciaModel> itens
      )?> filter(
    ConsultaProcessosLeituraAcaoOcorrenciaFilter obj,
  ) async {
    return await _client.post(
      '/consulta-processo-leitura-acao-ocorrencia',
      obj,
      (dynamic json) => (json as List<dynamic>)
          .map((e) => ConsultaProcessosLeituraAcaoOcorrenciaModel.fromJson(e))
          .toList(),
    );
  }
}
