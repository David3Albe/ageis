import 'package:ageiscme_data/query_services/processos_leitura/consulta_processos_leitura_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraPageCubit
    extends Cubit<ConsultaProcessosLeituraPageState> {
  final ConsultaProcessosLeituraService service;
  ConsultaProcessosLeituraPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraPageState(
            processosLeituras: [],
            loading: false,
          ),
        );

  void loadProcessoLeitura(ConsultaProcessosLeituraFilter filter) async {
    emit(
      ConsultaProcessosLeituraPageState(
        loading: true,
        processosLeituras: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraModel> processosLeituras = itens.$2;
      emit(
        ConsultaProcessosLeituraPageState(
          loading: false,
          processosLeituras: processosLeituras,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraPageState(
          loading: false,
          processosLeituras: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraModel> processosLeituras;
  final String error;
  final String message;

  ConsultaProcessosLeituraPageState({
    required this.loading,
    required this.processosLeituras,
    this.error = '',
    this.message = '',
  });
}
