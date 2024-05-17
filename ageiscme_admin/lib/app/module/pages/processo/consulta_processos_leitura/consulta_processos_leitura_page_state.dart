import 'package:ageiscme_data/query_services/processos_leitura/consulta_processos_leitura_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_response_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraPageCubit
    extends Cubit<ConsultaProcessosLeituraPageState> {
  final ConsultaProcessosLeituraService service;
  ConsultaProcessosLeituraPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraPageState(
            response: null,
            loading: false,
          ),
        );

  void loadProcessoLeitura(ConsultaProcessosLeituraFilter filter) async {
    emit(
      ConsultaProcessosLeituraPageState(
        loading: true,
        response: null,
      ),
    );
    try {
      (String, ConsultaProcessosLeituraResponseModel)? response =
          await service.filter(
        filter,
      );
      if (response == null) {
        emit(
          ConsultaProcessosLeituraPageState(
            loading: false,
            response: state.response,
          ),
        );
        return;
      }

      ConsultaProcessosLeituraResponseModel processosLeituras = response.$2;
      emit(
        ConsultaProcessosLeituraPageState(
          loading: false,
          response: processosLeituras,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraPageState(
          loading: false,
          response: state.response,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraPageState {
  final bool loading;
  final ConsultaProcessosLeituraResponseModel? response;
  final String error;
  final String message;

  ConsultaProcessosLeituraPageState({
    required this.loading,
    required this.response,
    this.error = '',
    this.message = '',
  });
}
