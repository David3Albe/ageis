import 'package:ageiscme_data/query_services/processos_leitura_tamanho/processos_leitura_tamanho_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho/consulta_processos_leitura_tamanho_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_tamanho/consulta_processos_leitura_tamanho_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraTamanhoPageCubit
    extends Cubit<ConsultaProcessosLeituraTamanhoPageState> {
  final ConsultaProcessosLeituraTamanhoService service;
  ConsultaProcessosLeituraTamanhoPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraTamanhoPageState(
            processosLeiturasTamanhos: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraTamanho(
    ConsultaProcessosLeituraTamanhoFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraTamanhoPageState(
        loading: true,
        processosLeiturasTamanhos: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraTamanhoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraTamanhoModel> processosLeiturasTamanhos =
          itens.$2;
      emit(
        ConsultaProcessosLeituraTamanhoPageState(
          loading: false,
          processosLeiturasTamanhos: processosLeiturasTamanhos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraTamanhoPageState(
          loading: false,
          processosLeiturasTamanhos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraTamanhoPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraTamanhoModel> processosLeiturasTamanhos;
  final String error;
  final String message;

  ConsultaProcessosLeituraTamanhoPageState({
    required this.loading,
    required this.processosLeiturasTamanhos,
    this.error = '',
    this.message = '',
  });
}
