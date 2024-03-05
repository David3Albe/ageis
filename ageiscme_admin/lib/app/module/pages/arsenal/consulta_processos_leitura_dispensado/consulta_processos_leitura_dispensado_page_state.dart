import 'package:ageiscme_data/query_services/processo_leitura_dispensado/consulta_processo_leitura_dispensado_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_dispensado/consulta_processos_leitura_dispensado_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_dispensado/consulta_processos_leitura_dispensado_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraDispensadoPageCubit
    extends Cubit<ConsultaProcessosLeituraDispensadoPageState> {
  final ConsultaProcessoLeituraDispensadoService service;
  ConsultaProcessosLeituraDispensadoPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraDispensadoPageState(
            processosLeiturasDispensados: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraDispensado(
    ConsultaProcessosLeituraDispensadoFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDispensadoPageState(
        loading: true,
        processosLeiturasDispensados: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraDispensadoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraDispensadoModel>
          processosLeiturasDispensados = itens.$2;
      emit(
        ConsultaProcessosLeituraDispensadoPageState(
          loading: false,
          processosLeiturasDispensados: processosLeiturasDispensados,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDispensadoPageState(
          loading: false,
          processosLeiturasDispensados: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDispensadoPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraDispensadoModel>
      processosLeiturasDispensados;
  final String error;
  final String message;

  ConsultaProcessosLeituraDispensadoPageState({
    required this.loading,
    required this.processosLeiturasDispensados,
    this.error = '',
    this.message = '',
  });
}
