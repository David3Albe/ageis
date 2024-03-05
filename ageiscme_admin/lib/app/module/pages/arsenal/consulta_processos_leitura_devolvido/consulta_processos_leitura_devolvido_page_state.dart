import 'package:ageiscme_data/query_services/processos_leitura_devolvido/consulta_processos_leitura_devolvido_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido/consulta_processos_leitura_devolvido_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_devolvido/consulta_processos_leitura_devolvido_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraDevolvidoPageCubit
    extends Cubit<ConsultaProcessosLeituraDevolvidoPageState> {
  final ConsultaProcessosLeituraDevolvidoService service;
  ConsultaProcessosLeituraDevolvidoPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraDevolvidoPageState(
            processosLeiturasDevolvidos: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraDevolvido(
    ConsultaProcessosLeituraDevolvidoFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDevolvidoPageState(
        loading: true,
        processosLeiturasDevolvidos: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraDevolvidoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraDevolvidoModel> processosLeiturasDevolvidos =
          itens.$2;
      emit(
        ConsultaProcessosLeituraDevolvidoPageState(
          loading: false,
          processosLeiturasDevolvidos: processosLeiturasDevolvidos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDevolvidoPageState(
          loading: false,
          processosLeiturasDevolvidos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDevolvidoPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraDevolvidoModel>
      processosLeiturasDevolvidos;
  final String error;
  final String message;

  ConsultaProcessosLeituraDevolvidoPageState({
    required this.loading,
    required this.processosLeiturasDevolvidos,
    this.error = '',
    this.message = '',
  });
}
