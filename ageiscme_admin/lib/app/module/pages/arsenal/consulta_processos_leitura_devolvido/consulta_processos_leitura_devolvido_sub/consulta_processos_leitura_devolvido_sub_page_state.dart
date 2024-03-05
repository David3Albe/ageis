import 'package:ageiscme_data/query_services/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_devolvido_sub/consulta_processos_leitura_devolvido_sub_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraDevolvidoSubPageCubit
    extends Cubit<ConsultaProcessosLeituraDevolvidoSubPageState> {
  final ConsultaProcessosLeituraDevolvidoSubService service;
  ConsultaProcessosLeituraDevolvidoSubPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraDevolvidoSubPageState(
            processosLeiturasDevolvidos: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraDevolvidoSub(
    ConsultaProcessosLeituraDevolvidoSubFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDevolvidoSubPageState(
        loading: true,
        processosLeiturasDevolvidos: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraDevolvidoSubModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraDevolvidoSubModel>
          processosLeiturasDevolvidos = itens.$2;
      emit(
        ConsultaProcessosLeituraDevolvidoSubPageState(
          loading: false,
          processosLeiturasDevolvidos: processosLeiturasDevolvidos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDevolvidoSubPageState(
          loading: false,
          processosLeiturasDevolvidos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDevolvidoSubPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraDevolvidoSubModel>
      processosLeiturasDevolvidos;
  final String error;
  final String message;

  ConsultaProcessosLeituraDevolvidoSubPageState({
    required this.loading,
    required this.processosLeiturasDevolvidos,
    this.error = '',
    this.message = '',
  });
}
