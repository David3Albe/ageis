import 'package:ageiscme_data/query_services/processos_leitura_tamanho_sub/processos_leitura_tamanho_sub_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_tamanho_sub/consulta_processos_leitura_tamanho_sub_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraTamanhoSubPageCubit
    extends Cubit<ConsultaProcessosLeituraTamanhoSubPageState> {
  final ConsultaProcessosLeituraTamanhoSubService service;
  ConsultaProcessosLeituraTamanhoSubPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraTamanhoSubPageState(
            processosLeiturasTamanhos: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraTamanho(
    ConsultaProcessosLeituraTamanhoSubFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraTamanhoSubPageState(
        loading: true,
        processosLeiturasTamanhos: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraTamanhoSubModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraTamanhoSubModel> processosLeiturasTamanhos =
          itens.$2;
      emit(
        ConsultaProcessosLeituraTamanhoSubPageState(
          loading: false,
          processosLeiturasTamanhos: processosLeiturasTamanhos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraTamanhoSubPageState(
          loading: false,
          processosLeiturasTamanhos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraTamanhoSubPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraTamanhoSubModel> processosLeiturasTamanhos;
  final String error;
  final String message;

  ConsultaProcessosLeituraTamanhoSubPageState({
    required this.loading,
    required this.processosLeiturasTamanhos,
    this.error = '',
    this.message = '',
  });
}
