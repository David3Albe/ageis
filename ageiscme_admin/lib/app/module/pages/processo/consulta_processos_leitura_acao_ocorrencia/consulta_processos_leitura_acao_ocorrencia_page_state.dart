import 'package:ageiscme_models/query_filters/processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_acao_ocorrencia/consulta_processos_leitura_acao_ocorrencia_model.dart';
import 'package:ageiscme_data/query_services/processos_leitura_acao_ocorrencia/processos_leitura_acao_ocorrencia_service.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraAcaoOcorrenciaPageCubit
    extends Cubit<ConsultaProcessosLeituraAcaoOcorrenciaPageState> {
  final ConsultaProcessosLeituraAcaoOcorrenciaService service;
  ConsultaProcessosLeituraAcaoOcorrenciaPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraAcaoOcorrenciaPageState(
            acoesOcorrencias: [],
            loading: false,
          ),
        );

  void loadAcaoOcorrencia(
    ConsultaProcessosLeituraAcaoOcorrenciaFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraAcaoOcorrenciaPageState(
        loading: true,
        acoesOcorrencias: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraAcaoOcorrenciaModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraAcaoOcorrenciaModel> acoesOcorrencias =
          itens.$2;
      emit(
        ConsultaProcessosLeituraAcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencias: acoesOcorrencias,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraAcaoOcorrenciaPageState(
          loading: false,
          acoesOcorrencias: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraAcaoOcorrenciaPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraAcaoOcorrenciaModel> acoesOcorrencias;
  final String error;
  final String message;

  ConsultaProcessosLeituraAcaoOcorrenciaPageState({
    required this.loading,
    required this.acoesOcorrencias,
    this.error = '',
    this.message = '',
  });
}
