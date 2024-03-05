import 'package:ageiscme_data/query_services/processo_resposta_epcepi/consulta_processo_resposta_epcepi_service.dart';
import 'package:ageiscme_models/query_filters/processo_resposta_epcepi/consulta_processo_resposta_epcepi_filter.dart';
import 'package:ageiscme_models/query_models/processo_resposta_epcepi/consulta_processo_resposta_epcepi_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessoRespostaEPCEPIPageCubit
    extends Cubit<ConsultaProcessoRespostaEPCEPIPageState> {
  final ConsultaProcessoRespostaEPCEPIService service;
  ConsultaProcessoRespostaEPCEPIPageCubit({required this.service})
      : super(
          ConsultaProcessoRespostaEPCEPIPageState(
            processosRespostas: [],
            loading: false,
          ),
        );

  void loadMotivoRemoverReporItem(
    ConsultaProcessoRespostaEPCEPIFilter filter,
  ) async {
    emit(
      ConsultaProcessoRespostaEPCEPIPageState(
        loading: true,
        processosRespostas: [],
      ),
    );
    try {
      (String, List<ConsultaProcessoRespostaEPCEPIModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaProcessoRespostaEPCEPIModel> processosRespostas = itens.$2;
      emit(
        ConsultaProcessoRespostaEPCEPIPageState(
          loading: false,
          processosRespostas: processosRespostas,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessoRespostaEPCEPIPageState(
          loading: false,
          processosRespostas: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessoRespostaEPCEPIPageState {
  final bool loading;
  final List<ConsultaProcessoRespostaEPCEPIModel> processosRespostas;
  final String error;
  final String message;

  ConsultaProcessoRespostaEPCEPIPageState({
    required this.loading,
    required this.processosRespostas,
    this.error = '',
    this.message = '',
  });
}
