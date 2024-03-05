import 'package:ageiscme_data/query_services/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraEntradaAutomaticaPageCubit
    extends Cubit<ConsultaProcessosLeituraEnrtradaAutomaticaPageState> {
  final ConsultaProcessosLeituraEntradaAutomaticaService service;
  ConsultaProcessosLeituraEntradaAutomaticaPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
            entradasAutomaticas: [],
            loading: false,
          ),
        );

  void loadEntradaAutomatica(
    ConsultaProcessosLeituraEntradaAutomaticaFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
        loading: true,
        entradasAutomaticas: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraEntradaAutomaticaModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraEntradaAutomaticaModel> entradasAutomaticas =
          itens.$2;
      for (ConsultaProcessosLeituraEntradaAutomaticaModel entrada
          in entradasAutomaticas) {
        entrada.cancelar = false;
      }
      emit(
        ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
          loading: false,
          entradasAutomaticas: entradasAutomaticas,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
          loading: false,
          entradasAutomaticas: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void changeList(
    List<ConsultaProcessosLeituraEntradaAutomaticaModel> itens,
  ) async {
    emit(
      ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
        loading: true,
        entradasAutomaticas: [],
      ),
    );
    emit(
      ConsultaProcessosLeituraEnrtradaAutomaticaPageState(
        loading: false,
        entradasAutomaticas: itens,
      ),
    );
  }
}

class ConsultaProcessosLeituraEnrtradaAutomaticaPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraEntradaAutomaticaModel>
      entradasAutomaticas;
  final String error;
  final String message;

  ConsultaProcessosLeituraEnrtradaAutomaticaPageState({
    required this.loading,
    required this.entradasAutomaticas,
    this.error = '',
    this.message = '',
  });
}
